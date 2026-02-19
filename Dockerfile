FROM jetbrains/writerside-builder:2025.04.8412 AS build

ARG INSTANCE=Writerside/hi
WORKDIR /opt/sources

COPY . .

RUN export DISPLAY=:99 && \
    Xvfb :99 -screen 0 1280x1024x24 >/tmp/xvfb.log 2>&1 & \
    XVFB_PID=$! && \
    /opt/builder/bin/idea.sh helpbuilderinspect \
        --source-dir /opt/sources \
        --product ${INSTANCE} \
        --runner other \
        --output-dir /opt/sources/.artifacts && \
    kill "${XVFB_PID}" || true

RUN INSTANCE_ID=$(echo "${INSTANCE##*/}" | tr '[:lower:]' '[:upper:]') && \
    unzip -O UTF-8 -qq "/opt/sources/.artifacts/webHelp${INSTANCE_ID}2-all.zip" -d /opt/sources/.site

FROM nginx:1.27-alpine AS runtime

COPY --from=build /opt/sources/.site/ /usr/share/nginx/html/
EXPOSE 80

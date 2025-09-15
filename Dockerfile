FROM python:3.13-slim
WORKDIR /app
VOLUME /config
RUN python3 -m pip install --upgrade pip setuptools
RUN apt update && apt install -y nodejs npm && apt clean
RUN rm -rf /var/lib/apt/lists/*
RUN apt clean && apt autoremove
RUN npm i npx
RUN pip install mcpo uv
COPY ./config.json /config/
ENV PORT 8000
ENV HOST 0.0.0.0
CMD uvx mcpo --host ${HOST} --port ${PORT} --config /config/config.json
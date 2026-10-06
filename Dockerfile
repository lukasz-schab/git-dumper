# git-dumper itself, containerized so changes can be tested without a
# local Python/deps setup.
FROM python:3.12-slim@sha256:05cda9777409a9c3ffddd94a4c476b79f0769a0b4857f0c7ed9226b6800b0d6f

RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY git_dumper.py /app/git_dumper.py

ENTRYPOINT ["python", "/app/git_dumper.py"]

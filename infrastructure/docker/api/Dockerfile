FROM python:3.13-slim AS builder

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

WORKDIR /build

RUN apt-get update && \
apt-get install \
-y \
build-essential \
gcc \
libpq-dev \
&& rm -rf /var/lib/apt/lists/*

COPY apps/api/requirements.txt .

RUN python -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

RUN pip install \
--upgrade pip \
&& pip install \
--no-cache-dir \
-r requirements.txt


FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /app

RUN apt-get update && \
apt-get install \
-y \
curl \
libpq5 \
&& rm -rf /var/lib/apt/lists/*

COPY \
--from=builder \
/opt/venv \
/opt/venv

RUN addgroup \
--system app && \
adduser \
--system \
--ingroup app \
app

COPY apps/api .

RUN chown \
-R app:app \
/app

USER app

EXPOSE 8000

HEALTHCHECK \
--interval=30s \
--timeout=5s \
--start-period=20s \
--retries=3 \
CMD curl \
-f \
http://localhost:8000/health \
|| exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
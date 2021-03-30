FROM python:3.8-slim as build-base

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app
COPY . /app

RUN useradd appuser && chown -R appuser /app
USER appuser

ENV FLASK_APP=hello

CMD ["flask", "run", "-h", "0.0.0.0", "-p", "8000"]

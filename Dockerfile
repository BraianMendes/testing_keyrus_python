FROM python:3.12-slim

WORKDIR /app

COPY pyproject.toml pdm.lock /app/

RUN pip install pdm && pdm install --dev

ENV PATH="/app/.venv/bin:$PATH"

COPY . /app

CMD ["pdm", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
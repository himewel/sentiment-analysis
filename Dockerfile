FROM python:3.8-slim

ENV PATH "/root/.poetry/bin:${PATH}"

COPY pyproject.toml .

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
        gcc \
        g++ \
        curl \
    && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
        | python - \
    && poetry install --no-dev

COPY src ./src
COPY models/fasttext-3.ftz ./models/fasttext-3.ftz

EXPOSE 5000

CMD poetry run gunicorn \
    --workers 8  \
    --bind 0.0.0.0:5000 \
    src:app

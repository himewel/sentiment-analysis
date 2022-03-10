SHELL:=/bin/bash
TF_BACKEND=tf-backend-080222
DATA_BUCKET=sentiment-analysis-240222

.PHONY: train
train:
	python src/train.py

.PHONY: push
push:
	gsutil -m cp -r models gs://${DATA_BUCKET}/models

.PHONY: pull
pull:
	gsutil -m rsync -r gs://${DATA_BUCKET}/ .

.PHONY: tf-backend
tf-backend:
	gsutil ls -b gs://${TF_BACKEND} \
		|| gsutil mb gs://${TF_BACKEND}

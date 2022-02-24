SHELL:=/bin/bash

.PHONY: train
train:
	python src/train.py

.PHONY: push
push:
	gsutil -m cp -r models gs://sentiment-analysis-240222/models

.PHONY: pull
pull:
	gsutil -m rsync -r gs://sentiment-analysis-240222/ .

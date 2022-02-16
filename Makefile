SHELL:=/bin/bash

.PHONY: train
train:
	python src/train.py

.PHONY: push
push:
	aws s3 cp models -s3://sentiment-analysis-150222/models

.PHONY: pull
pull:
	aws s3 sync --no-progress s3://sentiment-analysis-150222/ .

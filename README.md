## How to start

Download the dataset files stored at `s3://sentiment-analysis-150222` with the following make target:

```shell
make pull
```

Create a virtual environment to install the python dependencies:

```bash
python3.8 -m venv .venv
```

Then, enter into the virtual environment shell:

```bash
source .venv/bin/activate
```

So, you can install the dependencies:

```bash
pip install \
    --no-cache-dir \
    --requirements ./requirements.txt
```

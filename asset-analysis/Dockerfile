FROM python:3

WORKDIR .

COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt

COPY prices.csv ./
COPY analysis.py ./

CMD ["python3", "./analysis.py"]

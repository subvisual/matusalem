# matusalem

## Frontend

## Funds

## Asset Analysis

<img src="assets/pandas-cod.jpg" width="100" />

1. Explain how we get prices
2. Explain how to run the data analysis on Bacalhau

```bash
docker build -t finiam/matusalem-analysis15 . --platform linux/amd64
docker push finiam/matusalem-analysis15

bacalhau docker run finiam/matusalem-analysis15

# example result that you can check
# bacalhau get 80c51fcb-87b0-4eba-a2d4-e2ca3c0eca82
# bacalhau describe 80c51fcb-87b0-4eba-a2d4-e2ca3c0eca82
# 
# https://ipfs.io/ipfs/QmW9h1vJ7CSvfcYRt1fFJeVmeu63uNAjkBkU78b2ieGjhH/outputs
```

## Genetic Algorithms

1. Use that data to run Genetic Algorithms to optimize for Sharpe Ratio
  1.1 Explain that most part of the code is from the book: "Genetic Algorithms in Elixir" from Sean Moriarity 

```bash
docker build -t finiam/matusalem-genetic2 . --platform linux/amd64
docker push finiam/matusalem-genetic2

bacalhau docker run finiam/matusalem-genetic2

# bacalhau get 4db92773-135f-4053-b7a7-292b2dc36c95
# bacalhau describe 4db92773-135f-4053-b7a7-292b2dc36c95
```

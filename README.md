# matusalem

<img src="assets/trader.jpg" width="200" />
(futuristic hedge fund trader)

https://glittery-narwhal-c50b36.netlify.app/

## Protocol

<p align="center">
  <img src="assets/protocol-analysis.png" width="500" />
</p>

<p align="center">
  <img src="assets/chicken-bond1.png" width="500" />
</p>

## Asset Analysis

<img src="assets/pandas-cod.jpg" width="200" />
(pandas running on bacalhau)

### Obtaining historical prices

To generate a csv file with historical prices on a set of tokens you can run the python script:
(we are using the Coingecko API so pay attention to the token id's.)

```
python prices.py uniswap wrapped-bitcoin maker filecoin aave curve-dao-token nexo the-graph sandclock euler
```

This will create a csv called `prices.csv`

### Running data analysis on Bacalhau

Running this job on [bacalhau](https://docs.bacalhau.org/) will calculate correlation between tokens, standard deviations and average asset returns, while outputing this to a file called `final_state.txt`. It also generates an image of the correlations (see the example below to check the outputs). 

This way it can run the computation for larger datasets, improving cost and efficiency.

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

### Developing the Genetic Algorithms
  
Most part of the code is inspired in the book: **Genetic Algorithms in Elixir** by Sean Moriarity [check here](https://pragprog.com/titles/smgaelixir/genetic-algorithms-in-elixir/). It has a bunch of updates in order to adapt to optimizing to asset weights and the fitness function to calculate the Sharpe Ratio.

- [How to calculate Sharpe Ration](https://www.wallstreetmojo.com/portfolio-standard-deviation/)
- [How to calculate Portfolio's Standard Deviation](https://www.wallstreetmojo.com/portfolio-standard-deviation/)

### Running the simulation on Bacalhau

The simulation and calculations for Sharpe Ratio, are quite heavy if we want to run for a big enough population age. This way, we can take advantage of bacalhau.

```bash
docker build -t finiam/matusalem-genetic2 . --platform linux/amd64
docker push finiam/matusalem-genetic2

bacalhau docker run finiam/matusalem-genetic2

# example result that you can check
# bacalhau get 4db92773-135f-4053-b7a7-292b2dc36c95
# bacalhau describe 4db92773-135f-4053-b7a7-292b2dc36c95
```

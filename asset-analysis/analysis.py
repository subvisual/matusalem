#!/usr/bin/env python3

import seaborn
import pandas as pd
import math
import matplotlib.pyplot as plt

with open("outputs/final_state.txt", mode="w") as file:
    data = pd.read_csv('prices.csv')
    data = data.dropna()

    corrMatrix = data.corr()

    seaborn.set(font_scale=1.10)
    plt.figure(figsize=(15, 15))

    seaborn.heatmap(corrMatrix, vmax=.8, linewidths=0.01,
                square=True, annot=True, cmap='viridis', linecolor="white")

    plt.title('Correlation between Assets')
    plt.savefig('outputs/correlations.png')

    file.write('\nCorrelation Matrix\n\n')
    file.write(corrMatrix.to_string())

    file.write("\n\nStandard Deviation\n\n")
    file.write(data.std().to_string())

    file.write("\n\nAverage Returns\n\n")
    for asset in data:
        asset_return = []

        for index in range(len(data[asset].values) - 1):
            return_value = ((data[asset][index + 1] / data[asset][index]) - 1) * 100
            asset_return.append(return_value)

        average = sum(asset_return) / len(asset_return)

        file.write("{}: {}\n".format(asset, average))

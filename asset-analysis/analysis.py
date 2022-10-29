#!/usr/bin/env python3

import seaborn
import pandas as pd
import math

print("Starting...")
data = pd.read_csv('prices.csv')
data = data.dropna()

corrMatrix = data.corr()

# myfile.write('Correlation Matrix \n')

# myfile.write(corrMatrix.to_string())
print(corrMatrix)

for asset in data:
    asset_return = []

    for index in range(len(data[asset].values) - 1):
        return_value = data[asset][index + 1] / data[asset][index]
        asset_return.append(return_value)

    average = sum(asset_return) / len(asset_return)

    variance_elems = []
    for elem in asset_return:
        variance_elems.append((elem - average) ** 2)

    # myfile.write("{}: {}".format(asset, math.sqrt(sum(variance_elems) / (len(asset_return) - 1))))

print("Finishing...")

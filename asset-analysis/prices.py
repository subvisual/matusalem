#!/usr/bin/env python3

import pandas as pd
import numpy as np
import requests
import sys
import time
from datetime import datetime, timedelta

assets = sys.argv
dt = datetime.now()
to_ts = int(datetime.timestamp(dt))
from_ts = int((datetime.today() - timedelta(days=90)).timestamp())
data = {}


del assets[0]

for asset in assets:
  print(asset)
  endpoint = 'https://api.coingecko.com/api/v3/coins/{}/market_chart/range?vs_currency=ETH&from={}&to={}'.format(asset, from_ts, to_ts)
  r =requests.get(endpoint)
  prices = r.json()['prices']

  data[asset] = pd.DataFrame(prices, columns = ["timestamp", "price"]).loc[:,"price"]

  # avoid rate limit from the API and Cloudflare
  time.sleep(2)


pd.DataFrame(data, columns = assets).to_csv('prices.csv', index = False)



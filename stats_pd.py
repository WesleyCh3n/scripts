import numpy as np
import pandas as pd
import string

category = 10
length = 1000
data = np.random.default_rng().integers(0, 100, size=(length, category))

df = pd.DataFrame(data, columns=list(string.ascii_lowercase)[:category])

result = df.describe().T
result.index.name = "category"
result = result.reset_index()
result.index.name = "index"
print(result)

result.to_csv("stats.csv")

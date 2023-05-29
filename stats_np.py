import numpy as np

np.set_printoptions(precision=5, suppress=True)

# create random data
category = 10
length = 1000
data = np.random.default_rng().uniform(0.0, 100.0, size=(category, length))

# calculation
min_val = np.amin(data, 1, keepdims=True)
max_val = np.amax(data, 1, keepdims=True)
q1 = np.quantile(data, 0.25, 1, keepdims=True)
q2 = np.quantile(data, 0.5, 1, keepdims=True)
q3 = np.quantile(data, 0.75, 1, keepdims=True)
mean = np.mean(data, 1, keepdims=True)
std = np.std(data, 1, keepdims=True)

result = np.c_[mean, std, min_val, q1, q2, q3, max_val]
print(result)

np.savetxt("stats.dat", result, fmt="%.5f", delimiter=" ")

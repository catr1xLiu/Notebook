
> [!abstract] Introduction
> ## About Pytorch

**What is Pytorch?**
- Upgrade of NumPy - with **GPU acceleration**
- Automatic differentiation feature - for **neural networks**

**Goal of this note:**

- Understand Pytorch's **Tensor** and **Networks**.
- Train a small neural network!

Python notebooks can be found in the same directory.

```python
import torch
import numpy as np

print("PyTorch version:", torch.__version__)
print("NumPy version:", np.__version__)
```


> [!quote] Definition
> ## Tensors

**Tensors** represents matrices/arrays in memory. It is used to encode inputs, outputs and parameters of a model. It's very similar to `np.array`, but it can run on **GPU/NPUs**.

![[2 - Tensors|100%]]

### Initialize Tensors

```python
data = [[1, 2], [3, 4]]

# Intialize from python array
data_tensor = torch.tensor(data)
print(f"Tensor: \n{data_tensor}")
```

### Bridge with NumPy

Tensors on the CPU can share underlying memory locations with NumPy arrays.

```python
# From numpy array
np_array = np.array(data)
np_tensor = torch.from_numpy(np_array)

# Changes of numpy array will also apply to torch tensor
# Because of shared underlying memory locations
np_array[0, 0] = 2
print(np_tensor)

# Create numpy array from tensor, will also share the same memory address
np_array2 = np_tensor.numpy()
```

### Copy Tensors

```python
# Create a copy (independent memory)
data_tensor_copy = data_tensor.clone()
# Copy without gradients
data_tensor_copy = data_tensor.detach().clone()
```

### Construct matching other tensors

```python
# retians the shape and data type of data_tensor

tensor_ones = torch.ones_like(data_tensor) # Ones tensor
tensor_zeros = torch.zeros_like(data_tensor) # Zeros tensor
tensor_rand = torch.rand_like(data_tensor, dtype=torch.float) # Random Tensor, overwrites datatype to float
print(f"Ones Tensor: \n{tensor_ones}\nZeros Tensor: \n{tensor_zeros}\nRand Tensor: \n{tensor_rand}\n")
```

### Construct as shape

```python
shape = (2, 3) # 2-rows x 3-columns matrix
rand_tensor = torch.rand(shape) # All random floating point numbers
ones_tensor = torch.ones(shape) # All integer ones
zeros_tensor = torch.zeros(shape) # All zeros
# Default type is float

print(f"Random Tensor: \n{rand_tensor}")
print(f"Ones Tensor: \n{ones_tensor}")
print(f"Zeros Tensor: \n{zeros_tensor}")
```

> [!info] Info
> ## Attributes of Tensors

The attribute of a tensor includes:
- Its **shape** (e.g. `3x3`, `10000x1`)
- Its **datatype** (e.g. `int`, `float8`, `float32`)
- The **device** at which the tensor is stored

![[3 - Attributes of Tensors|100%]]

```python
print(f"Shape of Random Tensor: {rand_tensor.shape}")
print(f"Datatype of Random Tensor: {rand_tensor.dtype}")
print(f"Random Tensor is stored at: {rand_tensor.device}")
```

> [!hint] Hint
> ## Tensor Operations

A full list of tensor operations is here: [torch — PyTorch 2.9 documentation](https://docs.pytorch.org/docs/stable/torch.html). All of them can be performed on GPU and is accelerated.

```python
tensor = torch.zeros(6, 6)
if torch.cuda.is_available():
	tensor = tensor.to('cuda:0')
print(f"Tensor is stored on: {tensor.device}")
```

### Indexing and slicing like numpy:

```python
tensor[0, 1] = 1 # set row 0 column 1 to 1
tensor[1,:] = 2 # set entire row 1 to 2
tensor[2,:2] = 3 # in row 2, set column 0-2 to 3
tensor[3,3:] = 4 # in row 3, set column 3-5 to 4

print(f"Row with index 1: {tensor[1,:]}") # second row
print(f"Column with index 1: {tensor[:,1]}") # second column

print(tensor)
```

### joining tensors

We can use `torch.cat` to **concatenate** a sequence of tensors **along a given dimension** to form a larger tensor. 

```python
t1 = torch.tensor([[1, 2], [3, 4]])
t1 = torch.cat([t1, t1], dim=0)
print(f"Tensor after concatenating in dim0: \n{t1}")
t1 = torch.cat([t1, t1], dim=1)
print(f"Tensor after concatenating in dim1: \n{t1}")
```

We can also use `torch.stack` to build a sequence of tensors, this is slightly different

```python
vec = torch.tensor([1, 2, 3, 4])
print(f"Concatenated vector: \n{torch.cat([vec, vec])}")
t1 = torch.cat([t1, t1], dim=1)
print(f"Stacked vector: \n{torch.stack([vec, vec])}")
```

### Math Operations

```python
n = torch.zeros(3, 3)

# Add to every element
n += 3 # or n = n.add(...)

# Add / Subtract each corresponding element
n += torch.ones(3, 3) # Or n = n.add(...)

print(f"N = \n{n}\n")
# Element-wise multiplication
print(f"N mul N = \n{n * n}\n")
# Matrix multiplication
print(f"N dot N = \n{n @ n}\n") # or n.matmul(...)
```

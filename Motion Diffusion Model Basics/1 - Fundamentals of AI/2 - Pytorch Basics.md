
> [!abstract] Introduction
> ## About Pytorch

**What is pytorch?**
- Upgrade of NumPy - with **GPU acceleration**
- Automatic differentiation feature - for **neural networks**

**Goal of this note:**

- Understand Pytorch's **Tensor** and **Networks**.
- Train a small neural network!

Python notebooks can be found in the same directory.


> [!quote] Definition
> ## Tensors

**Tensors** represents matrices/arrays in memory. It is used to encode inputs, outputs and parameters of a model. It's very similar to `np.array`, but it can run on **GPU/NPUs**.

![[2 - Tensors|90%]]


### Initializing Tensors:

```python
data = [[1, 2], [3, 4]]
x_data = torch.tensor(data)
```

--- start-multi-column: ExampleRegion1  
```column-settings  
number of columns: 2  
largest column: left  
```

Text displayed in column 1.

--- end-column ---

Text displayed in column 2.

--- end-multi-column

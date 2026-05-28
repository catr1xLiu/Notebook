
---

> [!fact] Theorem
> ## Fundamentals of Neural Networks

<u><strong style="color:#dab1da">Neural Networks</strong></u> are the fundamental algorithm behind Artificial Intelligence. They have a special structure that can be graphically represented as a large set of connected nodes forming a network.

![[2.1 - Network1|100%]]

### Network Structure

The neural network consists of three types of layers:

1. **Input Layer**: The input is preprocessed into a set of values between $0$ and $1$, forming the first layer. Preprocessing can be highly complex depending on the task. ![[2.4 - Input Layer.png|500]]

2. **Hidden Layers**: One or more intermediate layers that extract progressively abstract features from the input.

3. **Output Layer**: Produces the final predictions. For digit classification, this has $10$ neurons (one per digit), where the activation of each neuron represents the network's confidence that the input is that digit.

### Neurons and Activation

Each <u><strong style="color:#dab1da">neuron</strong></u> is a node in the graph. Its **activation** (a value between $0$ and $1$) represents how "active" or excited the neuron is. We can visualize this using brightness—higher activation means brighter.

![[2.2 - Neuron|100%]]

We represent neuron activation visually with brightness, where $0$ (black) means inactive and $1$ (white) means fully active.
![[2.3 - Activations.svg|500]]

> [!info] Info
> ## Forward Propagation (Inference)

In forward prop, the NN makes its best guess about the correct output. It runs the input data through each of its functions to make this guess.

### Computing Neuron Activations

The activation of a neuron in layer $\ell$ is computed from all neurons in layer $\ell-1$ through the following process:

#### Step 1: Weighted Sum

Each connection from a neuron in the previous layer has an associated **weight**. We compute a weighted sum of all previous layer activations:

$$
z = w_1 a_1 + w_2 a_2 + w_3 a_3 + \cdots + w_n a_n
$$

where $w_i$ are weights and $a_i$ are activations from the previous layer.

#### Step 2: Add Bias

We add a **bias** term, which acts as a threshold that shifts when the neuron becomes active:

$$
z' = z + b
$$

The bias controls how easily the neuron activates. A large negative bias means the weighted sum must be quite large before the neuron activates.

#### Step 3: Apply Sigmoid (Squishification)

The weighted sum $z'$ can be any real number, but we need the final activation to be between $0$ and $1$. We apply the <u><strong style="color:#dab1da">sigmoid function</strong></u> $\sigma$ to squish the output into this range, where $\sigma(x) = \frac{1}{1 + e^{-x}}$

![[2.3 - Sigmoid|100%]]

#### Final Neuron Activation Formula

Combining all steps, the activation of a neuron is:

$$ a = \sigma(z + b) = \sigma\left(\sum_{i=1}^{n} \color{#8a2f8a}w_i\color{black} \color{black}a_i\color{black} + \color{#ff8c00}b\color{black}\right) = \frac{1}{1 + e^{-(\sum_{i=1}^{n} \color{#8a2f8a}w_i\color{black} \color{black}a_i\color{black} + \color{#ff8c00}b\color{black})}} $$

In practice, to compute all neurons in a layer simultaneously, we organize activations into a vector $\mathbf{a}^{(\ell-1)}$, weights into a matrix $W$, and biases into a vector $\mathbf{b}$. The activations of the next layer are then:
$$ \mathbf{a}^{(1)} = \sigma\left( \begin{bmatrix} \color{#8a2f8a}w_{0,0}\color{black} & \color{#8a2f8a}w_{0,1}\color{black} & \cdots & \color{#8a2f8a}w_{0,n}\color{black} \\ \color{#8a2f8a}w_{1,0}\color{black} & \color{#8a2f8a}w_{1,1}\color{black} & \cdots & \color{#8a2f8a}w_{1,n}\color{black} \\ \vdots & \vdots & \ddots & \vdots \\ \color{#8a2f8a}w_{k,0}\color{black} & \color{#8a2f8a}w_{k,1}\color{black} & \cdots & \color{#8a2f8a}w_{k,n}\color{black} \end{bmatrix} \begin{bmatrix} \color{black}a_0^{(0)}\color{black} \\ \color{black}a_1^{(0)}\color{black} \\ \vdots \\ \color{black}a_n^{(0)}\color{black} \end{bmatrix} + \begin{bmatrix} \color{#ff8c00}b_0\color{black} \\ \color{#ff8c00}b_1\color{black} \\ \vdots \\ \color{#ff8c00}b_k\color{black} \end{bmatrix} \right) $$
or in simplified form:
$$ \mathbf{a}^{(\ell)} = \sigma(\color{#8a2f8a}W\color{white} \color{black}\mathbf{a}^{(\ell-1)}\color{black} + \color{#ff8c00}\mathbf{b}\color{black}) $$
where:
- $W \in \mathbb{R}^{k \times n}$ is the weight matrix with $k$ neurons in the current layer and $n$ neurons in the previous layer
- $\mathbf{a}^{(0)} \in \mathbb{R}^{n}$ is the activation vector from the previous layer
- $\mathbf{b} \in \mathbb{R}^{k}$ is the bias vector
- $\sigma(\cdot)$ is applied element-wise to produce $\mathbf{a}^{(1)} \in \mathbb{R}^{k}$

---

> [!quote] Definition
> ## Cost Function


> [!quote] Definition
> ## Backward Propagation (Training)

In backprop, the NN adjusts its parameters proportionate to the error in its guess. It does this by traversing backwards from the output, collecting the derivatives of the error with respect to the parameters of the functions (_gradients_), and optimizing the parameters using gradient descent.



![[3.1 - Example Network|100%]]
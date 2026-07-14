# DESCRIPTION

The BSplineCurve describes a general spline curve using B-spline basis functions. Splines on this form are often referred to as B-splines.

A pth-degree spline curve is defined by

$$\mathbf{C}(u) = \frac{\sum_{i=0}^{n} N_i^p(u) w_i \mathbf{P}_i}{\sum_{i=0}^{n} N_i^p(u) w_i} , a \le u \le b$$

where  $\mathbf{P}_i$  are the control points., the  $w_i$  are the weights, and the  $N_i^p$  are the pth degree B-spline basis functions defined in the nonperiodic and nonuniform knot vector

$$U = \{a, ..., a, u_{n+1}, ..., u_{m-n-1}, b, ..., b\}$$

For  $N_i^p(u)$ , the following definition is used:

$$\begin{split} N_i^0(u) &= \left\{ \begin{array}{l} 1 \ u_i \leq u < u_{i+1} \\ 0 \ \ \text{otherwise} \end{array} \right. \\ N_i^p(u) &= \frac{u - u_i}{u_{i+p} - u_i} N_i^{p-1}(u) + \frac{u_{i+p+1} - u}{u_{i+p+1} - u_{i+1}} N_{i+1}^{p-1}(u) \end{split}$$

For nonrational B-splines, all weights are equal to 1 and the curve can be expressed as

$$\mathbf{C}(u) = \sum_{i=0}^{n} N_{i}^{p}(u) \mathbf{P}_{i}, a \le u \le b$$

The homogeneous control points Pw[i] used in the serialization of a rational curve have the components:

$$\begin{aligned} \text{Pw[i][k]} &= \omega_i P_{i,\,k}, \, 0 \leq k < d \\ &\text{Pw[i][d]} &= \omega_i \end{aligned}$$

A polynomial curve has all weights equal to 1.

## EXAMPLE

```
12 BSplineCurve # class
2 # version
3 # sdim
0 # rational?
0 # periodic?
3 # degree

## Practice Problem Set 5

**Topics:** Change of Variables, Polar Coordinates, Applications

- 1. Consider the change of variables u = x y, v = xy and the region in the first quadrant bounded by the lines x y = 0, x y = 2 and the curves xy = 1, xy = 4. Give a clearly labelled sketch of  $D_{xy}$  in the xy-plane and of its image in the uv-plane.
- 2. Consider the change of variables  $u = y + e^{-x}$ ,  $v = y e^{-x}$ . Verify that the Jacobians satisfy

$$\frac{\partial(x,y)}{\partial(u,v)} = \left(\frac{\partial(u,v)}{\partial(x,y)}\right)^{-1} \ .$$

3. Let  $D_{xy}$  be the region in the xy-plane defined by  $|x| + |y| \le 1$ , and let f(x,y) be a continuous function on the interval [-1,1]. Use the change of variables

$$u = x + y$$
,  $v = x - y$  to show that 
$$\int_{D_{xy}} \int_{D_{xy}} f(x+y) dx dy = \int_{-1}^{1} f(u) du.$$

- 4. Evaluate  $\int_{R} \int (9-x^2-y^2)dA$  where R is the region  $x^2+(y-1)^2 \leq 1$ . Answer:  $\frac{15\pi}{2}$
- 5. Consider an inverted cone lying above the xy-plane given by the equation

$$z = 10 - \sqrt{x^2 + y^2}$$

for  $z \ge 0$ . Use a double integral in polar coordinates to calculate its volume.

Answer:  $\frac{1000\pi}{3}$ 

6. (a) Sketch the region of integration defined by the integral

$$\int_0^1 \int_{-\sqrt{1-x^2}}^{\sqrt{1-x^2}} (x+y) \ dy \, dx$$

- (b) Evaluate the integral in Cartesian coordinates. Answer:  $\frac{2}{3}$
- (c) Transform the integral into polar coordinates and evaluate. Answer:  $\frac{2}{3}$
- 7. The average value of a function z = f(x, y) throughout a region R in the xy-plane is defined to be

$$f_{avg} = \frac{1}{\operatorname{Area}(R)} \iint_{R} f(x, y) dA.$$

Compute the average value of  $f(x,y) = \frac{1}{1+x^2+y^2}$  over the disk

$$R = \{(x,y)| x^2 + y^2 \le a^2\}$$
, where a is a positive constant. **Answer:**  $\frac{\ln(1+a^2)}{a^2}$ 

1

8. Sketch the domain of integration of the integral below. Then evaluate the integral by transforming to polar coordinates.

$$\int_{1/2}^{1} \int_{0}^{\sqrt{x-x^2}} \frac{x}{\sqrt{x^2+y^2}} \, dy \, dx$$

**Answer:**  $\frac{5}{12\sqrt{2}} - \frac{1}{8}\ln(1+\sqrt{2})$ 

- 9. Calculate the volume of the solid in the first octant (i.e., where  $x \ge 0$ ,  $y \ge 0$ , and  $z \ge 0$ ) bounded by the cylinder  $x^2 + y^2 = 1$  and the plane z = y. Answer:  $\frac{1}{3}$
- 10. Let *D* be the region in the first quadrant bounded by the curves  $y = x^2$ ,  $y = 7x^2$ ,  $y = 8 x^2$  and  $y = 32 x^2$ . Use the change of variables  $u = x^2 + y$ ,  $v = \frac{y}{x^2}$  to evaluate

$$\iint_D \frac{y}{x^5} \, dA$$

by converting it to an integral in the uv-plane. Answer:  $24 \ln(2)$ 

- 11. Let D denote the region in the first quadrant bounded by the curves  $y = x, y = \frac{x}{2}, y = \frac{1}{x}$  and  $y = \frac{2}{x}$ . Use a double integral and an appropriate change of variables to calculate the area of D. Answer:  $\frac{\ln(2)}{2}$
- 12. Find the mass of the semicircular lamina occupying the region  $x^2 + y^2 \le a^2, y \ge 0$  where the mass density  $\sigma(x,y)$  (mass per unit area) is given by  $\sigma(x,y) = ky, y \ge 0$  where k is a constant. **Answer:** Mass  $= \frac{2}{3}ka^3$

## Other Suggested Problems

Guichard, pages 501-502, Exercises for §14.1, # 14.1.28, 14.1.30

Guichard, pages 505-506, Exercises for  $\S14.2,\,\#\ 14.2.1$  - 14.2.17

Guichard, page 524, Exercises for  $\S14.7,\,\#\ 14.7.1$  - 14.7.10
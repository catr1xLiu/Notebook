# *Maximum/Minimum*

A *nonlocal maximum* or *minimum coupling* operator oper finds the maximum or minimum of an expression e over the source selection. The resulting value oper(e) can be used anywhere. An optional second argument is evaluated at the point where the first argument has its maximum or minimum. Use x, y, or z, for example, to get the coordinate location of the maximum or minimum.

TABLE 2-65: MAXIMUM/MINIMUM COUPLING PROPERTIES.

| PROPERTY | VALUE                         | DEFAULT | DESCRIPTION       |
|----------|-------------------------------|---------|-------------------|
| intorder | String                        | 4       | Integration rule. |
| lagrange | String                        | 2       | Lagrange order.   |
| points   | node   integration   lagrange | node    | Type of point.    |

The maximum or minimum is approximated by evaluating the expression in the specified points.

## *Line Integration*

By default, a *line integration coupling* operator *oper* evaluates the integral of a general operator argument expression, the integrand, on a line through a meshed source domain selection in 2D or 3D. The resulting value *oper*(e) can be used anywhere.

TABLE 2-66: LINE INTEGRATION COUPLING PROPERTIES.

| PROPERTY | VALUE                                   | DEFAULT                  | DESCRIPTION                                                             |
|----------|-----------------------------------------|--------------------------|-------------------------------------------------------------------------|
| axisym   | on   off                                | on                       | Multiply by 2*pi*r in axisymmetric geometries.                          |
| direxprs | sdim-by-1 string array                  | {"1","0","0"}<br>(in 3D) | Direction expressions, when dirinput is set to<br>direxprs.             |
| dirinput | direxprs   opargs                       | direxpr                  | Use fixed expressions or operation arguments for<br>the line direction. |
| frame    | mesh   material  <br>spatial   geometry | spatial                  | Frame to integrate in (determines volume element).                      |
| intorder | String                                  | 4                        | Integration order.                                                      |
| linetype | unidirectional  <br>bidirectional       | unidirectional           | Method of computation.                                                  |


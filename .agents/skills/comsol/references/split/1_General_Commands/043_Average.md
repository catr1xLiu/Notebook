# *Average*

A *nonlocal average coupling* operator oper integrates an expression e over the source selection and divides with the measure of the source selection. The resulting value oper(e) can be used anywhere.

TABLE 2-64: AVERAGE COUPLING PROPERTIES.

| PROPERTY | VALUE                                   | DEFAULT | DESCRIPTION                                        |
|----------|-----------------------------------------|---------|----------------------------------------------------|
| axisym   | on   off                                | on      | Multiply by 2*pi*r in axisymmetric geometries.     |
| frame    | mesh   material  <br>spatial   geometry | spatial | Frame to integrate in (determines volume element). |
| intorder | String                                  | 4       | Integration order.                                 |


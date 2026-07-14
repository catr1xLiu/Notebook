# *TwoPointMap*

A *two-point map* specifies that two destination vertices should be mapped onto two source vertices.

TABLE 2-75: PROPERTIES FOR ONEPOINTMAP SUBFEATURE.

| PROPERTY  | VALUE     | DEFAULT | DESCRIPTION                   |
|-----------|-----------|---------|-------------------------------|
| srcpoint1 | Selection |         | Vertex 1 on source face.      |
| srcpoint2 | Selection |         | Vertex 2 on source face.      |
| dstpoint1 | Selection |         | Vertex 1 on destination face. |
| dstpoint2 | Selection |         | Vertex 2 on destination face. |

TABLE 2-76: BOUNDARY SIMILARITY PROPERTIES IN 2D

| PROPERTY    | VALUE              | DEFAULT             | DESCRIPTION                                         |
|-------------|--------------------|---------------------|-----------------------------------------------------|
| destination | Selection          |                     | Destination edge.                                   |
| direction   | auto same opposite | auto                | Edge direction.                                     |
| usesrcmap   | on   off           | off                 | Use source map.                                     |
| srcmap      | string[srcsdim]    | spatial coordinates | Expressions for source map $m_{\it s}(p_{\it s})$ . |

The destination transformation is a similarity transformation that maps a destination edge (destination) onto a set of source edges (the source selection). Their relative direction is given by the property direction. The mesh is always viewed in the mesh frame.

## **Identity**Mapping

A nonlocal identity mapping coupling operator maps between geometric entities that overlap, possibly when viewed in different frames. The destination transformation is an identity mapping between the given frames.

TABLE 2-77: IDENTITY MAPPING PROPERTIES.

| PROPERTY | VALUE                     | DEFAULT | DESCRIPTION                                      |
|----------|---------------------------|---------|--------------------------------------------------|
| dstframe | mesh material spatial     | spatial | Frame for evaluation of destination coordinates. |
| srcframe | mesh   material   spatial | spatial | Frame for evaluation of source coordinates.      |

## PROJECTION COUPLINGS

A projection coupling operator oper maps an expression e defined on (a part of) the source selection to an expression oper(e) that can be evaluated on (a part of) the destination geometries. It does so by performing integration along curves in the source selection. These curves correspond to lines in an intermediate space, whose dimension is equal to sreedim. There is a source map  $m_s$  mapping the source selection into the intermediate space, and a destination map  $m_d$  mapping the destination geometries into the subspace of intermediate space where the last coordinate is zero. The source map is always one-to-one. The value of oper(e) at a destination point  $p_d$  is defined as follows:

- I In the intermediate space, consider the line that is parallel to the last coordinate axis and goes through the point  $m_d(p_d)$ .
- 2 Map this line to a curve in the source selection using the inverse of the source map.
- **3** Integrate the expression e over this curve.

This implies that the value of oper(e) at the destination point  $p_d$  is the integral of e along a curve through the source point  $p_s = m_s^{-1}(m_d(p_d))$ .

The coupling type determines the type of the maps:

TABLE 2-78: PROJECTION OPERATOR TYPES.

| COUPLING TYPE     | MAP TYPES                               |
|-------------------|-----------------------------------------|
| GeneralProjection | Nonlinear map described by expressions. |
| LinearProjection  | Linear map described by vertex mapping. |

TABLE 2-79: PROJECTION COUPLING PROPERTIES.

| PROPERTY | VALUE | DEFAULT | DESCRIPTION                   |  |
|----------|-------|---------|-------------------------------|--|
| intorder | int   | 4       | Order of integration formula. |  |

Additional properties are available depending on the coupling type; see below.

## *GeneralProjection*

Use a *nonlocal general projection coupling* to define integration along curves.

TABLE 2-80: GENERAL PROJECTION COUPLING PROPERTIES.

| PROPERTY | VALUE                     | DEFAULT             | DESCRIPTION                             |
|----------|---------------------------|---------------------|-----------------------------------------|
| dstmap   | string[srcedim-1]         | spatial coordinates | Expressions for destination map md(pd). |
| srcframe | mesh   material   spatial | spatial             | Frame for source mesh.                  |
| srcmap   | string[srcedim]           | spatial coordinates | Expressions for source map ms(ps).      |


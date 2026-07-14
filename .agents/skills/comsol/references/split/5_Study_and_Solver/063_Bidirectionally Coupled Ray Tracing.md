# *Bidirectionally Coupled Ray Tracing*

The Bidirectionally Coupled Particle Tracing study step is a special case of the Ray Tracing study step that is used to model bidirectionally coupled particle-field or fluid-particle interactions. It is available with the Ray Optics Module. It is similar to the Ray Tracing study step but has an additional section called Iterations, which determines the behavior of the iterative solver loop for self-consistently modeling ray-field interactions in the default solver sequence.

## **SYNTAX**

```
model.study(stdname).create(fname, "BidirectionallyCoupledRayTracing");
model.study(stdname).feature(fname).set(pname,value);
```


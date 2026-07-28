"""Phasor / complex-impedance helpers for sinusoidal steady-state analysis.

Use from IPython:   import phasor          -> phasor.rect(...), phasor.polar(...)
              or:   from phasor import *   -> rect(...), polar(...), par(...)

Prints a usage reminder on import.
"""

import cmath
import math

__all__ = ["rect", "polar", "par", "cmath", "math"]


def rect(mag, deg):
    """Build a complex number from magnitude and angle in DEGREES.

    >>> rect(100, 30)
    (86.60254037844388+49.99999999999999j)
    """
    return cmath.rect(mag, math.radians(deg))


def polar(z, unit=""):
    """Format a complex number as 'magnitude∠degrees' for reading off.

    Returns a string, not a tuple — use cmath.polar(z) for the raw
    (magnitude, radians) pair. Angle is wrapped to (-180°, +180°].

    >>> polar(400 - 300j, " Ohm")
    '500 Ohm ∠ -36.87°'
    """
    r, th = cmath.polar(z)
    return f"{r:.4g}{unit} ∠ {math.degrees(th):+.4g}°"


def par(*zs):
    """Parallel combination of two or more impedances.

    >>> par(50, 50)
    (25+0j)
    """
    return 1 / sum(1 / complex(z) for z in zs)


_HELP = """\
phasor.py loaded — rect(mag, deg), polar(z, unit=""), par(*zs)

  Elements at a given omega:
      w = 2000
      Z_R = complex(300, 0)          # or just 300
      Z_L = 1j*w*0.1                 # 1j*w*L      -> 200j
      Z_C = 1/(1j*w*2e-6)            # 1/(1j*w*C)  -> -250j

  Combine — ordinary arithmetic works on complex:
      Z = Z_R + Z_L + Z_C            # series
      Z = par(Z_R, Z_L, Z_C)         # parallel
      polar(Z, " Ohm")               # '304.1 Ohm ∠ -9.462°'

  Sources and Ohm's law:
      V = rect(100, 30)              # 100∠30° V
      I = V / Z
      polar(I, " A")                 # '0.3288 A ∠ +39.46°'

  Readouts:
      abs(Z), Z.real, Z.imag, Z.conjugate()
      cmath.polar(Z)                 # raw (magnitude, radians)
      S = 0.5 * V * I.conjugate()    # complex power

  Prefixes:
      n       µ       m       k       M
      1e-9    1e-6    1e-3    1e3     1e6

  Careful: write 1j, never bare j. Angles in/out are DEGREES;
  cmath's own functions use radians.\
"""

print(_HELP)

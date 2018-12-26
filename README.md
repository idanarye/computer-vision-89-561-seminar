Requirements
============

1. Python
1. pip
2. Octave (it may also work with matlab. Haven't tried. You may need to remove the `pkg load` statements)

Preparation
===========

Install Required Octave Packages
--------------------------------

Run in `octave`:

```matlab
pkg install -forge image
pkg install -forge geometry
```

Install Required Python Packages
--------------------------------

Run in shell:

```bash
pip install --user pyyaml requests
```

Download The Images
-------------------

Run in shell:

```bash
python download_images.py
```

To run the examples:
====================

Run in Octave one of the `*.m` files that start with `ep_`.

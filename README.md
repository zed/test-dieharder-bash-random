Test $RANDOM bash generator using dieharder tests
-------------------------------------------------

To installs tests, run `sudo apt-get install dieharder` (or its analog
on your system).

To test, run `make`.

- `generate-dieharder-binary` is a 32bit `$RANDOM`-based generator
  (infinite binary stream)
- `generate-dieharder.py` generate random numbers using default
  `random.Random()` generator. Produce either binary stream or write
  the random numbers to stdout in the ascii dieharder format

See `Makefile` for the usage examples.

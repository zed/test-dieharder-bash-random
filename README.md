Test $RANDOM bash generator using dieharder tests
-------------------------------------------------

To installs tests, run `sudo apt-get install dieharder` (or its analog
on your system).

To test, run `make`.

- `generate-dieharder-binary` is a 32bit `$RANDOM`-based generator
  (infinite binary stream)
- `generate-dieharder-file` is 30bit `$RANDOM`-based generator that
  writes ascii file in dieharder format (2e9 numbers by default)
- `generate-dieharder-file-15bit` is 15bit `$RANDOM` generator that
  writes ascii file in dieharder format
- `generate-dieharder.py` generate random numbers using default
  `random.Random()` generator. Produce either binary stream or write
  the random numbers to stdout in ascii dieharder format

See `Makefile` for the usage examples.

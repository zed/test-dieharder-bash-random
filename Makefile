# sudo apt-get install dieharder
INPUT := /tmp/dieharder.input
PYTHON3 := python3

.PHONY: test test-python test-python-ascii

test: generate-dieharder-binary
	./$< | pv | dieharder -a -g 200

test-python: generate-dieharder.py
	$(PYTHON3) $< --binary | pv | dieharder -a -g 200

test-python-ascii: $(INPUT)-py
	dieharder -a -f $<  -g 202

$(INPUT)-py: generate-dieharder.py
	$(PYTHON3) $< 32 | pv > $@

# $@ - current target
# $* '%'-part (works if there *is* '%' in specification)
# $< first dependence
# $^ all dependencies (without duplicates)

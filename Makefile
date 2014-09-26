# sudo apt-get install dieharder
INPUT := /tmp/dieharder.input
PYTHON3 := python3

.PHONY: test test-file test-file-15bit test-python

test: generate-dieharder-binary
	./$< | pv | dieharder -a -g 200

test-file: $(INPUT)
	dieharder -a -f $<  -g 202

test-file-15bit: $(INPUT)-15bit
	dieharder -a -f $<  -g 202

test-python: generate-dieharder.py
	$(PYTHON3) $< --binary | pv | dieharder -a -g 200

$(INPUT): generate-dieharder-file
	./$< | pv > $@

$(INPUT)-15bit: generate-dieharder-file-15bit
	./$< | pv > $@

# $@ - current target
# $* '%'-part (works if there *is* '%' in specification)
# $< first dependence
# $^ all dependencies (without duplicates)

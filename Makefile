# sudo apt-get install dieharder
INPUT := /tmp/dieharder.input
PYTHON3 := python3

.PHONY: test test-python

test: $(INPUT)
	dieharder -a -f $<  -g 202

test-python: generate-dieharder.py
	$(PYTHON3) $< --binary | pv | dieharder -a -g 200

$(INPUT): generate-dieharder-file
	./$< | pv > $@

# $@ - current target
# $* '%'-part (works if there *is* '%' in specification)
# $< first dependence
# $^ all dependencies (without duplicates)

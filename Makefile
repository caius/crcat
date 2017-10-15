.PHONY: all
all: clean crcat

.PHONY: clean
clean:
	rm -f crcat

.PHONY: crcat
crcat:
	crystal build -o crcat cat.cr

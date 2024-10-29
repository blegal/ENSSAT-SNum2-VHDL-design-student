subdirs = $(wildcard */)

all:
	@$(foreach test, $(subdirs), $(MAKE) -C $(test) all;)

clean:
	@$(foreach test, $(subdirs), $(MAKE) -C $(test) clean;)

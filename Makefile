

SUBDIRS = lm/ Dd/ Mm/ DdMm/

all:$(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)

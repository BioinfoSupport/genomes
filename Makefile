

SUBDIRS = lm Mm Dd Dd+Mm GRCh38-r45 GRCh38+lm GRCm39-M34

all:$(addsuffix /all,$(SUBDIRS))
clean:$(addsuffix /clean,$(SUBDIRS))

tgz:$(SUBDIRS:%/=%.tar.gz)

$(addsuffix /all,$(SUBDIRS)):;$(MAKE) -C $(@D) all
$(addsuffix /clean,$(SUBDIRS)):;$(MAKE) -C $(@D) clean

%.tar.gz:%/all
	tar --dereference --hard-dereference -zcf "$@" "$(<D)"

.PHONY: all $(SUBDIRS)

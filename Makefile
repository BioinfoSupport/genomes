

SUBDIRS = lm/ Mm/ Dd/ Dd+Mm/ GRCh38-r45/ GRCh38+lm/ GRCm39-M34/

ALL:$(addsuffix /ALL,$(SUBDIRS))
CLEAN:$(addsuffix /CLEAN,$(SUBDIRS))

tgz:$(SUBDIRS:%/=%.tar.gz)

$(addsuffix /ALL,$(SUBDIRS)):;$(MAKE) -C $(@D) ALL
$(addsuffix /CLEAN,$(SUBDIRS)):;$(MAKE) -C $(@D) CLEAN

%.tar.gz:%/
	tar --dereference --hard-dereference -zcf "$@" "$<"

.PHONY: all $(SUBDIRS)

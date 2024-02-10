

SUBDIRS = lm/ Dd/ Mm/ DdMm/ GRCh38-r45/ GRCh38+lm/ GRCm39-M34/

all:$(SUBDIRS) 
tgz:$(SUBDIRS:%/=%.tar.gz)

$(SUBDIRS):
	$(MAKE) -C $@

%.tar.gz:%/
	tar -zcf "$@" "$<"

.PHONY: all $(SUBDIRS)

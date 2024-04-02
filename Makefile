

SUBDIRS = lm Mm Dd Dd+Mm gencode-GRCh38-r45 GRCh38+lm gencode-GRCm39-M34 ensembl-GRCh38-110 ensembl-GRCm39-110

all:$(addsuffix /all,$(SUBDIRS))
clean:$(addsuffix /clean,$(SUBDIRS))

tgz:$(SUBDIRS:%=%.tar.gz)

$(addsuffix /all,$(SUBDIRS)):;$(MAKE) -C $(@D) all
$(addsuffix /clean,$(SUBDIRS)):;$(MAKE) -C $(@D) clean

%.tar.gz:%/all
	tar -hzcf "$@" "$(<D)"

.PHONY: all $(SUBDIRS)

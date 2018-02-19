define submake
	@$(MAKE) MAKEFLAGS= --no-print-directory --directory $@ $(filter-out $@,$(MAKECMDGOALS))
endef


.PHONY: all
all: help


.PHONY: help
help:
ifeq ($(shell expr $(words $(MAKECMDGOALS)) \< 2), 1)
	@echo "Usage: make [COMMAND]"
	@echo
	@echo "  Run subproject commands"
	@echo
	@echo "Commands:"
	@echo "  help  Print this help message"
	@echo "  rs    Run rust subproject commands"
else
	@:
endif


.PHONY: rs
rs:
	$(call submake)


%:
	@:

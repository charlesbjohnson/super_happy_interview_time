VENDOR := node_modules/

ifdef VERBOSE
	Q :=
else
	Q := @
endif


.PHONY: all
all: help


.PHONY: help
help:
	@echo "Usage: make [COMMAND] [OPTION=]..."
	@echo
	@echo "  Run development commands for the project"
	@echo
	@echo "Options:"
	@echo "  VERBOSE    Echo recipe commands"
	@echo
	@echo "Commands:"
	@echo "  build    Compile the application           options: OPTS"
	@echo "  check    Check the application for errors  options: OPTS"
	@echo "  clean    Remove compilation artifacts"
	@echo "  console  Run the console                   options: OPTS"
	@echo "  fmt      Run the formatter                 options: OPTS"
	@echo "  help     Print this help message"
	@echo "  lint     Run the linter                    options: OPTS"
	@echo "  test     Run the tests                     options: OPTS"


.PHONY: build
build:
	$(Q)yarn install
	$(Q)yarn tsc $(OPTS)


.PHONY: check
check:
	$(Q)yarn tsc --noEmit $(OPTS)


.PHONY: clean
clean:
	$(Q)yarn cache clean
	$(Q)rm -rf $(VENDOR)


.PHONY: console
console:
	$(Q)yarn ts-node $(OPTS)


.PHONY: fmt
fmt:
	$(Q)yarn prettier --write package.json
	$(Q)yarn xo --fix $(OPTS)


.PHONY: lint
lint:
	$(Q)yarn prettier --check package.json
	$(Q)yarn xo $(OPTS)


.PHONY: test
test:
	$(Q)yarn nyc ava $(OPTS)

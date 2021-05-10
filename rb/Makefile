VENDOR := vendor/bundle

ifdef VERBOSE
	Q :=
else
	Q := @
endif

OPTS :=


.PHONY: all
all: help


.PHONY: help
help:
	@echo "Usage: make [COMMAND] [OPTION=]..."
	@echo
	@echo "  Run development commands for the project"
	@echo
	@echo "Options:"
	@echo "  VERBOSE  Echo recipe commands"
	@echo
	@echo "Commands:"
	@echo "  check     Check the application for errors  options: OPTS"
	@echo "  clean     Remove application dependencies"
	@echo "  console   Run the console                   options: OPTS"
	@echo "  deps      Install application dependencies  options: OPTS"
	@echo "  fmt       Run the formatter                 options: OPTS"
	@echo "  help      Print this help message"
	@echo "  lint      Run the linter                    options: OPTS"
	@echo "  refactor  Run the refactoring tool          options: OPTS"
	@echo "  test      Run the tests                     options: OPTS"


.PHONY: check
check:
	$(Q)bin/srb typecheck $(OPTS)


.PHONY: clean
clean:
	$(Q)rm -rf $(VENDOR)


.PHONY: console
console:
	$(Q)bin/rake console $(OPTS)


.PHONY: deps
deps:
	$(Q)bin/bundle install $(OPTS)


.PHONY: fmt
fmt:
	$(Q)bin/rubocop --auto-correct $(OPTS)


.PHONY: lint
lint:
	$(Q)bin/rubocop $(OPTS)


.PHONY: refactor
refactor:
	$(Q)bundle exec ruby lib/refactor/main.rb code $(OPTS)
	$(Q)bundle exec ruby lib/refactor/main.rb file $(OPTS)


.PHONY: test
test:
	$(Q)bin/rake test $(OPTS)

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
	@echo "  help     Print this help message"
	@echo "  build    Install application dependencies  options: OPTS"
	@echo "  clean    Remove application dependencies"
	@echo "  console  Run ruby console                  options: OPTS"
	@echo "  fmt      Run rubocop formatter             options: OPTS"
	@echo "  lint     Run rubocop linter                options: OPTS"
	@echo "  refactor Run refactoring tool              options: OPTS"
	@echo "  test     Run tests                         options: OPTS"


.PHONY: build
build:
	$(Q)bundle install --path $(VENDOR) $(OPTS)


.PHONY: clean
clean:
	$(Q)rm -rf $(VENDOR)


.PHONY: console
console:
	$(Q)bundle exec rake console $(OPTS)


.PHONY: fmt
fmt:
	$(Q)bundle exec rubocop --auto-correct $(OPTS)


.PHONY: lint
lint:
	$(Q)bundle exec rubocop $(OPTS)


.PHONY: refactor
refactor:
	$(Q)bundle exec ruby lib/refactor/main.rb code $(OPTS)
	$(Q)bundle exec ruby lib/refactor/main.rb file $(OPTS)


.PHONY: test
test:
	$(Q)bundle exec rake test $(OPTS)

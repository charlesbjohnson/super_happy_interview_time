TARGET_DEBUG := target/debug

ifdef VERBOSE
	Q :=
else
	Q := @
endif

CARGO_OPTS :=
OPTS       :=


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
	@echo "  bench  Run benchmark tests               options: CARGO_OPTS,OPTS"
	@echo "  build  Compile the application           options: OPTS"
	@echo "  check  Check the application for errors  options: OPTS"
	@echo "  clean  Remove compilation artifacts"
	@echo "  debug  Debug the application or tests    options: OPTS,BIN"
	@echo "  fmt    Run the formatter                 options: CARGO_OPTS,OPTS"
	@echo "  help   Print this help message"
	@echo "  lint   Run the linter                    options: CARGO_OPTS,OPTS"
	@echo "  test   Run the tests                     options: CARGO_OPTS,OPTS"


.PHONY: bench
bench:
	$(Q)cargo bench $(CARGO_OPTS) -- $(OPTS)


.PHONY: build
build:
	$(Q)cargo build $(OPTS)


.PHONY: check
check:
	$(Q)cargo check $(OPTS)


.PHONY: clean
clean:
	$(Q)cargo clean $(OPTS)


BIN :=
.PHONY: debug
debug: build _test_build
	$(Q)rust-lldb $(OPTS) $(shell find -L $(TARGET_DEBUG) -maxdepth 1 -perm +111 -name "$(BIN)" -type f | sort | head -n 1)


.PHONY: fmt
fmt:
	$(Q)cargo fmt $(CARGO_OPTS) -- $(OPTS)


.PHONY: lint
lint: clean
	$(Q)cargo clippy $(CARGO_OPTS) -- $(OPTS)


.PHONY: test
test:
	$(Q)cargo test $(CARGO_OPTS) -- $(OPTS)


.PHONY: _test_build
_test_build:
	$(Q)$(MAKE) --no-print-directory test CARGO_OPTS=--no-run $(CARGO_OPTS)

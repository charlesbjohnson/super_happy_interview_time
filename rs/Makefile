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
	@echo "  VERBOSE    Echo recipe commands"
	@echo
	@echo "Commands:"
	@echo "  help       Print this help message"
	@echo "  build      Compile the application           options: OPTS"
	@echo "  check      Check the application for errors  options: OPTS"
	@echo "  clean      Remove compilation artifacts"
	@echo "  fmt        Run rustfmt formatter             options: CARGO_OPTS,OPTS"
	@echo "  lint       Run clippy linter                 options: CARGO_OPTS,OPTS"
	@echo "  test       Run tests                         options: CARGO_OPTS,OPTS"
	@echo "  bench      Run benchmark tests               options: CARGO_OPTS,OPTS"
	@echo "  debug      Debug the application or tests    options: OPTS,BIN"
	@echo "  install    Install project dependencies"
	@echo "  uninstall  Uninstall project dependencies"


.PHONY: build
build:
	$(Q)cargo build $(OPTS)


.PHONY: check
check:
	$(Q)cargo check $(OPTS)


.PHONY: clean
clean:
	$(Q)cargo clean $(OPTS)


.PHONY: fmt
fmt:
	$(Q)cargo fmt $(CARGO_OPTS) -- $(OPTS)


.PHONY: lint
lint: clean
	$(Q)cargo clippy $(CARGO_OPTS) -- $(OPTS)


.PHONY: test
test:
	$(Q)cargo test $(CARGO_OPTS) -- $(OPTS)


.PHONY: bench
bench:
	$(Q)cargo bench $(CARGO_OPTS) -- $(OPTS)


BIN :=
.PHONY: debug
debug: build _test_build
	$(Q)rust-lldb $(OPTS) $(shell find -L $(TARGET_DEBUG) -maxdepth 1 -perm +111 -name "$(BIN)" -type f | sort | head -n 1)


.PHONY: _test_build
_test_build:
	$(Q)$(MAKE) --no-print-directory test CARGO_OPTS=--no-run $(CARGO_OPTS)


.PHONY: install
install: \
	_install_nightly \
	_install_clippy  \
	_install_rustfmt


.PHONY: _install_nightly
_install_nightly:
	$(Q)rustup toolchain install nightly
	$(Q)rustup override set nightly


.PHONY: _install_clippy
_install_clippy:
	$(Q)cargo install clippy


.PHONY: _install_rustfmt
_install_rustfmt:
	$(Q)rustup component add rustfmt-preview


.PHONY: uninstall
uninstall: \
	_uninstall_nightly \
	_uninstall_clippy  \
	_uninstall_rustfmt


.PHONY: _uninstall_nightly
_uninstall_nightly:
	$(Q)rustup override unset
	$(Q)rustup toolchain uninstall nightly


.PHONY: _uninstall_clippy
_uninstall_clippy:
	$(Q)cargo uninstall clippy


.PHONY: _uninstall_rustfmt
_uninstall_rustfmt:
	$(Q)rustup component remove rustfmt-preview

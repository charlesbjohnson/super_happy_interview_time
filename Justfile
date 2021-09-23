default:
    @just --list

# Print this help message
help: default

# Run the formatter
fmt:
    @just --unstable --fmt
    @just --unstable --fmt rb/
    @just --unstable --fmt rs/

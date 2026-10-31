# Requires the preflight workspace next to this repo (../preflight).
PREFLIGHT ?= cargo run -q --manifest-path ../preflight/Cargo.toml --bin preflight --
RELEASE   ?= $(shell date -u +%Y-%m-%d).1
KEY       ?= $(HOME)/.config/preflight/rules-signing.key
PUBKEY    ?= keys/rules-signing.pub
OUT       ?= dist/rules-$(RELEASE).json

.PHONY: check bundle verify schema clean
check:
	$(PREFLIGHT) rules check .

bundle: check
	mkdir -p dist
	$(PREFLIGHT) rules compile . --release $(RELEASE) --out $(OUT) --key $(KEY)

verify:
	$(PREFLIGHT) rules verify $(OUT) --pubkey $(PUBKEY)

schema:
	$(PREFLIGHT) rules schema --out schema

clean:
	rm -rf dist

# preflight-rules

Compatibility knowledge for Preflight (Cyberpunk 2077): framework release windows, dependency rules,
and crash/log signatures. Data is CC-BY-4.0.

- `game.yaml`: game builds, oldest first
- `frameworks/<id>.yaml`: one file per framework or mod, with releases, game windows, requirements and evidence
- `rules/*.yaml`: requires / conflicts / load_after / needs_patch / max_game_version / env rules
- `signatures/*.yaml`: log-line regexes mapped to causes and fixes
- `fixtures/`: every rule needs `fires.json` and `quiet.json`; every signature needs a real log excerpt it matches

Contribution rules: every entry carries evidence (an https link you opened), no Nexus-derived data
(`sources_tos_clean: true`), and a fixture. `make check` must pass. `make bundle` compiles and signs.

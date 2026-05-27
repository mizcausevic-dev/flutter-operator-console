# Changelog

## v1.0.0-prod — 2026-05-27

Production-readiness hardening on top of v0.1-shipped.

- Verified the `pages` GitHub Actions workflow (Flutter 3.44.0 stable channel) runs `flutter pub get` + `flutter analyze` + `flutter test` + `flutter build web --release` and deploys to GitHub Pages — most recent run on `main` (commit `fix: repair pages workflow`) completed with `success` in 2m3s.
- Confirmed live operator surface serving 200 OK at https://flutter.kineticgain.com/.
- Confirmed AGPL-3.0-or-later licensing (LICENSE) and `SECURITY.md`.
- Added missing my-lane files for production-status parity with the squad-doctrine portfolio: `CODE_OF_CONDUCT.md` and weekly `dependabot.yml` (pub + github-actions package ecosystems).
- No changes to source, README content, docs, or screenshots — those remain the v0.1-shipped surface from the build lane.

## v0.1-shipped

- initial public release of the Flutter web operator console
- shipped responsive dashboard shell, KPI cards, queue packets, and Kinetic Gain Embedded tie-back
- published GitHub Pages deployment for `flutter.kineticgain.com`

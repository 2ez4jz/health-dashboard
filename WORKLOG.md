# Work Log

## 2026-09-26 — MVP foundation

### Added
- Initialized the repository and documented the MVP scope.
- Added a static web dashboard for daily health summaries.
- Added SwiftUI + HealthKit connector source files.
- Added an API payload contract for syncing a daily summary.
- Added a PostgreSQL/Supabase-friendly schema.
- Added privacy safeguards in `.gitignore`.

### MVP metrics
Weight, steps, active energy, exercise minutes, sleep, resting heart rate, HRV, and workouts.

### Current behavior
- Web dashboard renders a sample "Today" daily summary and recent-day history.
- iOS source requests HealthKit read access and can collect today's supported metrics.
- Sync transport is deliberately not wired to a real server yet; no health data leaves the phone in this revision.

### Next
1. Create the actual Xcode iOS project and enable HealthKit capability.
2. Choose the private backend (recommended: Supabase/Postgres).
3. Wire `Sync Today` to the API.
4. Replace sample web data with authenticated API data.
5. Add background/refresh sync after the manual pipeline is verified.

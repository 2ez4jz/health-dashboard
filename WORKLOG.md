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

## 2026-09-26 — Runnable iOS project

### Added
- Added `HealthDashboard.xcodeproj` so the iOS connector can be opened directly in Xcode.
- Added the HealthKit entitlement.
- Added the Health read-permission usage description in `Info.plist`.
- Configured an iPhone-only SwiftUI target with automatic code signing.
- Updated the iOS setup instructions for running on a physical iPhone.

### Current test target
Open `ios/HealthDashboard.xcodeproj`, choose an Apple Development Team, run on the iPhone, tap **Connect Apple Health**, and verify today's metrics appear.

### Still intentionally missing
- No backend upload yet.
- No API key or database credentials in the repository.
- No background synchronization yet.

### Next
1. Verify real HealthKit reads on the user's iPhone.
2. Fix any device/Xcode signing or HealthKit compatibility issues found during first run.
3. Create the private backend.
4. Add `Sync Today`.
5. Replace sample web data with live API data.
6. Add background sync only after manual sync is reliable.

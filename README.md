# Health Dashboard

A personal Apple Health dashboard.

## MVP

The first version focuses on a small, reliable pipeline:

Apple Watch / iPhone Health → iPhone HealthKit connector → API/database → web dashboard.

Initial daily metrics:
- Weight
- Steps
- Active Energy
- Exercise Minutes
- Sleep
- Resting Heart Rate
- HRV
- Workouts

## Privacy

Do **not** commit health exports, API secrets, database passwords, or personal records to this repository. Keep secrets in environment variables and store health data in a private database.

## Project structure

- `ios/` — SwiftUI + HealthKit connector
- `web/` — browser dashboard
- `api/` — API contract / backend notes
- `database/` — data model
- `WORKLOG.md` — chronological development log

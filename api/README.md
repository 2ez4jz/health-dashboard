# API contract

## POST /api/health/daily

The iPhone connector sends one idempotent summary for a calendar day.

Example:

```json
{
  "day": "2026-09-26",
  "timezone": "America/Toronto",
  "summary": {
    "weightKg": 74.5,
    "steps": 12340,
    "activeEnergyKcal": 612,
    "exerciseMinutes": 47,
    "sleepMinutes": 421,
    "restingHeartRateBpm": 58,
    "hrvMs": 44
  },
  "workouts": [
    {
      "id": "healthkit-uuid",
      "activityType": "running",
      "startAt": "2026-09-26T22:02:00-04:00",
      "endAt": "2026-09-26T22:39:00-04:00",
      "durationMinutes": 37,
      "activeEnergyKcal": 405,
      "distanceKm": 5.0
    }
  ]
}
```

The backend should UPSERT `daily_health_summary` by `day` and UPSERT workouts by `id`.

## GET /api/health/daily?from=YYYY-MM-DD&to=YYYY-MM-DD

Returns daily summaries plus workouts for the requested range.

## Security

Do not embed a privileged database key in the iOS app or browser. Use an authenticated API layer or a narrowly scoped backend token.

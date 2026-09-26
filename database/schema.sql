create table if not exists daily_health_summary (
  day date primary key,
  weight_kg numeric,
  steps integer,
  active_energy_kcal numeric,
  exercise_minutes numeric,
  sleep_minutes numeric,
  resting_heart_rate_bpm numeric,
  hrv_ms numeric,
  synced_at timestamptz not null default now()
);

create table if not exists workouts (
  id uuid primary key,
  day date not null,
  activity_type text not null,
  start_at timestamptz not null,
  end_at timestamptz not null,
  duration_minutes numeric not null,
  active_energy_kcal numeric,
  distance_km numeric,
  average_heart_rate_bpm numeric,
  source_name text,
  synced_at timestamptz not null default now()
);

create index if not exists workouts_day_idx on workouts(day);

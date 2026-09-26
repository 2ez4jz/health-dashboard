const sample = {
  day: new Date().toISOString().slice(0,10),
  summary: {
    weightKg: 74.5,
    steps: 12340,
    activeEnergyKcal: 612,
    exerciseMinutes: 47,
    sleepMinutes: 421,
    restingHeartRateBpm: 58,
    hrvMs: 44
  },
  workouts: [
    { activityType: "Running", durationMinutes: 37, distanceKm: 5.0, activeEnergyKcal: 405 }
  ],
  history: [
    { day: "2026-09-26", weightKg: 74.5, steps: 12340, sleepMinutes: 421, restingHeartRateBpm: 58, hrvMs: 44 },
    { day: "2026-09-25", weightKg: 74.6, steps: 16120, sleepMinutes: 397, restingHeartRateBpm: 60, hrvMs: 39 },
    { day: "2026-09-24", weightKg: 74.3, steps: 11220, sleepMinutes: 448, restingHeartRateBpm: 57, hrvMs: 47 }
  ]
};

const metrics = [
  ["Weight", s => s.weightKg?.toFixed(1), "kg"],
  ["Steps", s => s.steps?.toLocaleString(), ""],
  ["Active energy", s => Math.round(s.activeEnergyKcal), "kcal"],
  ["Exercise", s => Math.round(s.exerciseMinutes), "min"],
  ["Sleep", s => (s.sleepMinutes / 60).toFixed(1), "hr"],
  ["Resting HR", s => Math.round(s.restingHeartRateBpm), "bpm"],
  ["HRV", s => Math.round(s.hrvMs), "ms"]
];

function render(data) {
  document.querySelector("#dateLabel").textContent = new Date(data.day + "T12:00:00").toLocaleDateString(undefined,{weekday:"long",year:"numeric",month:"long",day:"numeric"});
  document.querySelector("#metricGrid").innerHTML = metrics.map(([label, read, unit]) =>
    `<article class="metric-card"><span class="metric-label">${label}</span><div><span class="metric-value">${read(data.summary) ?? "—"}</span><span class="metric-unit">${unit}</span></div></article>`
  ).join("");

  document.querySelector("#workouts").innerHTML = data.workouts.length
    ? data.workouts.map(w => `<div class="workout"><div><strong>${w.activityType}</strong><span class="muted">${w.durationMinutes} min · ${w.distanceKm ?? "—"} km</span></div><div>${w.activeEnergyKcal ?? "—"} kcal</div></div>`).join("")
    : '<p class="muted">No workout recorded today.</p>';

  document.querySelector("#historyBody").innerHTML = data.history.map(r =>
    `<tr><td>${r.day}</td><td>${r.weightKg?.toFixed(1) ?? "—"} kg</td><td>${r.steps?.toLocaleString() ?? "—"}</td><td>${r.sleepMinutes ? (r.sleepMinutes/60).toFixed(1)+" hr" : "—"}</td><td>${r.restingHeartRateBpm ?? "—"}</td><td>${r.hrvMs ?? "—"} ms</td></tr>`
  ).join("");
}

document.querySelector("#refreshBtn").addEventListener("click", () => render(sample));
render(sample);

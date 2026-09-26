import Foundation

struct DailyHealthSummary: Codable {
    let day: String
    let weightKg: Double?
    let steps: Double
    let activeEnergyKcal: Double
    let exerciseMinutes: Double
    let sleepMinutes: Double
    let restingHeartRateBpm: Double?
    let hrvMs: Double?
}

struct HealthSnapshot {
    let summary: DailyHealthSummary
    let workouts: [WorkoutSummary]
}

struct WorkoutSummary: Identifiable, Codable {
    let id: UUID
    let activityType: String
    let startAt: Date
    let endAt: Date
    let durationMinutes: Double
    let activeEnergyKcal: Double?
    let distanceKm: Double?
}

import SwiftUI

struct ContentView: View {
    @StateObject private var health = HealthKitManager()

    var body: some View {
        NavigationStack {
            List {
                Section {
                    if let s = health.snapshot?.summary {
                        metric("Steps", String(Int(s.steps)))
                        metric("Active energy", "\(Int(s.activeEnergyKcal)) kcal")
                        metric("Exercise", "\(Int(s.exerciseMinutes)) min")
                        metric("Sleep", String(format: "%.1f hr", s.sleepMinutes / 60))
                        metric("Resting HR", s.restingHeartRateBpm.map { "\(Int($0)) bpm" } ?? "—")
                        metric("HRV", s.hrvMs.map { "\(Int($0)) ms" } ?? "—")
                        metric("Weight", s.weightKg.map { String(format: "%.1f kg", $0) } ?? "—")
                    } else {
                        Text("Connect Apple Health to load today's data.")
                            .foregroundStyle(.secondary)
                    }
                } header: {
                    Text("Today")
                }

                if let workouts = health.snapshot?.workouts, !workouts.isEmpty {
                    Section("Workouts") {
                        ForEach(workouts) { workout in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(workout.activityType).font(.headline)
                                Text("\(Int(workout.durationMinutes)) min")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }

                Section {
                    Button(health.isAuthorized ? "Refresh Today" : "Connect Apple Health") {
                        Task { await health.connectAndLoadToday() }
                    }
                    .disabled(health.isLoading)

                    if health.isLoading {
                        ProgressView()
                    }

                    if let error = health.errorMessage {
                        Text(error).foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Health Dashboard")
        }
    }

    private func metric(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title)
            Spacer()
            Text(value).foregroundStyle(.secondary)
        }
    }
}

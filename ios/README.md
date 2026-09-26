# iOS HealthKit Connector

This folder contains the source for the first connector.

## Xcode setup

1. Create an iOS App target named `HealthDashboard` using SwiftUI.
2. Add the **HealthKit** capability in Signing & Capabilities.
3. Add these privacy strings to the target's Info settings:
   - `NSHealthShareUsageDescription`: "Health Dashboard reads your health and fitness data to build your private daily dashboard."
4. Add the Swift files in `HealthDashboard/` to the target.
5. Run on a physical iPhone. HealthKit is not meaningfully testable with real personal records in the simulator.

The current connector only reads data. Upload/sync is intentionally a later step.

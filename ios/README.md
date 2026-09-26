# iOS HealthKit Connector

The repository now contains a minimal Xcode project at `ios/HealthDashboard.xcodeproj`.

## Run on your iPhone

1. Clone or download the repository on your Mac.
2. Open `ios/HealthDashboard.xcodeproj` in Xcode.
3. Select the `HealthDashboard` target.
4. Open **Signing & Capabilities**.
5. Choose your Apple ID / Personal Team under **Team**.
6. Confirm **HealthKit** appears under Capabilities.
7. Connect your iPhone, select it as the run destination, and press **Run**.
8. On first launch, tap **Connect Apple Health** and approve the requested read permissions.

The app currently reads:
- Weight
- Steps
- Active Energy
- Exercise Minutes
- Sleep
- Resting Heart Rate
- HRV
- Workouts

## Important

- Test on a physical iPhone for real HealthKit data.
- This revision is read-only. It does not upload health records anywhere.
- The bundle identifier is currently `com.ez4jz.healthdashboard`. If Apple reports a signing collision, change it in **Signing & Capabilities** to any unique identifier you own.

## Next milestone

Once today's data reads correctly on-device, the next step is to add `Sync Today` and send the daily summary to the private backend described in `../api/README.md`.

# Salad sample app

This is a demo iOS app for the [Salad testing library](https://github.com/Q42/Salad).

It is a to-do list that has UI tests to validate its behavior. 

Check out the folder `SaladSampleAppUITests` for the UI tests.

## How to run the tests

Open the Xcode project and choose: Product > Test (shortcut: ⌘+U).

### Continuous integration

Example are provided for GitHub actions and CircleCI, as well as a Fastlane configuration.

#### Fastlane

Check out the `fastlane` folder.
To run the tests through Fastlane: `brew install fastlane && fastlane test`.

#### GitHub Actions

Since this project is hosted on GitHub, you can also look at the GitHub Actions configuration in the `.github` folder.

#### CircleCI

An example CircleCI configuration is provided in the `.circleci` folder.

#### `xcodebuild`

Example command-line usage using `xcodebuild`:

```
xcodebuild test -project SaladSampleApp.xcodeproj \
-scheme SaladSampleApp \
-testPlan UITests \
-destination "platform=iOS Simulator,name=iPhone 13" \
-resultBundlePath "./TestResults.xcresult"
```

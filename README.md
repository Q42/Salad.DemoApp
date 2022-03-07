# Salad sample app

This is a demo iOS app for the [Salad testing library](https://github.com/Q42/Salad).

It is a to-do list that has UI tests to validate its behaviour. 
Check out the folder `SaladSampleAppUITests`.

## How to run the tests

There are several ways:

* Using Fastlane: `brew install fastlane && fastlane uitest`.
* In Xcode by selecting the UITests test plan and pressing test.
* By running the `xcodebuild test` command with the `-testPlan UITests` flag.

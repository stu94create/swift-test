# MyApp — minimal SwiftUI cloud-build demo

A tiny, accessible SwiftUI iOS app that exists to prove one thing: a **cloud
build can compile a SwiftUI app with no Mac and no Xcode on your machine.**

The app is a single screen with a title and a button that increments a counter,
with VoiceOver labels, hints, and spoken values baked in.

## What's in here

| File | Purpose |
|------|---------|
| `Sources/MyApp/MyApp.swift` | App entry point (the `@main` struct). |
| `Sources/MyApp/ContentView.swift` | The one screen: title + counter button, with VoiceOver accessibility. |
| `Sources/MyApp/Info.plist` | App metadata iOS requires (name, bundle id, orientations). |
| `project.yml` | XcodeGen spec — generates the `.xcodeproj` at build time. |
| `codemagic.yaml` | Cloud-build config: install XcodeGen → generate project → build for Simulator → save the `.app`. |
| `.gitignore` | Keeps the generated `.xcodeproj` and build output out of git. |

> **Why no `.xcodeproj` in the repo?** Xcode's project file is large, messy, and
> prone to merge conflicts. XcodeGen regenerates it from `project.yml` on every
> build, so it never needs to exist on your computer.

## How to trigger a build

1. Push this repo to GitHub (or GitLab/Bitbucket).
2. Create a free account at [codemagic.io](https://codemagic.io) and connect
   the repository.
3. Codemagic auto-detects `codemagic.yaml`. **Every push** then triggers the
   `iOS Simulator Build (no signing)` workflow automatically — no Mac required.

You can also press **Start new build** in the Codemagic dashboard to run it
on demand.

## How to read the result

- In the Codemagic dashboard, open the latest build for this repo.
- A **green** build means the SwiftUI app compiled successfully — milestone done.
- The build log shows each step: installing XcodeGen, generating the project,
  and the `xcodebuild` compile.
- Under **Artifacts**, download the `MyApp.app` bundle — that's the compiled
  Simulator app the build produced.

## What this milestone does *not* do yet

- **No code signing.** The build is for the iOS Simulator only. Signing is
  required to run on a physical iPhone or to ship to the App Store; that's a
  later step.
- **No automated install/run.** This milestone only proves the app *compiles*
  in the cloud.

## Regenerating the project locally (optional)

If you ever do get a machine with XcodeGen installed:

```sh
xcodegen generate   # creates MyApp.xcodeproj from project.yml
```

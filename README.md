# MoreWindows

Additional `Scene` types and utilities for SwiftUI apps on macOS.

![A screenshot of two windows.  The one on the left is a "launcher" style window, similar to what you'd see when opening Xcode.  The window on the right is an "about" style window, displaying app information like the version and copyright.](images~/preview.png)


## Requirements

MoreWindows requires a SwiftUI lifecycle app on macOS 13.0 or later.


## Installation (Swift Package Manager)

Add the following entry to your package dependencies...
```swift
.package(url: "https://github.com/ryanslikesocool/MoreWindows.git", from: "0.1.0"),
```
...and your target dependencies.
```swift
.target(
	name: "MyTarget",
	dependencies: [
		"MoreWindows",
	]
),
```


## Documentation

Most of this package is documented with
[DocC](https://www.swift.org/documentation/docc/)\.
<br/>
To view documentation in Xcode, select `Product > Build Documentation` from the menu bar.


## Notice

macOS 13 is supported *in theory*.
I've done my best to accomodate but I have no way of knowing if it actually works.
Please open an issue or pull request with any issues encountered on macOS 13.

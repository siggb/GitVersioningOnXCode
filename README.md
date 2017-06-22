# Pretty Xcode Git versioning for iOS & macOS applications

[![Platform](https://img.shields.io/badge/platform-ios%20%7C%20macos-lightgrey.svg?style=flat)](https://developer.apple.com/ios/human-interface-guidelines/)
[![Stackoverflow](https://img.shields.io/badge/stackoverflow-answer-orange.svg?style=flat)](https://stackoverflow.com/questions/12388553/add-git-commit-sha-to-ios-application/19635629#19635629)

![iOS Git versioning example](https://raw.github.com/siggb/GitVersioningOnXCode/master/screenshot.PNG "iOS Git versioning example")

A few simple steps to make versioning more understandable

### Features

* Every version string consists of 2 parts: `Bundle Version String` (from `Info.plist` file) and `Git commit SHA1` (you always can find this commit in the repository timeline).

* You can display your unique app version on the splash screen or on the about screen.

* When you sending yet another build to your customers or testers, you're not afraid to get lost in application versions. Every bug or wish will be binded with the version code.

* Your AppStore users can send feedbacks from the special form and every message will be signed with the unique version code.

### How does it work?

This shell script runs every time you building your application. As the result - value of the macros `GIT_SHA_VERSION` (from `GitVersion.h`) updates with the `SHA1-code` of the last branch commit.

## Installation Guide

1. Open `Build Phases` in Xcode

2. Press `Add Build Phase`

3. Press `Add Run Script Build Phase`. You can find this in the top menu `Editor`. Drag script-line to the position after `Target Dependencies`.

4. Set Shell line to ```/bin/sh```

5. Set contents of the gitversionning.sh (without first #-lines) to the script field. Don't forget to change Sources to your path-to-file, where `GitVersion.h` should be. For example: ![Adding new Build Phase](https://raw.githubusercontent.com/siggb/GitVersioningOnXCode/master/xcode_screenshot.png "Adding new Build Phase")

6. Import `GitVersion.h` file into Xcode project

7. Paste these lines:

```objective-c
#import "GitVersion.h"

NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
NSString *version = [info objectForKey:@"CFBundleShortVersionString"];
NSString *app_version = [NSString stringWithFormat:@"%@.%@", version, GIT_SHA_VERSION];

NSLog(@"app_version : %@", app_version);
```

## License

GitVersioningOnXCode is available under the MIT license.

Copyright © 2013 Ildar Sibagatov.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

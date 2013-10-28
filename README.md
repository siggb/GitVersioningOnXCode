### Installation Guide

If you want to add a beauty and powerful versioning to your Mac/iOS-application like __Version 2.17.arfb364__ - please follow these steps:

1. Go to the "Build Phases" -> and choose "Add Build Phase" -> then "Add Run Script Build Phase". You can find this in the top menu - "Editor". Drag script-line to the position after "Target Dependencies".

2. Set Shell line to ```/bin/sh```.

3. Set contents of the gitversionning.sh (without first #-lines) to the script field. Don't forget to change Sources to your path-to-file, where GitVersion.h should be.

4. Then import *.h file into the XCode-project and paste #import "GitVersion.h". Git-version string recieved with these code:
```objective-c
NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
NSString *version = [info objectForKey:@"CFBundleShortVersionString"];
NSString *app_version = [NSString stringWithFormat:@"%@.%@", version, GIT_SHA_VERSION];
NSLog(@"app_version : %@", app_version);
```

### How does it work?

This shell script runs every time you building your application. As the result - value of the macros GIT_SHA_VERSION (from GitVersion.h) updates with the SHA1-code of the last branch commit.

### Why You should add Git versioning to your project?

0. Every version string consists of 2 parts: Bundle Version String (from *.plist) and Git commit SHA1 (you always can find this commit in the repository timeline).
1. You can display your unique app version on the splash screen or on the about screen.
2. When you sending yet another build to your customers or testers, you're not afraid to get lost in application versions. Every bug or wish will be binded with the version code.
3. Your AppStore users can send feedbacks from the special form and every message will be signed with the unique version code.

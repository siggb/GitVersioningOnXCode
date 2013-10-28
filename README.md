If you want to add a beauty and powerful versioning to your Mac/iOS-application like "2.17.arfb364" - please follow these steps:

1. Go to the "Build Phases" -> and choose "Add Build Phase" -> then "Add Run Script Build Phase". You can find this in the top menu - "Editor". Drag script-line to the position after "Target Dependencies".

2. Set Shell line to /bin/sh.

3. Set contents of the gitversionning.sh to the script field. Don't forget to change Sources to your path-to-file, where GitVersion.h should be.

4. Then import *.h file into the XCode-project and paste #import "GitVersion.h". Git-version string recieved with these code:
```objective-c
NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
NSString *version = [info objectForKey:@"CFBundleShortVersionString"];
NSString *app_version = [NSString stringWithFormat:@"%@.%@", version, GIT_SHA_VERSION];
NSLog(@"app_version : %@", app_version);
```

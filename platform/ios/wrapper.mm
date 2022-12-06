#include <stdbool.h>
#include <stdio.h>
#include "main/main.h"
#include "os_ios.h"

#import <Foundation/Foundation.h>



static OS_IOS *os = nullptr;

@interface GodotObjCWrapper : NSObject

- (void)setupMainWithExecutablePath:(const char*)executablePath
               andNumberOfArguments:(int)numberOfArguments
                          arguments:(char*[])arguments
                   chainSecondPhase:(bool)secondPhase;

- (void) initOS:(NSString*)data_dir andCacheDir:(NSString*)cacheDir;

@end

@implementation GodotObjCWrapper

- (void)setupMainWithExecutablePath:(const char*)executablePath
               andNumberOfArguments:(int)numberOfArguments
                          arguments:(char*[])arguments
                   chainSecondPhase:(bool)secondPhase {
    Main::setup(executablePath, numberOfArguments, arguments, secondPhase);
    os->initialize_modules();
}

- (void) initOS:(NSString*)data_dir andCacheDir:(NSString*)cacheDir {
    os = new OS_IOS(String::utf8([data_dir UTF8String]), String::utf8([cacheDir UTF8String]));
}

@end
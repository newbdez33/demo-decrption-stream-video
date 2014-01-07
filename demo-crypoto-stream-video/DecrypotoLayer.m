//
//  DecrypotoLayer.m
//  demo-crypoto-stream-video
//
//  Created by Jack on 6/01/2014.
//  Copyright (c) 2014 salmonapps. All rights reserved.
//

#import "DecrypotoLayer.h"
#import "HTTPDecryptResponse.h"
#import "HTTPLogging.h"

// Log levels: off, error, warn, info, verbose
// Other flags: trace
static const int httpLogLevel = HTTP_LOG_LEVEL_WARN; // | HTTP_LOG_FLAG_TRACE;

@implementation DecrypotoLayer

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path
{
	
	NSString *filePath = [self filePathForURI:path];
	NSString *documentRoot = [config documentRoot];
	
	if (![filePath hasPrefix:documentRoot])
	{
		// Uh oh.
		// HTTPConnection's filePathForURI was supposed to take care of this for us.
		return nil;
	}

    HTTPLogVerbose(@"%@[%p]: Serving up dynamic content", THIS_FILE, self);
    
    return [[HTTPDecryptResponse alloc] initWithFilePath:filePath forConnection:self];

}

@end

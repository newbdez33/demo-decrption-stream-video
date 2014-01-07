//
//  HTTPDecryptResponse.m
//  demo-crypoto-stream-video
//
//  Created by Jack on 6/01/2014.
//  Copyright (c) 2014 salmonapps. All rights reserved.
//

#import "HTTPDecryptResponse.h"
#import "HTTPConnection.h"
#import "HTTPLogging.h"

#if ! __has_feature(objc_arc)
#warning This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

// Log levels : off, error, warn, info, verbose
// Other flags: trace
static const int httpLogLevel = HTTP_LOG_LEVEL_WARN; // | HTTP_LOG_FLAG_TRACE;

#define NULL_FD  -1

@implementation HTTPDecryptResponse

- (void)processReadBuffer
{
	HTTPLogTrace();
    
	data = [[NSData alloc] initWithBytes:readBuffer length:readBufferOffset];
    readBufferOffset = 0;
	[connection responseHasAvailableData:self];
}

@end

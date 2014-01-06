//
//  AppDelegate.h
//  demo-crypoto-stream-video
//
//  Created by Jack on 6/01/2014.
//  Copyright (c) 2014 salmonapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTTPServer;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    HTTPServer *httpServer;
}

@property (strong, nonatomic) UIWindow *window;

@end

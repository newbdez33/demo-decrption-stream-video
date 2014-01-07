//
//  ViewController.m
//  demo-crypoto-stream-video
//
//  Created by Jack on 6/01/2014.
//  Copyright (c) 2014 salmonapps. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [[searchPaths lastObject] stringByAppendingString:@"/test.mp4"];
    if (![[NSFileManager defaultManager] fileExistsAtPath: documentPath  isDirectory:NO]) {
        NSString *resource = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"];
        [[NSFileManager defaultManager] copyItemAtPath:resource toPath:documentPath error:nil];
    }
}

- (IBAction)player:(id)sender {
    
    if (!self.movieController) {
        NSURL *u = [NSURL URLWithString:@"http://127.0.0.1:54333/test.mp4"];
        //NSURL *u = [NSURL URLWithString:@"http://www.quirksmode.org/html5/videos/big_buck_bunny.mp4"];
        self.movieController = [[MPMoviePlayerController alloc] initWithContentURL:u];
        //self.movieController.movieSourceType = MPMovieSourceTypeStreaming;
    }
    
    [self.movieController.view setFrame:CGRectMake(0, 0, 320, 320)];
    [self.movieController play];
    [self.view addSubview:self.movieController.view];
    
}

@end

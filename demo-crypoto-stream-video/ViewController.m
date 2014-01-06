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
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)player:(id)sender {
    
    if (!self.movieController) {
        //http://www.quirksmode.org/html5/videos/big_buck_bunny.mp4
        NSURL *u = [NSURL URLWithString:@"http://127.0.0.1:54333/test.mov"];
        self.movieController = [[MPMoviePlayerController alloc] initWithContentURL:u];
    }
    
    [self.movieController.view setFrame:CGRectMake(0, 0, 320, 320)];
    [self.movieController play];
    [self.view addSubview:self.movieController.view];
    
}

@end

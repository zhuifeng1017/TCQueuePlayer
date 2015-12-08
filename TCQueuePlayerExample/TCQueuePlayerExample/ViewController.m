//
//  ViewController.m
//  TCQueuePlayerExample
//
//  Created by Thibault Charbonnier on 24/05/13.
//  Copyright (c) 2013 thibaultCha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)presentMoviesController;
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"Player test"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *showPlayer = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [showPlayer setFrame:CGRectMake(self.view.frame.size.width/2 - 100.0f,
                                    50.0f,
                                    200.0f,
                                    100.0f)];
    [showPlayer setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin];
    [showPlayer setTitle:@"Show player" forState:UIControlStateNormal];
    [showPlayer addTarget:self
                   action:@selector(presentMoviesController)
         forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:showPlayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)presentMoviesController
{
    NSString *urlString1 = [[NSBundle mainBundle] pathForResource:@"sample2" ofType:@"mp4"];
    NSString *urlString2 = [[NSBundle mainBundle] pathForResource:@"sample1" ofType:@"m4v"];
    
    NSString *audioUrlString1 = [[NSBundle mainBundle] pathForResource:@"18" ofType:@"mp3"];
    NSString *audioUrlString2 = [[NSBundle mainBundle] pathForResource:@"oD71cTslQMovaKq296ugThmWrpRVir6j_3pm" ofType:@"mp3"];
    
    NSArray *audioVideos = [[NSArray alloc] initWithObjects:
                       [AVPlayerItem playerItemWithURL:[[NSURL alloc] initFileURLWithPath:audioUrlString1]],
                       [AVPlayerItem playerItemWithURL:[[NSURL alloc] initFileURLWithPath:audioUrlString2]],
                       [AVPlayerItem playerItemWithURL:[[NSURL alloc] initFileURLWithPath:urlString1]],
                       [AVPlayerItem playerItemWithURL:[[NSURL alloc] initFileURLWithPath:urlString2]], nil];
    
    TCQueuePlayerViewController *player = [[TCQueuePlayerViewController alloc] initWithItems:audioVideos];
    
    [self.navigationController presentViewController:player
                                            animated:YES
                                          completion:nil];
}

@end

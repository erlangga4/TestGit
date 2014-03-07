//
//  MainViewController.m
//  TestGit
//
//  Created by Erlangga on 3/7/14.
//  Copyright (c) 2014 TrinityCode. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (nonatomic, retain) IBOutlet UIButton * btnTest;
-(IBAction)clicked:(id)sender;
@end

@implementation MainViewController
@synthesize btnTest;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma Mark Custom
-(IBAction)clicked:(id)sender
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    [alert show];
}
@end

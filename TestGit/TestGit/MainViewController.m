//
//  MainViewController.m
//  TestGit
//
//  Created by Erlangga on 3/7/14.
//  Copyright (c) 2014 TrinityCode. All rights reserved.
//

#import "MainViewController.h"
#import "AFNetworking.h"
#import "AFURLSessionManager.h"
@interface MainViewController ()
@property (nonatomic, retain) AFURLSessionManager *sessionManager;
@property ( nonatomic, retain) IBOutlet UIViewController * mywebc;
@property (nonatomic, retain) IBOutlet UIButton * btnTest;
@property (nonatomic, retain) IBOutlet UIWebView * myWebView;
-(IBAction)clicked:(id)sender;
@end

@implementation MainViewController
@synthesize btnTest;
@synthesize sessionManager;
@synthesize mywebc;
@synthesize myWebView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}
- (void)awakeFromNib
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //NSURLSessionConfiguration * config = [[NSURLSessionConfiguration alloc] init];
    
   // sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"saving file to %@", documentsDirectory);
    //make a file name to write the data to using the documents directory:
    NSString *destpath = [documentsDirectory stringByAppendingPathComponent:@"test.html"];
    NSLog(@"%@", destpath);
    NSString * sourcePath = [[NSBundle mainBundle] resourcePath];
;
    [[NSFileManager defaultManager] copyItemAtURL:    [[NSURL alloc] initFileURLWithPath:[sourcePath stringByAppendingPathComponent:@"test.html"] ]toURL:[[NSURL alloc] initFileURLWithPath:destpath] error:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma Mark Custom
-(IBAction)clicked:(id)sender
{
    NSURLRequest * req  = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://download.wavetlan.com/SVV/Media/HTTP/H264/Talkinghead_Media/H264_test3_Talkingheadclipped_mp4_480x360.mp4"]];
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"saving file to %@", documentsDirectory);
    //make a file name to write the data to using the documents directory:
    NSString *destpath = [documentsDirectory stringByAppendingPathComponent:@"test.mp4"];
    NSURLSessionDownloadTask *task =
    [sessionManager downloadTaskWithRequest:req progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSLog(@"%@", destpath);
        [[NSFileManager defaultManager] createFileAtPath:destpath contents:nil attributes:nil];
        return [[NSURL alloc] initFileURLWithPath:destpath];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"Complete");
    }];
    [task resume];
    NSLog(@"task %@", task);
}
-(IBAction)click2ed :(id)sender
{
    NSString *stringURL = @"http://download.wavetlan.com/SVV/Media/HTTP/H264/Talkinghead_Media/H264_test3_Talkingheadclipped_mp4_480x360.mp4";
    NSURL *url = [NSURL URLWithString:stringURL];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    if ( urlData )
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"filename.mp4"];
        [urlData writeToFile:filePath atomically:YES];
    }
}
-(IBAction)pushing:(id)sender
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"saving file to %@", documentsDirectory);
    //make a file name to write the data to using the documents directory:
    NSString *directURL  =@"http://smf.cloudapp.net/html5/media/bigbuck.mp4";
    NSString *destpath = [documentsDirectory stringByAppendingPathComponent:@"test.html"];
    NSString * stringhtml = [NSString stringWithContentsOfFile:destpath encoding:NSUTF8StringEncoding error:nil];
    //[myWebView setAllowsInlineMediaPlayback:YES];
    //myWebView.allowsInlineMediaPlayback = YES;
    //[myWebView loadHTMLString:stringhtml baseURL:nil];
    //[myWebView setMediaPlaybackRequiresUserAction:NO];
    [myWebView loadRequest:[[NSURLRequest alloc] initWithURL:[[NSURL alloc]initFileURLWithPath:destpath]]];
    //[myWebView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:directURL]]];
    
    //NSString *embedHTML = @"<html><head><style type=\"text/css\">   body {    background-color:transparent;color: white;}</style></head><body style=\"margin:0\"><embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" width=\"%0.0f\" height=\"%0.0f\"></embed>TESTING</body></html>";

//NSString *strHtml = [NSString stringWithFormat:embedHTML, directURL, 300   ,300];//set width and height which you want
  //  [myWebView loadHTMLString:strHtml baseURL:nil];
//[webView loadHTMLString:strHtml baseURL:nil];
//[self.view addSubview:webView];

}

@end

//
//  AppDelegate.h
//  TestGit
//
//  Created by Erlangga on 3/7/14.
//  Copyright (c) 2014 TrinityCode. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AFURLSessionManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property ( strong , nonatomic) AFURLSessionManager * sessionManager;
@property (strong, nonatomic) UIWindow *window;

@end

//
//  AppDelegate.h
//  TouchKitOC
//
//  Created by travelsky on 2018/4/12.
//  Copyright © 2018年 wangdicen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define USES_TOUCHkit  1

#if USES_TOUCHkit
#import "TOUCHkitView.h"
#import "TOUCHOverlayWindow.h"
#define WINDOW_CLASS TOUCHOverlayWindow
#else
#define WINDOW_CLASS UIWindow
#endif


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) WINDOW_CLASS *window;


@end


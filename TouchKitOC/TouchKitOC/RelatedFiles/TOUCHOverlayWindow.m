//
//  TOUCHOverlayWindow.m
//  TouchKitOC
//
//  Created by travelsky on 2018/4/12.
//  Copyright © 2018年 wangdicen. All rights reserved.
//

#import "TOUCHOverlayWindow.h"
#import "TOUCHkitView.h"

@implementation TOUCHOverlayWindow

- (void)sendEvent:(UIEvent *)event
{
    //截取UIWindow的事件分类存入集合.
    NSSet *touches = [event allTouches];
    NSMutableSet *began =  nil;
    NSMutableSet *moved = nil;
    NSMutableSet *ended = nil;
    NSMutableSet *cancelled = nil;
    
    for (UITouch *touch in touches) {
        switch ([touch phase]) {
            case UITouchPhaseBegan:
                if (!began) {
                    began = [NSMutableSet set];
                }
                [began addObject:touch];
                break;
            case UITouchPhaseMoved:
                if (!moved) {
                    moved = [NSMutableSet set];
                }
                [moved addObject:touch];
                break;
            case UITouchPhaseEnded:
                if (!ended)
                {
                    ended = [NSMutableSet set];
                }
                [ended addObject:touch];
                break;
            case UITouchPhaseCancelled:
                if (!cancelled)
                {
                    cancelled = [NSMutableSet set];
                }
                [cancelled addObject:touch];
                
            default:
                break;
        }
    }
    
    //更具事件类型去调用touchkitview单例的touch事件.
    if (began)
        [[TOUCHkitView sharedInstance] touchesBegan:began withEvent:event];
    if (moved)
        [[TOUCHkitView sharedInstance] touchesMoved:moved withEvent:event];
    if (ended)
        [[TOUCHkitView sharedInstance] touchesEnded:ended withEvent:event];
    if (cancelled)
        [[TOUCHkitView sharedInstance] touchesCancelled:cancelled withEvent:event];
    
    [super sendEvent: event];    
    
}

@end

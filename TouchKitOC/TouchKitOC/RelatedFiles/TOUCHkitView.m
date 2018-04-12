//
//  TOUCHkitView.m
//  TouchKitOC
//
//  Created by travelsky on 2018/4/12.
//  Copyright © 2018年 wangdicen. All rights reserved.
//

#import "TOUCHkitView.h"

static TOUCHkitView *sharedInstance = nil;

@implementation TOUCHkitView
{
    NSSet *touches;
}

+ (instancetype)sharedInstance
{
    if (!sharedInstance){
        sharedInstance = [[self alloc] initWithFrame:CGRectZero];
    }
    if (!sharedInstance.superview) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        sharedInstance.frame = keyWindow.bounds;
        [keyWindow addSubview:sharedInstance];
    }
    
    return sharedInstance;
}

//TOUCHkitView实际上是一个和window同宽高的  “透明”  “画布”
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
        self.multipleTouchEnabled = YES;
        _touchColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5f];
        touches = nil;
    }
    return self;
}

// Basic Touches processing
/**
   根据UIWindow的事件,重新绘制TOUCHkitView;
 **/

- (void)touchesBegan:(NSSet *)theTouches withEvent:(UIEvent *)event
{
    touches = theTouches;
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)theTouches withEvent:(UIEvent *)event
{
    touches = theTouches;
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)theTouches withEvent:(UIEvent *)event
{
    touches = nil;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    
    [[UIColor clearColor] set];
    CGContextFillRect(context, self.bounds);
    
    float size = 25.0f;
    
    for (UITouch *touch in touches) {
        [[UIColor darkGrayColor] colorWithAlphaComponent:0.5];
        CGPoint aPoint = [touch locationInView:self];
        CGContextAddEllipseInRect(context, CGRectMake(aPoint.x -size, aPoint.y -size, 2*size, 2*size));
        CGContextFillPath(context);
        
        float dsize = 1.f;
        [_touchColor set];
        aPoint = [touch locationInView:self];
        CGContextAddEllipseInRect(context, CGRectMake(aPoint.x - size - dsize, aPoint.y - size - dsize, 2 * (size - dsize), 2 * (size - dsize)));
        CGContextFillPath(context);
    }
    
    touches = nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

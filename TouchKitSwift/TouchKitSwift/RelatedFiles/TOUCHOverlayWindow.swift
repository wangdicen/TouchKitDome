//
//  File.swift
//  TouchKitSwift
//
//  Created by travelsky on 2018/4/12.
//  Copyright © 2018年 wangdicen. All rights reserved.
//

import Foundation
import UIKit

class TOUCHOverlayWindow: UIWindow {
    override func sendEvent(_ event: UIEvent) {
        let touches:Set = event.allTouches!;
        var began:Set = Set<UITouch>();
        var moved:Set = Set<UITouch>();
        var ended:Set = Set<UITouch>();
        var cancelled:Set = Set<UITouch>();
        
        for touch in touches {
            switch(touch.phase){
            case .began:
                began.insert(touch);
                break;
            case .moved:
                moved.insert(touch);
                break;
            case .ended:
                ended.insert(touch);
                break;
            case .cancelled:
                cancelled.insert(touch);
                break;
            default:
                break;
            }
        }
        
        
        if began.count > 0{
            TOUCHkitView.shareInstance.touchesBegan(began, with:event);
        }
        if moved.count > 0
        {
            TOUCHkitView.shareInstance.touchesMoved(moved, with: event);
        }
        if ended.count > 0 {
            TOUCHkitView.shareInstance.touchesEnded(ended, with: event);
        }
        
        super.sendEvent(event);
    }
}

//
//  TOUCHkitView.swift
//  TouchKitSwift
//
//  Created by travelsky on 2018/4/12.
//  Copyright © 2018年 wangdicen. All rights reserved.
//

import Foundation
import UIKit

final class TOUCHkitView: UIView {
    public var touchColor:UIColor = UIColor.clear;
    static let shareInstance:TOUCHkitView = TOUCHkitView(frame: CGRect.zero);
    
    private var touches:Set = Set<UITouch>();
    
    private override init(frame: CGRect) {
        super.init(frame: frame);
        if(self.superview == nil)
        {
            let keywindow:UIWindow = UIApplication.shared.keyWindow!;
            self.frame = keywindow.bounds;
            keywindow .addSubview(self);
        }
        self.backgroundColor = UIColor.clear;
        self.isUserInteractionEnabled = false;
        self.isMultipleTouchEnabled = true;
        touchColor = UIColor.white.withAlphaComponent(0.5);
        self.touches = Set<UITouch>();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        self.touches = touches;
        self.setNeedsDisplay();
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touches.removeAll();
        self.setNeedsDisplay();
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touches = touches;
        self.setNeedsDisplay();
    }
    
    override func draw(_ rect: CGRect) {
        let context:CGContext = UIGraphicsGetCurrentContext()!;
        context.clear(self.bounds);
        context.setFillColor(UIColor.clear.cgColor);
        
        let size:CGFloat = 25.0;
        
        for touch in touches {
            var aPoint = touch.location(in: self);
            context.addEllipse(in: CGRect.init(x:aPoint.x - size, y: aPoint.y - size, width: 2*size, height: 2*size));
            context.setFillColor(UIColor.darkGray.withAlphaComponent(0.5).cgColor) ;
            context.fillPath();

            
            let dsize:CGFloat = 1.0;
            aPoint = touch.location(in: self);
            context.addEllipse(in: CGRect.init(x:aPoint.x - size - dsize, y: aPoint.y - size - dsize, width: 2 * (size - dsize), height: 2 * (size - dsize)));
            context.setFillColor(self.touchColor.cgColor) ;
            context.fillPath();
            
        }
        
        touches.removeAll();
    }
    
    
    
}

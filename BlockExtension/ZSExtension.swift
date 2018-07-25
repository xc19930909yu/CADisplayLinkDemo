//
//  ZViewExtension.swift
//  BlockChain
//
//  Created by z on 2018/3/21.
//  Copyright © 2018年 z. All rights reserved.
//

import UIKit


/// 第二种定时器添加
extension CADisplayLink {
    
    // RunTime绑定的键值
    struct UnSafePointString {
        static let key = UnsafeRawPointer(bitPattern: "closures".hashValue)
        
    }
    
    // RUntime进行属性绑定
    static var closures : ((CADisplayLink) -> Void)? {
        get {
            return objc_getAssociatedObject(self, UnSafePointString.key!) as? (CADisplayLink) -> Void
        }
        set(newValue) {
            objc_setAssociatedObject(self, UnSafePointString.key!, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    //定时器的创建
    static func creatDisplayLink(action:((CADisplayLink) -> Void)?) -> CADisplayLink{
        
        self.closures = action

        let displayLinks = CADisplayLink(target: self, selector: #selector(startTime(_:)))
        displayLinks.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
        return displayLinks
    }
    
    
    // 闭包回调 实现计时
    @objc static func startTime(_ displayLink:CADisplayLink){

        if  let clo = closures {
            clo(displayLink)
        }
      
    }
    
    // 定时器的销毁
    func removeFromRunLoop()  {
        self.invalidate()
        
    }
    
}


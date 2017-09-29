//
//  Swap.swift
//  CookieCrunch
//
//  Created by UQ Times on 2017/09/27.
//  Copyright © 2017年 UQ Times. All rights reserved.
//

struct Swap: CustomStringConvertible {
    let cookieA: Cookie
    let cookieB: Cookie
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
}

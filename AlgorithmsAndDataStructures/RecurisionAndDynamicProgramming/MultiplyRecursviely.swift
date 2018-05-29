//
//  MultiplyRecursviely.swift
//  AlgorithmsAndDataStructures
//
//  Created by Rohith Raju on 29/05/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import Foundation

class MultiplyRecursviely{
    
    class func multiply(_ x: Int,_ y: Int) -> Int{
        if x == 0 || y == 0{
            return 0
        }else{
            return x + multiply(x,y-1)
        }
    }
}

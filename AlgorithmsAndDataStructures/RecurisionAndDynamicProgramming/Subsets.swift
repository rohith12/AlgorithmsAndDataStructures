//
//  Subsets.swift
//  AlgorithmsAndDataStructures
//
//  Created by Rohith Raju on 29/05/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import Foundation

class SubSets {
    func helper(_ nums: [Int], _ start: Int, _ result: inout [[Int]], _ temp: inout [Int]) {
        print("start: \(start), result: \(result), temp: \(temp)")
        if start == nums.count {
            result.append(temp)
            return
        }
        
        //don't choose
        helper(nums, start + 1, &result, &temp)
        
        //choose
        temp.append(nums[start])
        print("after append, start: \(start), result: \(result), temp: \(temp)")

        helper(nums, start + 1, &result, &temp)
        temp.removeLast()
        print("after remove, start: \(start), result: \(result), temp: \(temp)")

    }
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var temp: [Int] = []
        var result: [[Int]] = []
        
        helper(nums, 0, &result, &temp)
        
        return result
    }
}

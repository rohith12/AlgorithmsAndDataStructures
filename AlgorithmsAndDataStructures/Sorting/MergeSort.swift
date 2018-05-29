//
//  MergeSort.swift
//  AlgorithmsAndDataStructures
//
//  Created by Rohith Raju on 29/05/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import Foundation

class MergeSort {
  
    func mergeSort(_ array: [Int]) -> [Int]{
        
        guard array.count > 1 else{
            return array
        }
        
        let leftArray = Array(array[0..<array.count/2])
        let rightArray = Array(array[array.count/2..<array.count])

        return merge(mergeSort(leftArray),mergeSort(rightArray))
    }
    
    func merge(_ left: [Int],_ right: [Int]) -> [Int]{
        var left = left
        var right = right
        var merge: [Int] = []
        
        while left.count > 0 && right.count > 0 {
            if left.first! < right.first!{
                merge.append(left.removeFirst())
            }else{
                merge.append(right.removeFirst())
            }
        }
        
        return merge + left + right
    }
    
    
}

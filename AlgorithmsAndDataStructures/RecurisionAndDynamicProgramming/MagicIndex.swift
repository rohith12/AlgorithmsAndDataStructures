//
//  MagicIndex.swift
//  AlgorithmsAndDataStructures
//
//  Created by Rohith Raju on 29/05/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import Foundation

class MagicIndex{
  
    //MARK: For sorted list and distinct elements
    func magicFastSortedListDistinctElements(sortedArray: [Int]) -> Int{
        
        return magicIndexBinarySearch(sortedArray: sortedArray, start: 0, end: sortedArray.count-1)
    }
    
    func magicIndexBinarySearch(sortedArray: [Int], start: Int, end: Int) -> Int{
        
        if end < start{
            return -1
        }
        
        let mid = (start + end)/2
        
        if sortedArray[mid] == mid{
            return mid
        }else if sortedArray[mid] < mid{
            return magicIndexBinarySearch(sortedArray:sortedArray, start:mid+1, end:end)
        }else{
            return magicIndexBinarySearch(sortedArray:sortedArray, start:start, end: mid-1)
        }
        
    }
    
    //MARK: For sorted list, but the elements are not distinct
    
    
    
}


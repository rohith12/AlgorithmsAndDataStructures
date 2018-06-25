//
//  QuickSort.swift
//  AlgorithmsAndDataStructures
//
//  Created by Rohith Raju on 25/06/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import Foundation

class QuickSort{
 
    func quick<T: Comparable>(array: [T]) -> [T]{
        
      guard array.count > 1 else { return array }
        
      let pivot = array[array.count/2]
      let less = array.filter{return $0 < pivot}
      let greater = array.filter{return $0 > pivot}
      let equal = array.filter{return $0 == pivot}
      return quick(array: less) + equal + quick(array: greater)
        
    }
    
}

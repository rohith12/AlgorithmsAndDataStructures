//
//  main.swift
//  AlgorithmsAndDataStructures
//
//  Created by Rohith Raju on 29/05/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import Foundation

let magicIndexSorted = MagicIndex()
var sortedArray: [Int] = [0,2,3,4,7,6]
print("The magic index is:\(magicIndexSorted.magicFastSortedListDistinctElements(sortedArray: sortedArray)) from the array:\(sortedArray) ")

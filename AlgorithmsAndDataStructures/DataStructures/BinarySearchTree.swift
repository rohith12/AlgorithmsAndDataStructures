//
//  BinarySearchTree.swift
//  AlgorithmsAndDataStructures
//
//  Created by Rohith Raju on 14/06/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import Foundation

public class BinaryNode<T: Comparable>{
    public var value: T
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    public weak var parent: BinaryNode?
    
    public init(value: T,left: BinaryNode?, right: BinaryNode?,parent: BinaryNode?){
        self.value = value
        leftChild = left
        rightChild = right
        self.parent = parent
    }
    
    public convenience init(value: T){
       self.init(value: value, left: nil, right: nil, parent: nil)
    }
    
    
}
//MARK: Insertion
extension BinaryNode{
  
    public func insertNodeFromRoot(value: T){
        if let _ = self.parent{
            print("You can only add new nodes from the root node of thre tree")
            return
        }
        self.addNode(value: value)
    }
    
    private func addNode(value: T){
        if value < self.value{
           
            if let leftChild = leftChild{
                leftChild.addNode(value: value)
            }else{
                let newNode = BinaryNode(value: value)
                newNode.parent = self
                leftChild = newNode
            }
        }else{
            if let rightChild = rightChild{
                rightChild.addNode(value: value)
            }else{
                let newNode = BinaryNode(value: value)
                newNode.parent = self
                rightChild = newNode
            }
        }
    }
    
}




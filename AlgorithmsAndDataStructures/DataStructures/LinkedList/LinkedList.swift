//
//  LinkedList.swift
//  AlgorithmsAndDataStructures
//
//  Created by Rohith Raju on 08/06/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import Foundation
class Node<T>{
    var data: T? = nil
    var next: Node<T>? = nil
}

struct LinkedList<T>{
    
    var head: Node<T> = Node<T>()
    
    mutating func insert(_ value: T){
        
        if self.head.data == nil{
            self.head.data = value
        }else{
            var lastNode = self.head
            while lastNode.next != nil {
                lastNode = lastNode.next!
            }
            let newNode: Node<T> = Node<T>()
            newNode.data = value
            lastNode.next = newNode
        }
        
    }
    
    mutating func printAllVaues(){
        var currentNode: Node! = self.head
        print("---------")
        while currentNode != nil && currentNode.data != nil {
            print("The item is \(String(describing: currentNode.data))")
            currentNode = currentNode.next
        }
        
    }
    
    mutating func reverseLinkedList(){
        
        var currentNode: Node<T>? = self.head
        var prevNode: Node<T>? = nil
        var nextNode: Node<T>? = nil
        
        while currentNode != nil {
            nextNode = currentNode?.next
            currentNode?.next = prevNode
            prevNode = currentNode
            currentNode = nextNode
        }
        self.head = prevNode ?? Node<T>()
        
    }
    
    
    
}

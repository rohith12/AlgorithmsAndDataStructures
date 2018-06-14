//
//  Queue.swift
//  Datastructures
//
//  Created by Rohith Raju on 08/05/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

public struct Queue<T> {
    fileprivate var elements = [T]()
    public init(){ }
    
    public mutating func enqueue(element: T){
      self.elements.append(element)
    }
    
    public mutating func dequeue() -> T?{
        return self.elements.removeFirst()
    }
    
    public func peek() -> T?{
        return elements.first
    }
    
    public var count: Int{
        return elements.count
    }
    
    public mutating func clear(){
        self.elements.removeAll()
    }
    
    public var capacity: Int{
        get{
           return elements.capacity
        }
        
        set{
            elements.reserveCapacity(newValue)
        }
    }
    
    public func isEmpty() -> Bool{
        return elements.isEmpty
    }
    
    
}

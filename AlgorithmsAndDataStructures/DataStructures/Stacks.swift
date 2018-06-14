//
//  Stacks.swift
//  Datastructures
//
//  Created by Rohith Raju on 08/05/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//


public struct Stack<T>{
    
    fileprivate var elements = [T]()
        
    public mutating func pop() -> T?{
        return self.elements.popLast()
    }
        
    public mutating func push(_ element: T){
        self.elements.append(element)
    }
        
    public func peek() -> T?{
        return self.elements.last
    }
        
    public var count: Int{
        return self.elements.count
    }
        
    public func isEmpty()-> Bool{
        return self.elements.isEmpty
    }
        
 }

extension Stack: CustomStringConvertible, CustomDebugStringConvertible
{
    
    public var description: String{
        return self.elements.description
    }
    
    public var debugDescription: String{
        return self.elements.debugDescription
    }
    
   
    
}

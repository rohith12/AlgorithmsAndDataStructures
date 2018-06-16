//
//  BFS.swift
//  AlgorithmsAndDataStructures
//
//  Created by Rohith Raju on 15/06/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import Foundation




class BFSNode{
    
    var val: String? = nil
    var edges: [BFSNode]? = nil
    var searched: Bool = false
    var parent: BFSNode? = nil
  
    
    init(value: String) {
        self.val = value
        self.edges = [BFSNode]()
    }
    
    func addEdge(neighbor: BFSNode){
       self.edges?.append(neighbor)
       neighbor.edges?.append(self)
    }
    
    static func == (lhs: BFSNode, rhs: BFSNode) -> Bool {
        var returnValue = false
        if (lhs.val == rhs.val)
        {
            returnValue = true
        }
        return returnValue
    }
    
}

extension BFSNode: CustomStringConvertible, CustomDebugStringConvertible
{
    
    public var description: String{
        return "value: \(self.val!.description), edges: \(String(describing: self.edges)), searched: \(self.searched), parent: \(String(describing: self.parent))"
    }
    
    public var debugDescription: String{
        return "value: \(self.val!.description), edges: \(String(describing: self.edges)), searched: \(self.searched), parent: \(String(describing: self.parent))"
    }
    
    
    
}

class Graph{
    
    var nodes: [BFSNode]? = nil
    var graph: [String: BFSNode]? = nil
    var startNode: BFSNode? = nil
    var endNode: BFSNode? = nil
    
    
    init() {
       nodes = [BFSNode]()
       graph = [String:BFSNode]()
    }
    
    func setStartNode(string: String) -> BFSNode{
        self.startNode = graph?[string]
        return self.startNode!
    }
    
    func setEndNode(string: String) -> BFSNode{
        self.endNode =  graph?[string]
        return self.endNode!
    }
    
    func addNode(node: BFSNode) {
       self.nodes?.append(node)
       let title = node.val
       self.graph![title!] = node
    }
    
    func getNode(actor: String)-> BFSNode?{
       return self.graph?[actor]
    }
   
    

}

extension Graph: CustomStringConvertible, CustomDebugStringConvertible
{

    public var description: String{
        return "nodes: \(self.nodes!.description), graph: \(self.graph!)"
    }

    public var debugDescription: String{
        return "nodes: \(self.nodes!.description), graph: \(self.graph!)"
    }



}

class BFSAlgorithm{
    
    var graph : Graph? = nil
    
    init() {
    
    }
    
    func setup(){
        
        var movies: [[String: Any]]?
        
        if let moviesCheck = moveisData["movies"]{
            
            movies = moviesCheck
            
            graph = Graph()
            
            for i in 0..<movies!.count{
                
                
                var title: String?
                var movieTitleNode: BFSNode?
                if let titleCheck = movies![i]["title"] as? String{
                    title = titleCheck
                    movieTitleNode = BFSNode(value: title!)
                    graph?.addNode(node: movieTitleNode!)
                }
                
                var cast: [String]?
                if let castCheck: [String] = movies![i]["cast"] as? [String]{
                    cast = castCheck
                    
                    for j in 0..<cast!.count{
                       let actor: String = cast![j]
                       let actorNode: BFSNode?
                    
                       if let node = graph?.getNode(actor: actor){
                         actorNode = node
                       }else{
                          actorNode = BFSNode(value: actor)
                       }
                       
                        graph?.addNode(node: actorNode!)
                        movieTitleNode?.addEdge(neighbor: actorNode!)
                       //print(actor)
                    }
                }
            }
        }
        
    }
    
    
    func bfs(actorName: String){
        
        
        let start = graph?.setStartNode(string: actorName)
        
        let end = graph?.setEndNode(string: "Kevin Bacon")
        
        var queue: [BFSNode] = [BFSNode]()
        start?.searched = true
        queue.append(start!)
        
        while queue.count > 0{
            
            let current = queue.removeFirst()
            if current == end!{
                print("Found \(String(describing: current.val))")
                break
            }
            
            if let edges = current.edges{
                for i in 0..<edges.count{
                    let neigbhor = edges[i]
                    if !neigbhor.searched{
                        neigbhor.searched = true
                        neigbhor.parent = current
                        queue.append(neigbhor)
                    }
                }
            }
        }
        
        printPath(end: end!)
        
    }
    
    func printPath(end: BFSNode){
        
        var path: [BFSNode] = []
        path.append(end)
        
        var next = end.parent
        while next != nil {
            path.append(next!)
            next = next?.parent
        }
        
        var text = ""
        for i in stride(from: path.count-1, through: 0, by: -1){
            
            let n = path[i]
            if i == 0{
                text += n.val!
            }else{
                text += n.val! + "--->"
            }
            
        }
        
        print(text)
    }
    
}



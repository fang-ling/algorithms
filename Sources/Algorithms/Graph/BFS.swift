//
//  BFS.swift
//
//
//  Created by Fang Ling on 2023/8/5.
//

import Foundation
import Collections

@usableFromInline
enum BFSColor {
    case white
    case gray
    case black
}

@inlinable
public func bfs(G : AdjacencyList, s : Int) -> [Int] {
    /* Initialization */
    var color = [BFSColor](repeating: .white, count: G.count)
    var d = [Int](repeating: Int.max, count: G.count)
    var π = [Int?](repeating: nil, count: G.count)
    color[s] = .gray
    d[s] = 0
    π[s] = nil

    var Q = Queue<Int>()
    Q.enqueue(s)
    while !Q.is_empty {
        let u = Q.dequeue()
        for e in G.adj[u] {
            let v = e.v
            if color[v] == .white {
                color[v] = .gray
                d[v] = d[u] + 1
                π[v] = u
                Q.enqueue(v)
            }
        }
        color[u] = .black
    }

    return d
}

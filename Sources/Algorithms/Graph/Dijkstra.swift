//
//  Dijkstra.swift
//
//
//  Created by Fang Ling on 2023/8/10.
//

import Foundation
import Collections

extension AdjacencyEdge : Comparable {
    public static func < (lhs : AdjacencyEdge, rhs : AdjacencyEdge) -> Bool {
        lhs.w < rhs.w
    }
}

@inlinable
public func dijkstra(G : AdjacencyList, s : Int) -> [Int] {
    /* Initialization */
    var d = [Int](repeating: Int.max, count: G.count)
    var π = [Int?](repeating: nil, count: G.count)

    var Q = BinaryHeap<AdjacencyEdge>()
    Q.insert(AdjacencyEdge(v: s, w: 0))
    d[s] = 0
    while !Q.is_empty {
        let u = Q.remove_max().v
        for e in G.adj[u] {
            let v = e.v
            let w = e.w
            if relax(d: &d, π: &π, u: u, v: v, w: w) {
                Q.insert(AdjacencyEdge(v: v, w: w))
            }
        }
    }
    return d
}

@inlinable
func relax(
  d : inout [Int],
  π : inout [Int?],
  u : Int,
  v : Int,
  w : Int
) -> Bool {
    if d[v] == Int.max || d[v] > d[u] + w {
        d[v] = d[u] + w
        π[v] = u
        return true
    }
    return false
}

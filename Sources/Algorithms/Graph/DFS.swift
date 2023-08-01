//
//  DFS.swift
//
//
//  Created by Fang Ling on 2023/5/27.
//

import Foundation
import Collections

@usableFromInline
enum DFSColor {
    case white
    case gray  /* It is discovered in the search. */
    case black /* It is finished */
}

@usableFromInline
var time : Int = 0

@inlinable
public func dfs(G : AdjacencyList) {
    var color = [DFSColor](repeating: .white, count: G.count)
    /* Predecessor */
    var π = [Int](repeating: -1, count: G.count)
    /* Timestamps */
    var d = [Int](repeating: 0, count: G.count)
    var f = [Int](repeating: 0, count: G.count)

    time = 0
    for u in 0 ..< G.count {
        if color[u] == .white {
            dfs_visit(G, &π, &color, &d, &f, u)
        }
    }
}

@usableFromInline
func dfs_visit(
  _ G : AdjacencyList,
  _ π : inout [Int],
  _ color : inout [DFSColor],
  _ d : inout [Int],
  _ f : inout [Int],
  _ u : Int
) {
    time += 1
    d[u] = time
    color[u] = .gray

    for e in G.adj[u] {
        let v = e.v
        if color[v] == .white {
            π[v] = u
            dfs_visit(G, &π, &color, &d, &f, v)
        }
    }
    color[u] = .black
    time += 1
    f[u] = time
}

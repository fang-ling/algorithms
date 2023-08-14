//
//  Kruskal.swift
//
//
//  Created by Fang Ling on 2023/8/14.
//

import Foundation
import Collections

@inlinable
public func kruskal(G : AdjacencyList) -> [(Int, Int, Int)] {
    var ufs = UnionFindSet<Int>()
    for v in 0 ..< G.count {
        ufs.make_set(v)
    }
    var edges = [(Int, Int, Int)]()
    for e in G.edges.sorted(by: { $0.2 < $1.2 }) {
        let u = e.0
        let v = e.1
        if ufs.find_set(u) != ufs.find_set(v) {
            edges.append(e)
            ufs.union(u, v)
        }
    }
    return edges
}

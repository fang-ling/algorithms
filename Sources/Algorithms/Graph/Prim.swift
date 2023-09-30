//
//  Prim.swift
//
//
//  Created by Fang Ling on 2023/8/16.
//

import Foundation
import Collections

@usableFromInline
struct PrimVertex : Comparable & Hashable {
  @usableFromInline
  var v : Int
  @usableFromInline
  var key : Int
  
  @usableFromInline
  static func < (lhs : PrimVertex, rhs : PrimVertex) -> Bool {
    return lhs.key == rhs.key ? lhs.v < rhs.v : lhs.key > rhs.key
  }
  
  @usableFromInline
  static func == (lhs : PrimVertex, rhs : PrimVertex) -> Bool {
    return lhs.v == rhs.v
  }
  
  @usableFromInline
  func hash(into hasher : inout Hasher) {
    hasher.combine(v)
  }
  
  @usableFromInline
  init(v : Int, key : Int) {
    self.v = v
    self.key = key
  }
}

@inlinable
public func prim(G : AdjacencyList, r : Int) -> ([Int?], Int) {
  /* Initialization */
  var keys = [Int](repeating: Int.max, count: G.count)
  var π = [Int?](repeating: nil, count: G.count)
  var is_visited = [Bool](repeating: false, count: G.count)
  
  var Q = BinaryHeap<PrimVertex>()
  keys[r] = 0
  for i in keys.indices {
    Q.insert(PrimVertex(v: i, key: keys[i]))
  }
  
  while !Q.is_empty {
    let u = Q.remove_max().v
    is_visited[u] = true
    for e in G.adj[u] {
      let v = e.v
      let w = e.w
      if !is_visited[v] && w < keys[v] {
        π[v] = u
        Q.replace(PrimVertex(v: v, key: keys[v]), with: PrimVertex(v: v, key: w))
        keys[v] = w
      }
    }
  }
  return (π, keys.reduce(0, +))
}

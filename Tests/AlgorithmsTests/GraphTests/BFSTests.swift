//
//  BFSTests.swift
//
//
//  Created by Fang Ling on 2023/8/5.
//

import XCTest
@testable import Algorithms
import Collections

final class BFSTests : XCTestCase {
    func test_bfs() {
        var G = AdjacencyList(count: 8)
        G.insert_edge(u: 0, v: 1); G.insert_edge(u: 1, v: 0)
        G.insert_edge(u: 0, v: 4); G.insert_edge(u: 4, v: 0)
        G.insert_edge(u: 1, v: 5); G.insert_edge(u: 5, v: 1)
        G.insert_edge(u: 2, v: 5); G.insert_edge(u: 5, v: 2)
        G.insert_edge(u: 2, v: 6); G.insert_edge(u: 6, v: 2)
        G.insert_edge(u: 2, v: 3); G.insert_edge(u: 3, v: 2)
        G.insert_edge(u: 3, v: 6); G.insert_edge(u: 6, v: 3)
        G.insert_edge(u: 3, v: 7); G.insert_edge(u: 7, v: 3)
        G.insert_edge(u: 5, v: 6); G.insert_edge(u: 6, v: 5)
        G.insert_edge(u: 6, v: 7); G.insert_edge(u: 7, v: 6)

        let d = bfs(G: G, s: 1)
        XCTAssertEqual(d, [1, 0, 2, 3, 2, 1, 2, 3])
    }
}

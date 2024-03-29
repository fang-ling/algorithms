//
//  DijkstraTests.swift
//
//
//  Created by Fang Ling on 2023/8/10.
//

import XCTest
@testable import Algorithms
import Collections

final class DijkstraTests : XCTestCase {
    func test_dijkstra() {
        var G = AdjacencyList(count: 5)
        G.insert_edge(u: 0, v: 1, w: 10)
        G.insert_edge(u: 0, v: 3, w: 5)
        G.insert_edge(u: 1, v: 3, w: 2)
        G.insert_edge(u: 1, v: 2, w: 1)
        G.insert_edge(u: 2, v: 4, w: 4)
        G.insert_edge(u: 3, v: 1, w: 3)
        G.insert_edge(u: 3, v: 2, w: 9)
        G.insert_edge(u: 3, v: 4, w: 2)
        G.insert_edge(u: 4, v: 0, w: 7)
        G.insert_edge(u: 4, v: 2, w: 6)

//        XCTAssertEqual(dijkstra(G: G, s: 0), [0, 8, 9, 5, 7])
    }
}

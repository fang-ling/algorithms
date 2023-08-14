//
//  KruskalTests.swift
//
//
//  Created by Fang Ling on 2023/8/14.
//

import XCTest
@testable import Algorithms
import Collections

final class KruskalTests : XCTestCase {
    func test_kruskal() {
        let G = AdjacencyList(
          count: 9,
          edges: [
            (0, 1, 4),  (0, 2, 8),
            (1, 2, 11), (1, 5, 8),
            (2, 3, 7),  (2, 4, 1),
            (3, 5, 2),  (3, 4, 6),
            (4, 6, 2),
            (5, 6, 4),  (5, 7, 7),
            (6, 7, 14), (6, 8, 10),
            (7, 8, 9)
          ]
        )

        XCTAssertEqual(
          kruskal(G: G).reduce(0, { $0 + $1.2 }),
          37
        )
    }
}

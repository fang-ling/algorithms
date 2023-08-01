import XCTest
@testable import Algorithms
import Collections

final class sortingTests: XCTestCase {
    /*func test_dfs() {
        let map = [[0, 1, 1, 1, 0, 1, 1, 1],
                   [1, 0, 1, 0, 1, 1, 1, 1],
                   [0, 1, 0, 0, 0, 0, 0, 1],
                   [0, 1, 1, 1, 0, 1, 1, 1],
                   [1, 0, 0, 1, 1, 0, 0, 0],
                   [0, 1, 1, 0, 0, 1, 1, 0]]
        let n = map.count
        let m = map[0].count

        var graph = AdjacencyList(count: n * m, is_directed: false)

        for i in 0 ..< n {
            for j in 0 ..< m {
                /* Right boundary check and link right node */
                if (j + 1 < m && map[i][j] == 0 && map[i][j + 1] == 0) {
                    let u = i * m + j
                    let v = i * m + j + 1;
                    graph.insert_edge(u: u, v: v)
                }
                /* Bottom boundary check and link down node */
                if (i + 1 < n && map[i][j] == 0 && map[i + 1][j] == 0) {
                    let u = i * m + j
                    let v = (i + 1) * m + j
                    graph.insert_edge(u: u, v: v)
                }
                /* Bottom-Right boundary check and link down-right node */
                if (j + 1 < m && i + 1 < n &&
                      map[i][j] == 0 && map[i + 1][j + 1] == 0) {
                    let u = i * m + j
                    let v = (i + 1) * m + j + 1
                    graph.insert_edge(u: u, v: v)
                }
                /* Upper-Right boundary check and link upper-right node */
                if (j + 1 < m && i - 1 >= 0 &&
                      map[i][j] == 0 && map[i - 1][j + 1] == 0) {
                    let u = i * m + j
                    let v = (i - 1) * m + j + 1
                    graph.insert_edge(u: u, v: v)
                }
            }
        }

        dfs2(graph: graph, source : 0, sink: n * m - 1)

        // for u in 0 ..< n * m {
        //     let list = graph.get_adj_list(u: u)
        //     print("\(u): " + list.description)
        // }
    }*/

    func test_merge_sort() {
        var array = [Int]()
        array.merge_sort()

        XCTAssertEqual(array, [])

        array.append(19358)
        array.merge_sort()
        XCTAssertEqual(array, [19358])
        array.removeLast()

        var output = [Int](0 ..< 65536)
        output += output
        output.sort()

        array = (0 ..< 65536).shuffled()
        array += array
        array.merge_sort()

        XCTAssertEqual(array, output)
    }

    func test_bubble_sort() {
        var array = [Int]()
        array.bubble_sort()

        XCTAssertEqual(array, [])

        array.append(19358)
        array.merge_sort()
        XCTAssertEqual(array, [19358])
        array.removeLast()

        var output = [Int](0 ..< 1024)
        output += output
        output.sort()

        array = (0 ..< 1024).shuffled()
        array += array
        array.bubble_sort()

        XCTAssertEqual(array, output)
    }

    func test_selection_sort() {
        var array = [Int]()
        array.selection_sort()

        XCTAssertEqual(array, [])

        array.append(19358)
        array.merge_sort()
        XCTAssertEqual(array, [19358])
        array.removeLast()

        var output = [Int](0 ..< 1024)
        output += output
        output.sort()

        array = (0 ..< 1024).shuffled()
        array += array
        array.selection_sort()

        XCTAssertEqual(array, output)
    }

    func test_insertion_sort() {
        var array = [Int]()
        array.insertion_sort()

        XCTAssertEqual(array, [])

        array.append(19358)
        array.merge_sort()
        XCTAssertEqual(array, [19358])
        array.removeLast()

        var output = [Int](0 ..< 1024)
        output += output
        output.sort()

        array = (0 ..< 1024).shuffled()
        array += array
        array.insertion_sort()

        XCTAssertEqual(array, output)
    }

    func test_quicksort() {
        var array = [Int]()
        array.quicksort()

        XCTAssertEqual(array, [])

        array.append(19358)
        array.quicksort()
        XCTAssertEqual(array, [19358])
        array.removeLast()

        var output = [Int](0 ..< 65536)
        output += output
        output.sort()

        array = (0 ..< 65536).shuffled()
        array += array
        array.quicksort()

        XCTAssertEqual(array, output)
    }
}

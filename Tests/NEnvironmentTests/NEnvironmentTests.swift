import XCTest
@testable import NEnvironment

final class NEnvironmentTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NEnvironment().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

#if !canImport(ObjectiveC)
import XCTest

extension BlogPostTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__BlogPostTests = [
        ("testSlug", testSlug),
    ]
}

extension EpisodeTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__EpisodeTests = [
        ("testFreeSince", testFreeSince),
        ("testIsSubscriberOnly", testIsSubscriberOnly),
        ("testSlug", testSlug),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BlogPostTests.__allTests__BlogPostTests),
        testCase(EpisodeTests.__allTests__EpisodeTests),
    ]
}
#endif

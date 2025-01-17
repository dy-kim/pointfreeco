import HtmlSnapshotTesting
import HttpPipelineTestSupport
import PointFreePrelude
import PointFreeTestSupport
import Prelude
import SnapshotTesting
import XCTest

@testable import HttpPipeline
@testable import PointFree

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

private func secureRequest(_ urlString: String) -> URLRequest {
  var request = URLRequest(url: URL(string: urlString)!)
  request.allHTTPHeaderFields = ["X-Forwarded-Proto": "https"]
  return request
}

class SiteMiddlewareTests: TestCase {
  override func setUp() {
    super.setUp()
    //    SnapshotTesting.isRecording=true
  }

  func testWithoutWWW() {
    assertSnapshot(
      matching: connection(from: secureRequest("https://pointfree.co"))
        |> siteMiddleware,
      as: .ioConn
    )

    assertSnapshot(
      matching: connection(from: secureRequest("https://pointfree.co/episodes"))
        |> siteMiddleware,
      as: .ioConn
    )
  }

  func testWithoutHeroku() {
    assertSnapshot(
      matching: connection(from: secureRequest("https://pointfreeco.herokuapp.com"))
        |> siteMiddleware,
      as: .ioConn
    )

    assertSnapshot(
      matching: connection(from: secureRequest("https://pointfreeco.herokuapp.com/episodes"))
        |> siteMiddleware,
      as: .ioConn
    )
  }

  func testWithWWW() {
    assertSnapshot(
      matching: connection(from: secureRequest("https://www.pointfree.co"))
        |> siteMiddleware,
      as: .ioConn
    )

    assertSnapshot(
      matching: connection(from: secureRequest("https://www.pointfree.co"))
        |> siteMiddleware,
      as: .ioConn
    )
  }

  func testWithHttps() {
    assertSnapshot(
      matching: connection(from: URLRequest(url: URL(string: "http://www.pointfree.co")!))
        |> siteMiddleware,
      as: .ioConn,
      named: "1.redirects_to_https"
    )

    assertSnapshot(
      matching: connection(from: URLRequest(url: URL(string: "http://www.pointfree.co/episodes")!))
        |> siteMiddleware,
      as: .ioConn,
      named: "2.redirects_to_https"
    )

    assertSnapshot(
      matching: connection(from: URLRequest(url: URL(string: "http://0.0.0.0:8080/")!))
        |> siteMiddleware,
      as: .ioConn,
      named: "0.0.0.0_allowed"
    )

    assertSnapshot(
      matching: connection(from: URLRequest(url: URL(string: "http://127.0.0.1:8080/")!))
        |> siteMiddleware,
      as: .ioConn,
      named: "127.0.0.0_allowed"
    )

    assertSnapshot(
      matching: connection(from: URLRequest(url: URL(string: "http://localhost:8080/")!))
        |> siteMiddleware,
      as: .ioConn,
      named: "localhost_allowed"
    )
  }
}

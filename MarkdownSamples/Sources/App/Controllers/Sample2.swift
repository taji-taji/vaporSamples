import Vapor
import HTTP
import SwiftMarkdown

final class Sample2Controller: ResourceRepresentable {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }

    /// GET /sample2
    func index(_ req: Request) throws -> ResponseRepresentable {
        let markdownString: String = {
            return "# Hello world!\n"
                + "## This is sample2.\n"
                + "<p>This sample is in case of that the Markdown String contains raw HTML String.</p>\n"
                + "In this case, Leaf is ignore raw HTML String. So, you could use `markdownToHTML()` method "
                + "and put parsed HTML String to Leaf template by `#raw()`"
        }()
        let markdown = try markdownToHTML(markdownString, options: [])

        return try view.make("sample2", [
            "markdown": markdown
            ], for: req)
    }

    func makeResource() -> Resource<String> {
        return Resource(
            index: index
        )
    }
}

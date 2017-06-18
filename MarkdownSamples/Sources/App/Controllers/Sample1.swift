import Vapor
import HTTP

final class Sample1Controller: ResourceRepresentable {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    /// GET /sample1
    func index(_ req: Request) throws -> ResponseRepresentable {
        let markdown: String = {
            return "# Hello world!\n"
                + "## This is sample1.\n"
                + "This sample is to use Leaf custom tag `#markdown()`"
                + " for Simple Markdown string."
        }()

        return try view.make("sample1", [
            "markdown": markdown
        ], for: req)
    }

    func makeResource() -> Resource<String> {
        return Resource(
            index: index
        )
    }
}

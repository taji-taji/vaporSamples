import Vapor

final class Routes: RouteCollection {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    func build(_ builder: RouteBuilder) throws {

        /// GET /sample1
        builder.resource("sample1", Sample1Controller(view))

        /// GET /sample2
        builder.resource("sample2", Sample2Controller(view))

    }
}

class Document {
    class Head: Node {
        nonisolated(unsafe) static let Title = BasicAttribute<String>("title")
    }

    let body: Node
    let head: Head
    let root = Node("html")

    init() {
        head = root.append(Head("head"))
        body = root.append(Node("body"))
    }
}

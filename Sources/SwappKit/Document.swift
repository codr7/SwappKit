class Document {
    class Head: BasicNode {
        nonisolated(unsafe) static let Title = BasicAttribute<String>("title")
    }
    
    let body: BasicNode
    let head: Head
    let root = BasicNode("html")

    init() {
        head = root.append(Head("head"))
        body = root.append(BasicNode("body"))
    }
}

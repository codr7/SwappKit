protocol Node {
    var attributes: [Attribute:Any] {get}
    var body: [Node] {get}
    var html: String {get}
    var tag: String {get}

    subscript<T>(key: BasicAttribute<T>) -> T? {get set}
}

class BasicNode: Node {
    let tag: String
    var attributes: [Attribute:Any] = [:]
    var body: [Node] = []

    init(_ tag: String) {
        self.tag = tag
    }

    subscript<T>(key: BasicAttribute<T>) -> T? {
        get { if let value = attributes[key] { (value as! T) } else { nil } }
        set(value) { attributes[key] = value }
    }
    
    @discardableResult
    func append<T>(_ node: T) -> T where T: Node {
        body.append(node)
        return node
    }

    var html: String {
        var result = "<\(tag)"

        if !attributes.isEmpty {
            result += " \(attributes.map({$0.html($1)}).joined(separator: " "))"
        }
        
        result += body.isEmpty
          ? "/>"
          : ">\(body.map({$0.html}).joined(separator: ""))</\(tag)>"

        return result
    }
}

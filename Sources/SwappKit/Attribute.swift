class Attribute: Equatable, Hashable {
    static func ==(_ l: Attribute, _ r: Attribute) -> Bool {
        l.name == r.name
    }
    
    init(_ name: String) {
        self.name = name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    func html(_ value: Any) -> String { "\(name)=\"\(valueHtml(value))\"" }

    var name: String

    func valueHtml(_ value: Any) -> String { "\(value)" }
}

class BasicAttribute<T>: Attribute {
    override func valueHtml(_ value: Any) -> String { valueHtml(value as! T) }
    func valueHtml(_ value: T) -> String { "\(value)" }
}

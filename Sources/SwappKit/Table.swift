class Table: BasicNode {
    class Row: BasicNode {
        init() { super.init("tr") }

        func td() -> Data { append(Data()) }
    }

    class Data: BasicNode {
        nonisolated(unsafe) static let Colspan = BasicAttribute<Int>("colspan")
        init() { super.init("td") }
    }
    
    init() {
        super.init("table")
    }

    func tr() -> Row { append(Row()) }
}

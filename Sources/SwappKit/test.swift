@main
struct Main {
    static func main() {
        let doc = Document()
        doc.head[Document.Head.Title] = "Hello World!"
        let t = doc.body.append(Table())
        let tr = t.tr()
        let td = tr.td()
        td[Table.Data.Colspan] = 2
        print(doc.root.html)
    }
}


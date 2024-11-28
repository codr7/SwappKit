@main
struct Main {
    static func main() {
        let doc = Document()
        doc.head[Document.Head.Title] = "Hello World!"
        print(doc.root.html)
    }
}


import Apodini


struct Lecture: Apodini.Content, Decodable, Equatable {
    let name: String
}

struct LectureHandler: Handler {

    func handle() throws -> Lecture {
        Lecture(name: "Swift")
    }
}

struct Author: Apodini.Content, Decodable, Equatable {
    let name: String
    let surname: String
}

struct AuthorHandler: Handler {

    func handle() throws -> Author {
        Author(name: "Jules", surname: "Verne")
    }
}

struct Book: Apodini.Content, Decodable, Equatable {
    let name: String
    let author: [Author]
}

struct BookHandler: Handler {
    @Parameter var name: String

    func handle() throws -> Book {
        Book(name: name, author: [Author(name: "Jules", surname: "Verne")])
    }
}

struct BookComponent: Component {
    var content: some Component {
        Group("favorite") {
            LectureHandler()
            Group("book") {
                BookHandler()
            }

        }
        Group("writer") {
            AuthorHandler()
        }
    }
}


struct TestWebService: Apodini.WebService {
    @PathParameter var userId: Int

    var content: some Component {
        BookComponent()
    }
}

try TestWebService.main()

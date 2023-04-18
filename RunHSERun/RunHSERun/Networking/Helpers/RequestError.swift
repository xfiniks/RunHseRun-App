enum RequestError: Error {
    case clientIsNil
    case emptyEmail
}

enum TokenError: Error {
    case tokenIsNil
}

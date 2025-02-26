public protocol ExternalLogger: Sendable {
    func log(
        _ message: String
    )
    func logError(
        _ message: String,
        error: Error?
    )
}

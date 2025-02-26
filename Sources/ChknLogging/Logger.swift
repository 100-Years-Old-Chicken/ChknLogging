import os

public protocol Logger: Sendable {
    func log(
        _ message: String,
        type: OSLogType
    )
    func logError(
        _ message: String,
        error: Error?
    )
}

public extension Logger {
    func log(
        _ message: String
    ) {
        log(
            message,
            type: .default
        )
    }
}

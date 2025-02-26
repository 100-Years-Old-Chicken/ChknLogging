import os

struct DummyLogger: Logger {
    func log(
        _ message: String,
        type: OSLogType
    ) {}

    func logError(
        _ message: String,
        error: Error?
    ) {}
}

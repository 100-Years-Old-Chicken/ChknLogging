import SwiftUI

public enum LoggerFactory {
    public static func make(
        subsystem: String,
        category: String,
        externalLogger: ExternalLogger? = nil
    ) -> Logger {
        AppLogger(
            subsystem: subsystem,
            category: category,
            externalLogger: externalLogger
        )
    }

    public static var dummy: Logger {
        DummyLogger()
    }
}

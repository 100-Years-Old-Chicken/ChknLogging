import Foundation
import os

public struct AppLogger: Logger {
    private let subsystem: String
    private let category: String
    private let externalLogger: ExternalLogger?

    public init(
        subsystem: String,
        category: String,
        externalLogger: ExternalLogger? = nil
    ) {
        self.subsystem = subsystem
        self.category = category
        self.externalLogger = externalLogger
    }

    public func log(
        _ message: String,
        type: OSLogType = .default
    ) {
        let logger = os.Logger(
            subsystem: subsystem,
            category: category
        )

        Task.detached { [logger, externalLogger] in
            logger.log(
                level: type,
                "\(message, privacy: .public)"
            )

            #if !DEBUG
            externalLogger?.log("\(category): \(message)")
            #endif
        }
    }

    public func logError(
        _ message: String,
        error: Error? = nil
    ) {
        let logger = os.Logger(
            subsystem: subsystem,
            category: category
        )

        Task.detached { [logger, externalLogger] in
            logger.error("\(message, privacy: .public) Error: \(error?.localizedDescription ?? "nil")")

            #if !DEBUG
            externalLogger?.logError("\(category): \(message)", error: error)
            #endif
        }
    }
}

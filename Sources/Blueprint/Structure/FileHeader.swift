//
//  FileHeader.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public struct FileHeader
{
    public let filename: Text
    public let creationDate: Date

    public init(filename: Text, creationDate: Date = Date())
    {
        self.filename = filename
        self.creationDate = creationDate
    }
}

extension FileHeader: Blueprint
{
    public func transpile(_ target: Target, indentation: Int = 0) throws -> Text
    {
        switch target
        {
            case .swift:
                return try self.transpileSwift(indentation)
        }
    }
}


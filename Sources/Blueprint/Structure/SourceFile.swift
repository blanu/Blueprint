//
//  SourceFile.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public struct SourceFile
{
    public let header: FileHeader
    public let imports: ImportSection
    public let structs: [Structure]
    public let enums: [Enumeration]
    public let functions: [Function]
}

extension SourceFile: Blueprint
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

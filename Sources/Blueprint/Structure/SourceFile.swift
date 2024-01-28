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
    public let header: FileHeader?
    public let imports: ImportSection?
    public let structs: [Structure]
    public let enums: [Enumeration]
    public let functions: [Function]
    public let extensions: [Extension]
    public let statements: [Statement]

    public init(header: FileHeader? = nil, imports: ImportSection? = nil, structs: [Structure] = [], enums: [Enumeration] = [], functions: [Function] = [], extensions: [Extension] = [], statements: [Statement] = [])
    {
        self.header = header
        self.imports = imports
        self.structs = structs
        self.enums = enums
        self.functions = functions
        self.extensions = extensions
        self.statements = statements
    }
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

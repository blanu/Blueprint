//
//  Import.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public class ImportSection
{
    public var globals: [GlobalImportTarget]
    public var locals: [Text]

    public convenience init(_ globals: GlobalImportTarget...)
    {
        self.init(globals: globals, locals: [])
    }

    public init(globals: [GlobalImportTarget] = [], locals: [Text] = [])
    {
        self.globals = globals
        self.locals = locals
    }
}

extension ImportSection: Blueprint
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

public enum GlobalImportTarget
{
    case BigNumber
    case Datable
    case Hex
    case Logging
    case RadioWave
    case Text
}

extension GlobalImportTarget: Blueprint
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

//
//  Closure.swift
//
//
//  Created by Dr. Brandon Wiley on 1/30/24.
//

import Foundation

import Text

public struct Closure
{
    public let statements: [Statement]

    public init(statements: [Statement])
    {
        self.statements = statements
    }
}

extension Closure: Blueprint
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

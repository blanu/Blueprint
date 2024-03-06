//
//  Argument.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public struct Argument
{
    public let label: Text?
    public let value: RValue

    public init(label: Text? = nil, value: RValue)
    {
        self.label = label
        self.value = value
    }
}

extension Argument: Blueprint
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

//
//  Cast.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

public struct Cast
{
    public let type: Type
    public let expression: Expression

    public init(type: Type, expression: Expression)
    {
        self.type = type
        self.expression = expression
    }
}

extension Cast: Blueprint
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

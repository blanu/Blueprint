//
//  LValue.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public enum LValue
{
    case property(Text)
    case variable(Text)
    case variableDefinition(VariableDefinition)
}

extension LValue: Blueprint
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

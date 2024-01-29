//
//  RangeOperator.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

public enum RangeOperator
{
    case inclusive(Expression?, Expression?)
    case exclusive(Expression?, Expression?)
}

extension RangeOperator: Blueprint
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

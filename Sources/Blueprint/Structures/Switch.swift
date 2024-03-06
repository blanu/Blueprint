//
//  Switch.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

public struct Switch
{
    public let on: Expression
    public let cases: [SwitchCase]
    public let defaultCase: [Statement]?

    public init(on: Expression, cases: [SwitchCase] = [], defaultCase: [Statement]? = nil)
    {
        self.on = on
        self.cases = cases
        self.defaultCase = defaultCase
    }
}

extension Switch: Blueprint
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

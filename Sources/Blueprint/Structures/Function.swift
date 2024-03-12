//
//  Function.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public struct Function
{
    public let mutating: Bool
    public let visibility: Visibility
    public let name: Text
    public let parameters: [Parameter]
    public let returnType: Type
    public let throwing: Bool
    public let async: Bool
    public let statements: [Statement]

    public init(mutating: Bool = false, visibility: Visibility = .public, name: Text, parameters: [Parameter] = [], returnType: Type = .void, throwing: Bool = false, async: Bool = false, statements: [Statement] = [])
    {
        self.mutating = mutating
        self.visibility = visibility
        self.name = name
        self.parameters = parameters
        self.returnType = returnType
        self.throwing = throwing
        self.async = async
        self.statements = statements
    }
}

extension Function: Blueprint
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

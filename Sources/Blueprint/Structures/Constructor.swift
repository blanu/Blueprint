//
//  Constructor.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

public struct Constructor
{
    public let visibility: Visibility
    public let parameters: [Parameter]
    public let failable: Bool
    public let throwing: Bool
    public let statements: [Statement]

    public init(visibility: Visibility = .public, parameters: [Parameter] = [], failable: Bool = false, throwing: Bool = false, statements: [Statement] = [])
    {
        self.visibility = visibility
        self.parameters = parameters
        self.failable = failable
        self.throwing = throwing
        self.statements = statements
    }
}

extension Constructor: Blueprint
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

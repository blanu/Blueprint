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
    public let visibility: Visibility
    public let name: Text
    public let parameters: [Parameter]
    public let returnType: Type
    public let throwing: Bool
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

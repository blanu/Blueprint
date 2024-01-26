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

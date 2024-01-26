//
//  SwiftRValue.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension RValue
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        switch self
        {
            case .literal(let literal):
                return try literal.transpile(.swift)

            case .property(let name):
                return "self.\(name)".text

            case .variable(let variable):
                return variable
        }
    }
}

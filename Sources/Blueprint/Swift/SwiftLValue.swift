//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension LValue
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        switch self
        {
            case .property(let name):
                return "self.\(name)".text

            case .variable(let variable):
                return variable

            case .variableDefinition(let definition):
                return try definition.transpile(.swift, indentation: indentation)
        }
    }
}

//
//  SwiftVariableDefinition.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension VariableDefinition
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        let mut = try self.mutability.transpile(.swift)

        let typeText: Text
        if let type = self.type
        {
            typeText = try type.transpile(.swift)
        }
        else
        {
            typeText = ""
        }

        return "\(i)\(mut) \(self.name)\(typeText)".text
    }
}

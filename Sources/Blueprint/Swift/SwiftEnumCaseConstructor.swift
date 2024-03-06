//
//  SwiftEnumCaseConstructor.swift
//  
//
//  Created by Dr. Brandon Wiley on 3/6/24.
//

import Foundation

import Text

extension EnumCaseConstructor
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        let valuesText: Text
        if self.values.isEmpty
        {
            valuesText = ""
        }
        else
        {
            valuesText = "(\(Text.join(try self.values.map { try $0.transpile(.swift) }, ", ")))".text
        }

        return """
        \(i)\(self.type).\(self.name)\(valuesText)
        """.text
    }
}

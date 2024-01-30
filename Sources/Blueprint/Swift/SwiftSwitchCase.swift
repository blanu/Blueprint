//
//  SwiftSwitchCase.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension SwitchCase
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        let argumentsText: Text
        if self.arguments.isEmpty
        {
            argumentsText = ""
        }
        else
        {
            argumentsText = "(\(try list(self.arguments)))".text
        }

        return """
        \(i)case .\(self.name)\(argumentsText):
        \(try indentedBlock(self.statements, indentation))
        """.text
    }
}

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

        return """
        \(i)case .\(self.name):
        \(Text.join(try self.arguments.map { try $0.transpile(.swift, indentation: indentation + 1) }, "\n"))
        """.text
    }
}

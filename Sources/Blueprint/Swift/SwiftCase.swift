//
//  SwiftCase.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension Case
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        let valueText: Text
        if let value = self.value
        {
            valueText = "(\(try value.transpile(.swift, indentation: indentation)))".text
        }
        else
        {
            valueText = ""
        }

        return """
        \(i)case \(self.name)\(valueText)
        """.text
    }
}

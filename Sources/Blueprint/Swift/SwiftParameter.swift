//
//  SwiftParameter.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension Parameter
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        let labelText: Text
        if self.anonymous
        {
            labelText = "_ ".text
        }
        else
        {
            if let label = self.label
            {
                labelText = "\(label) ".text
            }
            else
            {
                labelText = "".text
            }
        }

        let typeText: Text = try self.type.transpile(.swift)

        let defaultText: Text
        if let defaultValue = self.defaultValue
        {
            defaultText = " = \(defaultValue)".text
        }
        else
        {
            defaultText = "".text
        }

        return """
        \(i)\(labelText)\(self.name): \(typeText)\(defaultText)
        """.text
    }
}

//
//  SwiftExtension.swift
//
//
//  Created by Dr. Brandon Wiley on 1/27/24.
//

import Foundation

import Text

extension Extension
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let implementsText: Text
        if self.implements.isEmpty
        {
            implementsText = ""
        }
        else
        {
            implementsText = ": \(Text.join(self.implements, ", "))".text
        }

        let propertyText: Text
        if self.properties.isEmpty
        {
            propertyText = ""
        }
        else
        {
            propertyText = Text.join(try self.properties.map { try $0.transpile(.swift, indentation: indentation + 1) }, "\n")
        }

        let functionText: Text
        if self.functions.isEmpty
        {
            functionText = ""
        }
        else
        {
            functionText = Text.join(try self.functions.map { try $0.transpile(.swift, indentation: indentation + 1) }, "\n")
        }

        return """
        extension \(self.name)\(implementsText)
        {
        \(propertyText)
        \(functionText)
        }
        """.text
    }
}

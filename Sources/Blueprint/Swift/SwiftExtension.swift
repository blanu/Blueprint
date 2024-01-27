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

        return """
        extension \(self.name)\(implementsText)
        {
        \(try indentedBlock(self.properties, indentation))
        \(try indentedBlock(self.functions, indentation))
        \(try indentedBlock(self.structures, indentation))
        \(try indentedBlock(self.enumerations, indentation))
        }
        """.text
    }
}

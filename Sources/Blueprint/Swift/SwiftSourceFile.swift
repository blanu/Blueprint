//
//  SwiftSourceFile.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension SourceFile
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        let headerText: Text
        if let header = self.header
        {
            headerText = try header.transpile(.swift, indentation: indentation)
        }
        else
        {
            headerText = ""
        }

        let importText: Text
        if let imports = self.imports
        {
            importText = try imports.transpile(.swift, indentation: indentation)
        }
        else
        {
            importText = ""
        }

        let structText: Text
        if self.structs.isEmpty
        {
            structText = ""
        }
        else
        {
            structText = Text.join(try self.structs.map { try $0.transpile(.swift, indentation: indentation) }, "\n")
        }

        let enumText: Text
        if self.enums.isEmpty
        {
            enumText = ""
        }
        else
        {
            enumText = Text.join(try self.enums.map { try $0.transpile(.swift, indentation: indentation) }, "\n")
        }

        let functionText: Text
        if self.functions.isEmpty
        {
            functionText = ""
        }
        else
        {
            functionText = Text.join(try self.functions.map { try $0.transpile(.swift, indentation: indentation) }, "\n")
        }

        return """
        \(i)\(headerText)
        \(i)\(importText)
        \(i)\(structText)
        \(i)\(enumText)
        \(i)\(functionText)
        """.text
    }
}

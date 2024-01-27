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

        return """
        \(i)\(try optional(self.header))
        \(i)\(try optional(self.imports))
        \(i)\(try block(self.structs, indentation))
        \(i)\(try block(self.enums, indentation))
        \(i)\(try block(self.functions, indentation))
        \(i)\(try block(self.extensions, indentation))
        """.text
    }
}

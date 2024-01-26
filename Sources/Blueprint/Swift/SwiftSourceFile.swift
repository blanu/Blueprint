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
        \(i)\(try self.header.transpile(.swift, indentation: indentation))
        \(i)\(try self.imports.transpile(.swift, indentation: indentation))
        \(i)\(Text.join(try self.structs.map { try $0.transpile(.swift, indentation: indentation) }, "\n"))
        \(i)\(Text.join(try self.enums.map { try $0.transpile(.swift, indentation: indentation) }, "\n"))
        \(i)\(Text.join(try self.functions.map { try $0.transpile(.swift, indentation: indentation) }, "\n"))
        """.text
    }
}

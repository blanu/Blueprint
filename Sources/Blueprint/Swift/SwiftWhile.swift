//
//  SwiftWhile.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

extension While
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        return """
        \(i)while \(try self.expression.transpile(.swift))
        \(i){
        \(try indentedBlock(self.statements, indentation))
        \(i)}
        """.text
    }
}

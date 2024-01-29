//
//  SwiftGuard.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

extension Guard
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        switch self
        {
            case .condition(let expression, let statements):
                return """
                \(i)guard \(try expression.transpile(.swift)) else
                \(i){
                \(try indentedBlock(statements, indentation))
                \(i)}
                """.text

            case .let(let name, let expression, let statements):
                return """
                \(i)guard let \(name) = \(try expression.transpile(.swift)) else
                \(i){
                \(try indentedBlock(statements, indentation))
                \(i)}
                """.text
        }
    }
}

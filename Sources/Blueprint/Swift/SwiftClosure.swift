//
//  SwiftClosure.swift
//  
//
//  Created by Dr. Brandon Wiley on 3/18/24.
//

import Foundation

import Text

extension Closure
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        return """
        \(i){
        \(Text.join(try self.statements.map { try $0.transpile(.swift, indentation: indentation + 1) }, "\n"))
        \(i)}
        """.text
    }
}

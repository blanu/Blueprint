//
//  SwiftChainedExpression.swift
//
//
//  Created by Dr. Brandon Wiley on 3/18/24.
//

import Foundation

import Text

extension ChainedExpression
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        return """
        \(try self.lvalue.transpile(.swift)).\(try self.rvalue.transpile(.swift, indentation: indentation))
        """.text
    }
}

//
//  SwiftStatement.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension Statement
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        switch self
        {
            case .assignment(let left, let right):
                return "\(i)\(try left.transpile(.swift)) = \(try right.transpile(.swift))".text

            case .blank:
                return ""

            case .break:
                return "\(i)break".text

            case .comment(let comment):
                return "\(i)\(try comment.transpile(.swift, indentation: indentation))".text

            case .continue:
                return "\(i)break".text

            case .expression(let expression):
                return "\(i)\(try expression.transpile(.swift, indentation: indentation))".text

            case .guard(let guardStatement):
                return try guardStatement.transpile(.swift, indentation: indentation)

            case .return:
                return "\(i)return".text

            case .throw(let expression):
                return "\(i)throw \(try expression.transpile(.swift))".text

            case .while(let loop):
                return try loop.transpile(.swift, indentation: indentation)
        }
    }
}

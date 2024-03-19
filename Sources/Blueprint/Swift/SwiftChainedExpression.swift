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
        var suppressTryAwait: Bool = false

        let tryingText: Text
        if self.rvalue.trying
        {
            tryingText = "try "
            suppressTryAwait = true
        }
        else
        {
            tryingText = ""
        }

        let asyncText: Text
        if self.rvalue.async
        {
            asyncText = "try "
            suppressTryAwait = true
        }
        else
        {
            asyncText = ""
        }

        if suppressTryAwait
        {
            let suppressedFunction = FunctionCall(trying: false, async: false, name: self.rvalue.name, genericTypeParameters: self.rvalue.genericTypeParameters, arguments: self.rvalue.arguments)

            return """
            \(tryingText)\(asyncText)\(try self.lvalue.transpile(.swift)).\(try suppressedFunction.transpile(Target.swift, indentation: indentation))
            """.text
        }
        else
        {
            return """
            \(tryingText)\(asyncText)\(try self.lvalue.transpile(.swift)).\(try self.rvalue.transpile(.swift, indentation: indentation))
            """.text
        }
    }
}

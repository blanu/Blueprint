//
//  SwiftMathExpression.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension MathExpression
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        switch self
        {
            case .infix(let op, let x, let y):
                let xText: Text
                switch x
                {
                    case .math(_):
                        xText = "(\(try x.transpile(.swift)))".text

                    default:
                        xText = try x.transpile(.swift)
                }

                let yText: Text
                switch y
                {
                    case .math(_):
                        yText = "(\(try y.transpile(.swift)))".text

                    default:
                        yText = try y.transpile(.swift)
                }

                return "\(i)\(xText) \(try op.transpile(.swift)) \(yText)".text

            case .postfix(let op, let x):
                let xText: Text
                switch x
                {
                    case .math(_):
                        xText = "(\(try x.transpile(.swift)))".text

                    default:
                        xText = try x.transpile(.swift)
                }

                return "\(i)\(xText) \(try op.transpile(.swift))".text

            case .prefix(let op, let x):
                let xText: Text
                switch x
                {
                    case .math(_):
                        xText = "(\(try x.transpile(.swift)))".text

                    default:
                        xText = try x.transpile(.swift)
                }

                return "\(i)\(try op.transpile(.swift)) \(xText)".text
        }
    }
}

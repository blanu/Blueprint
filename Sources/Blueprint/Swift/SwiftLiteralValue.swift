//
//  SwiftLiteralValue.swift
//
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension LiteralValue
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        switch self
        {
            case .array(let array):
                return "[\(Text.join(try array.map { try $0.transpile(.swift) }, ", "))]".text

            case .boolean(let boolean):
                return boolean ? "true" : "false"

            case .constructor(let type, let parameters):
                return "\(type)(\(Text.join(try parameters.map { try $0.transpile(.swift) }, ", ")))".text

            case .dictionary(keys: let keys, values: let values):
                guard keys.count == values.count else
                {
                    throw LiteralValueError.mismatchedKeyAndValueSizes
                }

                let pairs = zip(keys, values)
                return """
                [\(Text.join(try pairs.map
                {
                    pair in

                    let (key, value) = pair

                    return "\(try key.transpile(.swift)): \(try value.transpile(.swift))".text
                }, ", "))]
                """.text

            case .number(let number):
                return "\(number)".text

            case .string(let string):
                return "\"\(string)\"".text
        }
    }
}

public enum LiteralValueError: Error
{
    case mismatchedKeyAndValueSizes
}

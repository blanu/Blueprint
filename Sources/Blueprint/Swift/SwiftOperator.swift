//
//  Operator.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

extension Operator
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        switch self
        {
            case .add:
                return "+"

            case .bitwiseAnd:
                return "&"

            case .booleaAnd:
                return "&&"

            case .bitwiseOr:
                return "|"

            case .booleanOr:
                return "||"

            case .divide:
                return "/"

            case .equal:
                return "=="

            case .greaterThan:
                return ">"

            case .greaterThanOrEqual:
                return ">="

            case .lessThan:
                return "<"

            case .lessThanOrEqual:
                return "<="

            case .multiply:
                return "*"

            case .negate:
                return "-"

            case .not:
                return "!"

            case .subtract:
                return "-"
        }
    }
}

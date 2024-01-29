//
//  SwiftCast.swift
//
//
//  Created by Dr. Brandon Wiley on 1/28/24.
//

import Foundation

import Text

extension Cast
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        return "\(try self.type.transpile(.swift))(\(try self.expression.transpile(.swift)))".text
    }
}

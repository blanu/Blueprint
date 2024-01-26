//
//  SwiftComment.swift
//
//
//  Created by Dr. Brandon Wiley on 1/25/24.
//

import Foundation

import Text

extension Comment
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        return """
        \(i) // \(self.text)
        """.text
    }
}

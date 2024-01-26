//
//  SwiftFileHeader.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/24/24.
//

import Foundation

import Text

extension FileHeader
{
    func transpileSwift(_ indentation: Int) throws -> Text
    {
        let i = indent(indentation)

        return """
        \(i)//
        \(i)//  \(self.filename).swift
        \(i)//
        \(i)//
        \(i)//  Created by the Daydream Compiler on \(self.creationDate).
        \(i)//
        """.text
    }
}

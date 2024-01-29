//
//  TryCatch.swift
//
//
//  Created by Dr. Brandon Wiley on 1/29/24.
//

import Foundation

import Text

public struct TryCatch
{
    public let tryBlock: [Statement]
    public let catchBlock: [Statement]

    public init(tryBlock: [Statement], catchBlock: [Statement] = [])
    {
        self.tryBlock = tryBlock
        self.catchBlock = catchBlock
    }
}

extension TryCatch: Blueprint
{
    public func transpile(_ target: Target, indentation: Int = 0) throws -> Text
    {
        switch target
        {
            case .swift:
                return try self.transpileSwift(indentation)
        }
    }
}

//
//  GeneralFunctionCall.swift
//
//
//  Created by Dr. Brandon Wiley on 2/4/24.
//

import Foundation

public enum GeneralFunctionCall
{
    case `try`(FunctionArguments, FunctionReturnType)
    case notry(FunctionArguments, FunctionReturnType)
}

public enum FunctionArguments
{
    case none
    case some([Type])
}

public enum FunctionReturnType
{
    case none
    case some([Type])
}

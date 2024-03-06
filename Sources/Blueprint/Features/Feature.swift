//
//  Feature.swift
//
//
//  Created by Dr. Brandon Wiley on 1/30/24.
//

import Foundation

public protocol Feature
{
    init(features: Features)
    func update() throws
}

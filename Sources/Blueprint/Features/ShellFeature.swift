//
//  ShellFeature.swift
//
//
//  Created by Dr. Brandon Wiley on 1/30/24.
//

import Foundation

public struct ShellFeature: Feature
{
    let features: Features

    public init(features: Features)
    {
        self.features = features
    }

    public func update() throws
    {
        
    }
}

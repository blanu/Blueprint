//
//  Features.swift
//
//
//  Created by Dr. Brandon Wiley on 1/30/24.
//

import Foundation

public class Features
{
    public var client: ClientFeature? = nil
    public var runtimeConfiguration: RuntimeConfiguration? = nil
    public var service: ServiceFeature? = nil
    public var shell: ShellFeature? = nil

    public init()
    {
    }

    public func update() throws
    {
        if let client = client
        {
            try client.update()
        }

        if let runtimeConfiguration = runtimeConfiguration
        {
            try runtimeConfiguration.update()
        }

        if let service = service
        {
            try service.update()
        }

        if let shell = shell
        {
            try shell.update()
        }
    }
}

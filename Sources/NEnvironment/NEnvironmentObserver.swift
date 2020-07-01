//
//  NEnvironmentObserver.swift
//  NEnvironment
//
//  Created by Victor Melo on 30/06/20.
//  Copyright © 2020 Victor Melo. All rights reserved.
//

import Foundation

public protocol NEnvironmentObserver: AnyObject { }
public extension NEnvironmentObserver {
    func registerEnvironmentObserver(_ selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name("Environment"), object: nil)
    }
}

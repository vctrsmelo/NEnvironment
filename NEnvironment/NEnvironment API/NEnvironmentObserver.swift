//
//  NEnvironmentObserver.swift
//  NEnvironment
//
//  Created by Victor Melo on 30/06/20.
//  Copyright © 2020 Victor Melo. All rights reserved.
//

import Foundation

protocol NEnvironmentObserver: AnyObject { }
extension NEnvironmentObserver {
    func registerObserver(_ selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name("Environment"), object: nil)
    }
}

//
//  NEnvironmentKeyAndValue.swift
//  NEnvironment
//
//  Created by Victor Melo on 30/06/20.
//  Copyright © 2020 Victor Melo. All rights reserved.
//

import Foundation

protocol NEnvironmentKey {
    var environmentId: String { get }
}

protocol NEnvironmentValue {
    static var defaultValue: Self { get }
}

// MARK: Key Extensions

extension String: NEnvironmentKey {
    public var environmentId: String {
        self
    }
}

extension Int: NEnvironmentKey {
    var environmentId: String { "\(self)" }
}

// MARK: Value Extensions

extension String: NEnvironmentValue {
    static let defaultValue: String = ""
}

extension Int: NEnvironmentValue {
    static let defaultValue: Int = 0
}

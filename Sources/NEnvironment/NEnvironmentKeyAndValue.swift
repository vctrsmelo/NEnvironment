//
//  NEnvironmentKeyAndValue.swift
//  NEnvironment
//
//  Created by Victor Melo on 30/06/20.
//  Copyright © 2020 Victor Melo. All rights reserved.
//

import Foundation
import CryptoKit

protocol NEnvironmentKey {
    var environmentId: Int { get }
}

protocol NEnvironmentValue {
    static var defaultValue: Self { get }
}

// MARK: Key Extensions

extension String: NEnvironmentKey {
    public var environmentId: Int {
        SHA256.hash(data: Data(self.utf8)).hashValue
    }
}

extension Int: NEnvironmentKey {
    var environmentId: Int { self }
}

// MARK: Value Extensions

extension String: NEnvironmentValue {
    static let defaultValue: String = ""
}

extension Int: NEnvironmentValue {
    static let defaultValue: Int = 0
}

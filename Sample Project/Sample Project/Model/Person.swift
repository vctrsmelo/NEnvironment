//
//  Person.swift
//  Sample Project
//
//  Created by Victor Melo on 01/07/20.
//  Copyright © 2020 Victor Melo. All rights reserved.
//

import Foundation
import NEnvironment

struct Person {
    var name: String
    var age: Int
}

extension Person: NEnvironmentValue {
    static var defaultValue = Person(name: "", age: 0)
}

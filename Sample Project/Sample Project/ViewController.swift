//
//  ViewController.swift
//  Sample Project
//
//  Created by Victor Melo on 01/07/20.
//  Copyright © 2020 Victor Melo. All rights reserved.
//

import UIKit
import NEnvironment



class ViewController: UIViewController, NEnvironmentObserver {
    
    @NEnvironmentObject(id: "person") var person: Person
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerEnvironmentObserver(#selector(didUpdateEnvironment))
    }
    
    override func viewWillLayoutSubviews() {
        self.nameLabel.text = "Name: \(person.name)"
        ageLabel.text = "Age: \(person.age)"
    }
    
    @objc
    func didUpdateEnvironment() {
        view.setNeedsLayout()
    }
    
    
}


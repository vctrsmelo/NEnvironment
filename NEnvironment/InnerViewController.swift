//
//  InnerViewController.swift
//  NEnvironment
//
//  Created by Victor Melo on 29/06/20.
//  Copyright © 2020 Victor Melo. All rights reserved.
//

import Foundation
import UIKit

class InnerViewController: UIViewController, NEnvironmentObserver {
    
    @NEnvironmentObject(id: .name) var name: String
    @NEnvironmentObject(id: "age", defaultValue: 0) var age: Int
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        registerObserver(#selector(updatedEnvironment))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.text = name
    }
    
    override func viewDidLayoutSubviews() {
        nameLabel.text = name
        ageLabel.text = "\(age)"
    }
    
    @objc
    private func updatedEnvironment() {
        view.setNeedsLayout()
    }
    
}

extension InnerViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        self.name = text
    }
}

//
//  ViewController.swift
//  NEnvironment
//
//  Created by Victor Melo on 29/06/20.
//  Copyright © 2020 Victor Melo. All rights reserved.
//

import UIKit

struct ViewModel {
    @NEnvironmentObject(id: "name") var name: String
    @NEnvironmentObject(id: "age") var age: Int
}

class ViewController: UIViewController, NEnvironmentObserver {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nameValueLabel: UILabel!
    
    private var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerObserver(#selector(self.environmentUpdated))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.text = viewModel.name
    }
    
    override func viewWillLayoutSubviews() {
        nameValueLabel.text = viewModel.name
    }

    @objc
    func environmentUpdated() {
        view.setNeedsLayout()
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == nameTextField {
            self.viewModel.name = textField.text ?? ""
        } else {
            self.viewModel.age = Int(textField.text ?? "") ?? 0
        }
    }
}

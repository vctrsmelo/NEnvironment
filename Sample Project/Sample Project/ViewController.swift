//
//  ViewController.swift
//  Sample Project
//
//  Created by Victor Melo on 01/07/20.
//  Copyright © 2020 Victor Melo. All rights reserved.
//

import UIKit
import NEnvironment

class ViewController: UIViewController {
    
    @NEnvironmentObject var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


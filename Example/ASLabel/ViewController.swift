//
//  ViewController.swift
//  ASLabel
//
//  Created by amitpstu1@gmail.com on 07/05/2020.
//  Copyright (c) 2020 amitpstu1@gmail.com. All rights reserved.
//

import UIKit
import ASLabel

class ViewController: UIViewController {
    
    @IBOutlet weak var fullNameLabel: ASLabelStyleClassic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameLabel
            .setFont(UIFont.systemFont(ofSize: 15))
            .setTitle("Full Name", 0.5)
            .setText("Mr. Amit")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

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
    
    @IBOutlet weak var fullNameLabel: ASLabel!
    @IBOutlet weak var emailLabel: ASLabel!
    @IBOutlet weak var descriptionLabel: ASLabel!
    @IBOutlet weak var addressLabel: ASLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameLabel
            .setText("Steve Jobs")
            .setLabelAlignment(.center)
        
        emailLabel
            .setText("stevejobs@gmail.com")
        
        descriptionLabel
            .setText("Steven Paul Jobs was an American business magnate, industrial designer, investor, and media proprietor.")
        
        addressLabel
            .setText("Born: February 24, 1955, San Francisco, California, United States.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

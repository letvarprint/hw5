//
//  UserBioViewController.swift
//  hw5
//
//  Created by Alexandru Brixencov on 11.10.2023.
//

import UIKit

class UserBioViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var userDescription = ""
    var name = ""
    var surname = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = userDescription
        titleLabel.text = "\(name) \(surname) BIO"
        
    }

}

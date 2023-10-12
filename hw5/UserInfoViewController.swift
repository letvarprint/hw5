//
//  UserInfoViewController.swift
//  hw5
//
//  Created by Alexandru Brixencov on 11.10.2023.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    var name = ""
    var surname = ""
    var company = ""
    var department = ""
    var position = ""
    var userDescription = ""
    var image = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        surnameLabel.text = surname
        companyLabel.text = company
        departmentLabel.text = department
        positionLabel.text = position
        titleLabel.text = "\(name) \(surname)"
        userImage.image = UIImage(named: image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? UserBioViewController else {return}
        viewController.userDescription = userDescription
        viewController.name = name
        viewController.surname = surname
    }
}

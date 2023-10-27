

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var nameSurnameLabel: UILabel!
    
    var newLabel = ""
    var name = ""
    var surname = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(newLabel)!"
        nameSurnameLabel.text = "My name is \(name) \(surname)"
    }
}

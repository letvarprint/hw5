

import UIKit

class WelcomeViewController: UIViewController {
    
    var newLabel: String!

    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(newLabel ?? "")!"
    }
}

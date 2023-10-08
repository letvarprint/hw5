import UIKit

class ViewController: UIViewController {
    
    var user = "user"
    var password = "password"

    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameLabel.text == user, passwordLabel.text == password else {
            showIssueAlert(with: "Invalid user name or password", and: "Please check your details")
            return false
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.newLabel = userNameLabel.text
    }

    @IBAction func forgotUserButton() {
        showIssueAlert(with: "Ooops!", and: "Your name is \(user)")
    }
    @IBAction func forgotPassButton() {
        showIssueAlert(with: "Ooops!", and: "Your password is \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameLabel.text = ""
        passwordLabel.text = ""
    }
}




//MARK: - UIAlertController
extension ViewController {
    private func showIssueAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordLabel.text = ""}
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}


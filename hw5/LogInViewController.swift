import UIKit

final class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var user = "user"
    private var password = "password"
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user, passwordTextField.text == password else {
            showIssueAlert(with: "Invalid user name or password",
                           and: "Please check your details",
                            textField: passwordTextField)
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
        welcomeVC.newLabel = user
    }


    @IBAction func forgotCredentials(_ sender: UIButton) {
    sender.tag == 0 ? showIssueAlert(with: "Oooops", and: "Your username is user") : showIssueAlert(with: "Ooops", and: "Your password is password")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}




//MARK: - UIAlertController
extension LogInViewController {
    private func showIssueAlert(with title: String, and message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert
                                        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""}
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


import UIKit

final class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = User.getUser()
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user.userName, passwordTextField.text == user.password else {
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
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBarController.viewControllers else { return}
        
        for viewController in viewControllers {
            if let firstVC = viewController as? WelcomeViewController {
                firstVC.newLabel = user.userName
                firstVC.name = user.userInfo.name
                firstVC.surname = user.userInfo.surname
            } else if let navigationVC = viewController as? UINavigationController {
                if let secondVC = navigationVC.topViewController as? UserInfoViewController {
                    secondVC.name = user.userInfo.name
                    secondVC.surname = user.userInfo.surname
                    secondVC.company = user.userInfo.company
                    secondVC.department = user.userInfo.department
                    secondVC.position = user.userInfo.possition
                    secondVC.userDescription = user.userInfo.story
                    secondVC.image = user.userInfo.image
                }
            } 
        }
    }


    @IBAction func forgotCredentials(_ sender: UIButton) {
        sender.tag == 0 ? showIssueAlert(with: "Oooops", and: "Your username is \(user.userName)") : showIssueAlert(with: "Ooops", and: "Your password is \(user.password)")
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


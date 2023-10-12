import UIKit

final class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let userOne = User.getUser()
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == userOne.userName, passwordTextField.text == userOne.password else {
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
                firstVC.newLabel = userOne.userName
                firstVC.name = userOne.userInfo.name
                firstVC.surname = userOne.userInfo.surname
            } else if let navigationVC = viewController as? MainNavigationController {
                if let secondVC = navigationVC.topViewController as? UserInfoViewController {
                    secondVC.name = userOne.userInfo.name
                    secondVC.surname = userOne.userInfo.surname
                    secondVC.company = userOne.userInfo.company
                    secondVC.department = userOne.userInfo.department
                    secondVC.position = userOne.userInfo.possition
                    secondVC.userDescription = userOne.userInfo.story
                    secondVC.image = userOne.userInfo.image
                }
            } 
        }
    }


    @IBAction func forgotCredentials(_ sender: UIButton) {
        sender.tag == 0 ? showIssueAlert(with: "Oooops", and: "Your username is \(userOne.userName)") : showIssueAlert(with: "Ooops", and: "Your password is \(userOne.password)")
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


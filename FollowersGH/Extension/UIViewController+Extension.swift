import UIKit

extension UIViewController {
	
	func presentAlert(titleAlert: String, message: String, titleButton: String){
		let alertController = UIAlertController(title: titleAlert, message: message, preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: titleButton, style: .default))
		present(alertController, animated: true)
	}
}

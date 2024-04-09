import UIKit

class FollowerListVC: UIViewController {
	
	var userName: String?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemPink
		navigationController?.isNavigationBarHidden = false
		navigationController?.navigationBar.prefersLargeTitles = true
	}
}

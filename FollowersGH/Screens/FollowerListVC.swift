import UIKit

class FollowerListVC: UIViewController {
	
	var userName: String!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemPink
		navigationController?.isNavigationBarHidden = false
		navigationController?.navigationBar.prefersLargeTitles = true
		
		NetworkManager.shared.getFollower(for: userName, page: 1) { (followers, errorMessage) in
			guard let followers else {
				self.presentAlert(titleAlert: "Bad stuf happend", message: errorMessage!, titleButton: "Ok")
				return
			}
			
			print(followers.count)
			dump(followers)
			
		}
	}
}

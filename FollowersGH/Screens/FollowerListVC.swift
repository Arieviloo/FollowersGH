import UIKit

class FollowerListVC: UIViewController {
	
	var userName: String!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemPink
		navigationController?.isNavigationBarHidden = false
		navigationController?.navigationBar.prefersLargeTitles = true
		
		NetworkManager.shared.getFollower(for: userName, page: 1) { result in
			switch result {
			case .success(let followers):
				print(followers.count)
				dump(followers)
			case .failure(let error):
				self.presentAlert(titleAlert: "Bad stuf happend", message: error.rawValue, titleButton: "Ok")
			}
			
		}
	}
}

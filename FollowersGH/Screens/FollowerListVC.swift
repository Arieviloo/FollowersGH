import UIKit

class FollowerListVC: UIViewController {
	
	var userName: String!
	var collectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureViewController()
		configureCollectionView()
		getFollowers()
	
	}
	
	private func configureViewController() {
		view.backgroundColor = .systemPink
		navigationController?.isNavigationBarHidden = false
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	private func configureCollectionView() {
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
		view.addSubview(collectionView)
		collectionView.backgroundColor = .systemBlue
		collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.identifier)
	}
	
	private func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
		let width = view.bounds.width
		let padding: CGFloat = 12
		let mininumItemSpacing:CGFloat = 10
		let availableWidth = width - (padding * 2) - (mininumItemSpacing * 2)
		let itemWidth = availableWidth / 3
		
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
		flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
		return flowLayout
	}
	
	private func getFollowers() {
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



import UIKit

class FollowerListVC: UIViewController {
	
	enum Section {
		case main
	}
	
	var userName: String!
	var collectionView: UICollectionView!
	var followers: [Follower] = []
	var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureViewController()
		configureCollectionView()
		getFollowers()
		configureDataSource()
	
	}
	
	private func configureViewController() {
		view.backgroundColor = .systemPink
		navigationController?.isNavigationBarHidden = false
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	private func configureCollectionView() {
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
		view.addSubview(collectionView)
		collectionView.backgroundColor = .systemBackground
		collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.identifier)
	}
	
	
	
	private func getFollowers() {
		NetworkManager.shared.getFollower(for: userName, page: 1) {[weak self] result in
			guard let self else { return }
			switch result {
			case .success(let followers):
				self.followers = followers
				self.updateData()
			case .failure(let error):
				self.presentAlert(titleAlert: "Bad stuf happend", message: error.rawValue, titleButton: "Ok")
			}
			
		}
	}
	
	private func configureDataSource() {
		dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: {
			(collectionView, indexPath, follower ) -> UICollectionViewCell? in
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.identifier, for: indexPath) as! FollowerCell
			cell.set(follower: follower)
			return cell
		})
	}
	
	private func updateData() {
		var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
		snapshot.appendSections([.main])
		snapshot.appendItems(followers)
		DispatchQueue.main.async {self.dataSource.apply(snapshot, animatingDifferences: true)}
	}
	
	
}



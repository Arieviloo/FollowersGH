import UIKit

class FollowerCell: UICollectionViewCell {
	static let identifier = "FollowerCell"
	let avatarImageView = GFAvatarImageView(frame: .zero)
	let usernameLabel = GFTitleLabel(textAligment: .center, fontSize: 16)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func set(follower: Follower) {
		usernameLabel.text = follower.login
		}
	
	private func configure() {
		addSubview(avatarImageView)
		addSubview(usernameLabel)
		
		let padding: CGFloat = 8
		
		NSLayoutConstraint.activate([
			avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
			avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			avatarImageView.widthAnchor.constraint(equalToConstant: 100),
			avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
			
			usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
			usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			usernameLabel.heightAnchor.constraint(equalToConstant: 20),
		])
	}
	
}

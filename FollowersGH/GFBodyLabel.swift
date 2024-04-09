import UIKit

class GFBodyLabel: UILabel {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(textAligment: NSTextAlignment) {
		super.init(frame: .zero)
		self.textAlignment = textAligment
		configure()
	}
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		font = UIFont.preferredFont(forTextStyle: .body)
		textColor = .label
		adjustsFontSizeToFitWidth = true
		minimumScaleFactor = 0.75
		lineBreakMode = .byTruncatingTail
	}
}

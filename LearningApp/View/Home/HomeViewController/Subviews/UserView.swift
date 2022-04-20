//
//  UserView.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import UIKit

class UserView: UIView {
    
    private let commonStackView = UIStackView()
    private let avatarAndLabelsStackView = UIStackView()
    private let labelsStackView = UIStackView()
    
    private let avatarView = UserAvatarView()
    private let primaryLabel = UILabel.make(fontName: poppinsBold, size: 16, textColor: .appDarkGray)
    private let secondaryLabel = UILabel()
    
    private let bellIndicatorView = BellIndicatorView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.pinToEdges(subview: commonStackView)
        commonStackView.axis = .horizontal
        commonStackView.distribution = .equalSpacing
        commonStackView.alignment = .center
        commonStackView.addArrangedSubview(avatarAndLabelsStackView)
        commonStackView.addArrangedSubview(bellIndicatorView)
        avatarAndLabelsStackView.axis = .horizontal
        avatarAndLabelsStackView.alignment = .leading
        avatarAndLabelsStackView.spacing = 18
        avatarAndLabelsStackView.alignment = .center
        avatarAndLabelsStackView.addArrangedSubview(avatarView)
        avatarAndLabelsStackView.addArrangedSubview(labelsStackView)
        avatarView.setDimensions(width: 40, height: 40)
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 4
        labelsStackView.addArrangedSubview(primaryLabel)
        labelsStackView.addArrangedSubview(secondaryLabel)
    }
    
    func updateForHomeScreen(with user: UserViewModel) {
        avatarView.update(image: user.image ?? UIImage(systemName: "person")!, isOnline: user.isOnline)
        primaryLabel.text = "Hello, \(user.name.capitalized)!"
        let hasReward = user.reward != nil
        let rewardString = NSMutableAttributedString(string: hasReward ? "   +\(user.reward!)" : "", attributes: [.font : UIFont(name: poppinsSemiBold, size: 14)!])
        let pointsString = NSMutableAttributedString(string: " Points", attributes: [.font : UIFont(name: poppinsRegular, size: 14)!])
        rewardString.append(pointsString)
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "Reward")
        imageAttachment.bounds = CGRect(x: 0, y: -2, width: 10, height: 15)
        rewardString.insert(NSAttributedString(attachment: imageAttachment), at: 0)
        secondaryLabel.attributedText = rewardString
        secondaryLabel.isHidden = !hasReward
        secondaryLabel.textColor = .appYellow
        bellIndicatorView.update(showsIndicator: user.hasNotifications)
    }
    
    func updateForMessages(with user: UserViewModel) {
        avatarView.update(image: user.image ?? UIImage(systemName: "person")!, isOnline: user.isOnline)
        primaryLabel.text = "My messages"
        secondaryLabel.textColor = .appTabGray
        secondaryLabel.font = UIFont(name: poppinsRegular, size: 14)
        secondaryLabel.text = user.newMessagesCount
        bellIndicatorView.update(showsIndicator: user.hasNotifications)
    }
}

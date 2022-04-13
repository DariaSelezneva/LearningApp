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
    private let greetingLabel = UILabel()
    
    private let rewardStackView = UIStackView()
    private let rewardImageView = UIImageView()
    private let rewardLabel = UILabel()
    private let pointsLabel = UILabel()
    
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
        commonStackView.addArrangedSubview(avatarAndLabelsStackView)
        commonStackView.addArrangedSubview(bellIndicatorView)
        avatarAndLabelsStackView.axis = .horizontal
        avatarAndLabelsStackView.alignment = .leading
        avatarAndLabelsStackView.spacing = 18
        avatarAndLabelsStackView.addArrangedSubview(avatarView)
        avatarAndLabelsStackView.addArrangedSubview(labelsStackView)
        avatarView.setDimensions(width: 40, height: 40)
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 8
        labelsStackView.addArrangedSubview(greetingLabel)
        labelsStackView.addArrangedSubview(rewardStackView)
        greetingLabel.textColor = .appDarkGray
        greetingLabel.font = UIFont(name: poppinsBold, size: 16)
        rewardStackView.axis = .horizontal
        rewardStackView.spacing = 10
        rewardStackView.addArrangedSubview(rewardImageView)
        rewardStackView.addArrangedSubview(rewardLabel)
        rewardStackView.addArrangedSubview(pointsLabel)
        rewardImageView.setDimensions(width: 10, height: 15)
        rewardImageView.image = UIImage(named: "Reward")
        rewardLabel.textColor = .appYellow
        rewardLabel.font = UIFont(name: poppinsSemiBold, size: 14)
        pointsLabel.textColor = .appYellow
        pointsLabel.font = UIFont(name: poppinsRegular, size: 14)
        pointsLabel.text = "Points"
    }
    
    func update(with user: UserViewModel) {
        avatarView.update(image: user.image, isOnline: user.isOnline)
        greetingLabel.text = "Hello, \(user.name.capitalized)!"
        let hasReward = user.reward != nil
        rewardLabel.text = hasReward ? "+\(user.reward!)" : ""
        rewardImageView.isHidden = !hasReward
        pointsLabel.isHidden = !hasReward
        bellIndicatorView.update(showsIndicator: user.hasNotifications)
    }
}

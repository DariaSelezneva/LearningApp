//
//  ChatTableViewCell.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "chatCell"
    
    private lazy var commonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .top
        stackView.addArrangedSubview(avatarView)
        stackView.addArrangedSubview(labelsStackView)
        return stackView
    }()
    
    private lazy var avatarView: UserAvatarView = {
        let avatarView = UserAvatarView()
        avatarView.setDimensions(width: 40, height: 40)
        return avatarView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.alignment = .leading
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(messageLabel)
        return stackView
    }()
    
    private let nameLabel = UILabel.make(fontName: poppinsSemiBold, size: 16, textColor: .appDarkGray, numberOfLines: 2)
    
    private let messageLabel = UILabel.make(fontName: poppinsRegular, size: 14, textColor: .appGray2, numberOfLines: 2)
    
    private let dateLabel = UILabel.make(fontName: poppinsRegular, size: 14, textColor: .appTabGray)
    
    let circleView = UIView()
    private let unreadMessagesLabel = UILabel.make(fontName: poppinsMedium, size: 16, textColor: .white)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        contentView.pinToEdges(subview: commonStackView, leading: 16, trailing: 60, top: 16, bottom: nil)
        contentView.pinToEdges(subview: dateLabel, leading: nil, trailing: 16, top: 16, bottom: nil)
        contentView.pinToEdges(subview: circleView, leading: nil, trailing: 16, top: nil, bottom: 16)
        circleView.setDimensions(width: 24, height: 24)
        circleView.layer.cornerRadius = 12
        circleView.backgroundColor = .appBlue
        circleView.alignToCenter(subview: unreadMessagesLabel)
    }
    
    func update(with chat: ChatViewModel) {
        avatarView.update(image: chat.image, isOnline: chat.isOnline)
        nameLabel.text = chat.name
        messageLabel.text = chat.lastMessage
        dateLabel.text = chat.date
        circleView.isHidden = chat.newMessages == 0
        unreadMessagesLabel.text = String(chat.newMessages)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

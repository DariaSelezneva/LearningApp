//
//  LessonTableViewCell.swift
//  LearningApp
//
//  Created by Дарья Селезнёва on 15.04.2022.
//

import UIKit

class LessonTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "lessonCell"
    
    private lazy var commonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.addArrangedSubview(playView)
        stackView.addArrangedSubview(labelsStackView)
        return stackView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(durationLabel)
        return stackView
    }()
    
    private lazy var playView: LessonPlayView = {
        let playView = LessonPlayView()
        playView.setDimensions(width: 67, height: 67)
        playView.layer.cornerRadius = 10
        return playView
    }()
    
    private let titleLabel = UILabel.make(fontName: poppinsSemiBold, size: 14, textColor: .appDarkGray, numberOfLines: 2)
    
    private lazy var durationLabel = UILabel.make(fontName: poppinsRegular, size: 14, textColor: .appGray2)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        let containerView = UIView()
        contentView.pinToEdges(subview: containerView, leading: 0, trailing: 0, top: 8, bottom: 8)
        containerView.layer.cornerRadius = 8
        containerView.backgroundColor = .appLightGray2
        contentView.pinToEdges(subview: commonStackView, leading: 8, trailing: 8, top: 16, bottom: 16)
    }
    
    func update(with lesson: LessonViewModel) {
        titleLabel.text = lesson.title
        durationLabel.text = lesson.duration
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

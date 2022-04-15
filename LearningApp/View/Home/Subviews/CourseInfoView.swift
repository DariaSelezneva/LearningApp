//
//  CourseInfoView.swift
//  LearningApp
//
//  Created by Daria on 14.04.2022.
//

import UIKit

class CourseInfoView: UIView {
    
    private let commonStackView = UIStackView()
    private let coloredLabelsView = ColoredLabelsView()
    private let titleDurationStackView = UIStackView()
    private let courseTitleLabel = UILabel()
    private let durationLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.pinToEdges(subview: commonStackView)
        commonStackView.axis = .vertical
        commonStackView.spacing = 16
        commonStackView.alignment = .leading
        commonStackView.addArrangedSubview(titleDurationStackView)
        commonStackView.addArrangedSubview(coloredLabelsView)
        titleDurationStackView.axis = .vertical
        titleDurationStackView.spacing = 4
        titleDurationStackView.addArrangedSubview(courseTitleLabel)
        titleDurationStackView.addArrangedSubview(durationLabel)
        courseTitleLabel.numberOfLines = 3
        courseTitleLabel.lineBreakMode = .byTruncatingTail
        courseTitleLabel.font = UIFont(name: poppinsSemiBold, size: 18)
        courseTitleLabel.textColor = .white
        durationLabel.font = UIFont(name: poppinsMedium, size: 10)
        durationLabel.textColor = .appGray
    }
     
    func update(with course: CourseViewModel) {
        courseTitleLabel.text = course.title
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "stopwatch")?.withTintColor(.appGray!)
        imageAttachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        let durationString = NSMutableAttributedString(string: "  " + course.duration)
        durationString.insert(NSAttributedString(attachment: imageAttachment), at: 0)
        durationLabel.attributedText = durationString
        coloredLabelsView.update(lessonsQuantity: course.numberOfLessons, theme: course.theme, cost: course.cost)
    }
}

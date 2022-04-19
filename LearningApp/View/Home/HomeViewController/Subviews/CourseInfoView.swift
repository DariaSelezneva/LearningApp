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
    private let courseTitleLabel = UILabel.make(fontName: poppinsSemiBold, size: 18, textColor: .white)
    private let durationLabel = UILabel.make(fontName: poppinsMedium, size: 10, textColor: .appGray2)
    
    
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
    }
     
    func update(with course: CourseViewModel) {
        courseTitleLabel.text = course.title
        durationLabel.updateForCourseDuration(course.duration)
        coloredLabelsView.update(lessonsQuantity: course.numberOfLessons, theme: course.theme, cost: course.cost)
    }
}

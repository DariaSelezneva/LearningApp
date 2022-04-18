//
//  CourseCollectionViewCell.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import UIKit

class CourseCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "courseCell"
    
    private let courseImageView = UIImageView()
    
    private let extrasLabel = ColoredLabel()

    private let contentStackView = UIStackView()
    
    private let courseInfoView = CourseInfoView()
    private let authorView = AuthorView()
    
    let gradientView = GradientView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        contentView.pinToEdges(subview: courseImageView)
        courseImageView.layer.cornerRadius = 40
        courseImageView.contentMode = .scaleAspectFill
        courseImageView.layer.masksToBounds = true
        contentView.pinToEdges(subview: gradientView)
        gradientView.alpha = 0.8
        contentView.pinToEdges(subview: extrasLabel, leading: 18, trailing: nil, top: 22, bottom: nil)
        extrasLabel.textInsets = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
        extrasLabel.backgroundColor = .appYellow
        extrasLabel.layer.cornerRadius = 10
        extrasLabel.textColor = .white
        extrasLabel.font = UIFont(name: poppinsMedium, size: 10)
        contentView.pinToEdges(subview: contentStackView, leading: 18, trailing: 18, top: nil, bottom: 22)
        contentStackView.axis = .vertical
        contentStackView.spacing = 7
        contentStackView.alignment = .leading
        contentStackView.contentMode = .bottomLeft
        contentStackView.addArrangedSubview(courseInfoView)
        contentStackView.addArrangedSubview(authorView)
    }
    
    func update(with course: CourseViewModel) {
        courseImageView.image = course.image
        extrasLabel.text = course.extras
        courseInfoView.update(with: course)
        authorView.update(image: course.authorImage, name: course.authorName, position: course.authorPosition, isOnline: false)
    }
}

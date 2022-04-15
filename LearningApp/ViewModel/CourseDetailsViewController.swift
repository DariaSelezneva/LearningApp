//
//  CourseDetailsViewController.swift
//  LearningApp
//
//  Created by Дарья Селезнёва on 15.04.2022.
//

import UIKit

protocol CourseDetailsDisplayLogic {
    func display(_ courseDetails: CourseDetailsViewModel)
}

class CourseDetailsViewController: UIViewController {
    
    var videoURL: URL?
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(previewImageContainer)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(coloredLabelsView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(authorView)
        return stackView
    }()
    
    private let previewImageContainer: UIView = {
        let container = UIView()
        return container
        
    }()
    
    private let previewImageView: UIImageView = {
        let previewImageView = UIImageView()
        previewImageView.layer.cornerRadius = 24
        previewImageView.clipsToBounds = true
        previewImageView.contentMode = .scaleAspectFill
        return previewImageView
    }()
    
    private lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.setDimensions(width: 72, height: 72)
        let transparentView = UIView()
        playButton.pinToEdges(subview: transparentView)
        transparentView.layer.cornerRadius = 36
        transparentView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        transparentView.isUserInteractionEnabled = false
        let config = UIImage.SymbolConfiguration(pointSize: 54, weight: .regular, scale: .default)
        playButton.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: config), for: .normal)
        playButton.tintColor = .white
        playButton.addTarget(self, action: #selector(didPressPlay(_:)), for: .touchUpInside)
        return playButton
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: poppinsSemiBold, size: 24)
        titleLabel.textColor = .appDarkGray
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private let coloredLabelsView = ColoredLabelsView()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont(name: poppinsRegular, size: 14)
        descriptionLabel.textColor = .appGray
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    private let authorView = AuthorView()
    private let durationLabel = UILabel()
    private let extrasLabel = ColoredLabel()
    
    private let lessonsTableView = LessonsTableView()
    private var lessonsTableViewHeightConstraint = NSLayoutConstraint()
    
    private let followButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.pinToEdges(subview: scrollView)
        scrollView.setWidth(equalTo: view)
        scrollView.pinToEdges(subview: containerView)
        containerView.setWidth(equalTo: scrollView)
        containerView.pinToEdges(subview: stackView, leading: 20, trailing: 20, top: nil, bottom: nil)
        stackView.topAnchor.constraint(equalTo: containerView.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        containerView.pinToEdges(subview: lessonsTableView, leading: 20, trailing: 20, top: nil, bottom: 16)
        lessonsTableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16).isActive = true
        previewImageContainer.heightAnchor.constraint(equalToConstant: 230).isActive = true
        previewImageContainer.pinToEdges(subview: previewImageView)
        let gradientView = GradientView()
        previewImageContainer.pinToEdges(subview: gradientView)
        previewImageContainer.alignToCenter(subview: playButton)
        authorView.nameColor = .appDarkGray
        lessonsTableViewHeightConstraint = lessonsTableView.heightAnchor.constraint(equalToConstant: 0)
        lessonsTableViewHeightConstraint.isActive = true
        
        display(CourseDetailsViewModel.firstSample)
    }
    
    @objc func didPressPlay(_ sender: UIButton) {
        sender.animateScale(duration: 0.1, scale: 1.1)
        if let url = videoURL {
            // show player
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewImageContainer.dropShadow(color: .black, height: 3, shadowRadius: 10, opacity: 0.4, cornerRadius: 24)
    }
}

extension CourseDetailsViewController: CourseDetailsDisplayLogic {
    
    func display(_ courseDetails: CourseDetailsViewModel) {
        previewImageView.image = courseDetails.previewImage
        titleLabel.text = courseDetails.title
        coloredLabelsView.update(lessonsQuantity: courseDetails.numberOfLessons, theme: courseDetails.theme, cost: courseDetails.cost)
        descriptionLabel.text = "Some description\ntwo lines"
        authorView.update(image: courseDetails.authorImage, name: courseDetails.authorName, position: courseDetails.authorPosition, isOnline: courseDetails.isOnline)
        lessonsTableView.update(with: courseDetails.lessons + courseDetails.lessons)
        lessonsTableViewHeightConstraint.constant = CGFloat(100 * courseDetails.lessons.count * 2)
        videoURL = courseDetails.videoURL
    }
}

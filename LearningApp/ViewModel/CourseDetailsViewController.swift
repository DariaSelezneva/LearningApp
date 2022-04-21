//
//  CourseDetailsViewController.swift
//  LearningApp
//
//  Created by Дарья Селезнёва on 15.04.2022.
//

import UIKit

protocol CourseDetailsDisplayLogic: UIViewController {
    func display(_ courseDetails: CourseDetailsViewModel)
    func displayFavorite(isFavorite: Bool)
}

class CourseDetailsViewController: UIViewController {
    
    var interactor : CourseDetailsInteractionLogic?
    var router : CourseDetailsRouter?
    
    var videoURL: URL?
    var courseID: Int?
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    
    private let coursePreview = CoursePreview()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        stackView.addArrangedSubview(coursePreview)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(coloredLabelsView)
        stackView.setCustomSpacing(10, after: coloredLabelsView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(authorView)
        return stackView
    }()
    
    private let titleLabel = UILabel.make(fontName: poppinsSemiBold, size: 24, textColor: .appDarkGray)
    
    private let coloredLabelsView = ColoredLabelsView()
    
    private let descriptionLabel = UILabel.make(fontName: poppinsRegular, size: 14, textColor: .appGray)
    
    private let authorView = AuthorView()
    private let durationLabel = UILabel.make(fontName: poppinsMedium, size: 10, textColor: .appGray2)
    private let extrasLabel = ColoredLabel.makeForExtras()
    
    private let lessonsTableView = LessonsTableView()
    private var lessonsTableViewHeightConstraint = NSLayoutConstraint()
    
    private let followButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .white
        view.pinToEdges(subview: scrollView, top: nil, bottom: AppTabBar.height)
        scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16).isActive = true
        scrollView.setWidth(equalTo: view)
        scrollView.pinToEdges(subview: containerView)
        containerView.setWidth(equalTo: scrollView)
        containerView.pinToEdges(subview: stackView, leading: 20, trailing: 20, top: nil, bottom: nil)
        stackView.topAnchor.constraint(equalTo: containerView.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        containerView.pinToEdges(subview: lessonsTableView, leading: 20, trailing: 20, top: nil, bottom: 80)
        lessonsTableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16).isActive = true
        coursePreview.setWidth(equalTo: stackView)
        coursePreview.heightAnchor.constraint(equalToConstant: 230).isActive = true
        let durationExtrasStackView = UIStackView()
        containerView.addSubview(durationExtrasStackView)
        durationExtrasStackView.translatesAutoresizingMaskIntoConstraints = false
        durationExtrasStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        durationExtrasStackView.bottomAnchor.constraint(equalTo: authorView.bottomAnchor).isActive = true
        durationExtrasStackView.axis = .vertical
        durationExtrasStackView.alignment = .trailing
        durationExtrasStackView.spacing = 12
        durationExtrasStackView.addArrangedSubview(durationLabel)
        durationExtrasStackView.addArrangedSubview(extrasLabel)
        authorView.nameColor = .appDarkGray
        view.pinToEdges(subview: followButton, leading: 16, trailing: 16, top: nil, bottom: AppTabBar.height + 16)
        followButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        followButton.layer.cornerRadius = 8
        followButton.backgroundColor = .appRed
        followButton.titleLabel?.font = UIFont(name: poppinsMedium, size: 16)
        followButton.tintColor = .white
        followButton.setTitle("Follow class", for: .normal)
        followButton.addTarget(self, action: #selector(didPressFollow(_:)), for: .touchUpInside)
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .appRed
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: poppinsSemiBold, size: 18)!]
        navigationItem.title = "Course Details"
        self.navigationItem.setHidesBackButton(true, animated:false)
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        imageView.image = UIImage(named: "Back button")
        containerView.addSubview(imageView)
        let backTap = UITapGestureRecognizer(target: self, action: #selector(backToMain))
        containerView.addGestureRecognizer(backTap)
        let leftBarButtonItem = UIBarButtonItem(customView: containerView)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        coursePreview.dropShadow(color: .black, height: 3, shadowRadius: 10, opacity: 0.4, cornerRadius: 24)
    }
    
    @objc func backToMain() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didPressLike() {
        guard let courseID = courseID else { return }
        interactor?.setFavorite(courseID: courseID)
    }
    
    @objc func didPressFollow(_ sender: UIButton) {
        sender.animateScale(duration: 0.1, scale: 1.03)
        guard let courseID = courseID else { return }
        router?.showSchedule(courseID: courseID)
    }
}

extension CourseDetailsViewController: CourseDetailsDisplayLogic {
    
    func display(_ courseDetails: CourseDetailsViewModel) {
        coursePreview.image = courseDetails.previewImage
        titleLabel.text = courseDetails.title
        coloredLabelsView.update(lessonsQuantity: courseDetails.numberOfLessons, theme: courseDetails.theme, cost: courseDetails.cost)
        descriptionLabel.text = courseDetails.description
        authorView.update(image: courseDetails.authorImage, name: courseDetails.authorName, position: courseDetails.authorPosition, isOnline: courseDetails.isOnline)
        durationLabel.updateForCourseDuration(courseDetails.duration)
        extrasLabel.text = courseDetails.extras
        extrasLabel.alpha = courseDetails.extras == nil ? 0.0 : 1.0
        lessonsTableViewHeightConstraint = lessonsTableView.heightAnchor.constraint(equalToConstant: CGFloat(100 * courseDetails.lessons.count))
        lessonsTableViewHeightConstraint.isActive = true
        lessonsTableView.update(with: courseDetails.lessons)
        courseID = courseDetails.id
        videoURL = courseDetails.videoURL
    }
    
    func displayFavorite(isFavorite: Bool) {
        let heartImageName = isFavorite ? "heart.fill" : "heart"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: heartImageName), landscapeImagePhone: UIImage(systemName: heartImageName), style: .plain, target: self, action: #selector(didPressLike))
    }
}

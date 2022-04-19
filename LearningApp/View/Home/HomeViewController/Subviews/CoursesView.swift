//
//  CoursesView.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import UIKit

class CoursesView: UIView {
    
    private let stackView = UIStackView()
    private let label = UILabel.make(fontName: poppinsRegular, size: 18, textColor: .appDarkGray)
    let filterView = CoursesFilterView()
    let coursesCollectionView = CoursesCollectionView()
    private let paginationView = PaginationIndicatorView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.pinToEdges(subview: stackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(filterView)
        stackView.addArrangedSubview(coursesCollectionView)
        stackView.addArrangedSubview(paginationView)
        filterView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        coursesCollectionView.heightAnchor.constraint(equalToConstant: 386).isActive = true
        paginationView.heightAnchor.constraint(equalToConstant: 22).isActive = true
        label.text = "Upcoming course of this week"
        coursesCollectionView.onHighlight = { [unowned self] index in
            paginationView.indexSelected = index
        }
    }
    
    func update(courses: [CourseViewModel]) {
        coursesCollectionView.update(with: courses)
        paginationView.totalCount = courses.count
    }
}

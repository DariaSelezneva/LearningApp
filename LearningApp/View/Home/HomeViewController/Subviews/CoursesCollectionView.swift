//
//  CoursesCollectionView.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import UIKit

class CoursesCollectionView: UIView {
    
    private var dataSource: [CourseViewModel] = []
    private var highlightedCourseIndex: Int = 0 {
        didSet {
            collectionView.performBatchUpdates {
                let indexPaths = collectionView.indexPathsForVisibleItems
                collectionView.reloadItems(at: indexPaths)
            }
            onHighlight?(highlightedCourseIndex)
        }
    }
    
    var onHighlight: ((Int) -> Void)?
    var onSelection: ((Int) -> Void)?
    
    lazy var collectionView: UICollectionView = {
        return UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
    }()
    
    let collectionViewLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup() {
        self.pinToEdges(subview: collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.indicatorStyle = .white
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
        collectionView.register(CourseCollectionViewCell.self, forCellWithReuseIdentifier: CourseCollectionViewCell.reuseIdentifier)
    }
    
    func update(with courses: [CourseViewModel]) {
        self.dataSource = courses
        collectionView.reloadData()
    }
}

extension CoursesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCollectionViewCell.reuseIdentifier, for: indexPath) as! CourseCollectionViewCell
        let course = dataSource[indexPath.row]
        let isHighlighted = indexPath.row == highlightedCourseIndex
        cell.update(with: course)
        cell.layer.masksToBounds = false
        if isHighlighted {
            cell.transform = CGAffineTransform.identity
            cell.contentView.alpha = 1
            cell.dropShadow(color: .black, height: 3, shadowRadius: 7, opacity: 0.1, cornerRadius: 24)
        }
        else {
            let scaleTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            let translationTransform = CGAffineTransform(translationX: 0, y: -18)
            cell.transform = scaleTransform.concatenating(translationTransform)
            cell.contentView.alpha = 0.6
            cell.layer.shadowColor = UIColor.clear.cgColor
        }
        return cell
    }
}

extension CoursesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension CoursesCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelection?(indexPath.row)
    }
}

extension CoursesCollectionView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
            if highlightedCourseIndex != visibleIndexPath.row {
                highlightedCourseIndex = visibleIndexPath.row
            }
        }
    }
}

//
//  CoursesFilterView.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import UIKit

class CoursesFilterView: UIView {
    
    private var dataSource: [String] = ["All", "UI/UX", "Illustration", "3D Animation"]
    private var selectedFilter: Int = 0 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        return UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
    }()
    
    let collectionViewLayout = UICollectionViewFlowLayout()
    
    var onSelection: ((Int) -> Void)?
    
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
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.reuseIdentifier)
    }
    
    func update(with filters: [String]) {
        self.dataSource = filters
        collectionView.reloadData()
    }
}

extension CoursesFilterView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuseIdentifier, for: indexPath) as! FilterCollectionViewCell
        let filter = dataSource[indexPath.row]
        let isSelected = indexPath.row == selectedFilter
        cell.update(text: filter, isSelected: isSelected)
        if isSelected {
            cell.dropShadow(color: .appRed!, height: 2, shadowRadius: 5, opacity: 0.2, cornerRadius: 8)
        }
        else {
            cell.layer.shadowColor = UIColor.clear.cgColor
        }
        return cell
    }
}

extension CoursesFilterView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let string = dataSource[indexPath.row]
        let width = string.width(withConstrainedHeight: 14, font: UIFont(name: poppinsMedium, size: 14)!) + 30
        return CGSize(width: width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

extension CoursesFilterView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedFilter = indexPath.row
        onSelection?(indexPath.row)
    }
}

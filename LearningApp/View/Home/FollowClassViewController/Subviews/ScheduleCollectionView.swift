//
//  ScheduleCollectionView.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import UIKit

class ScheduleCollectionView: UIView {

    private var dataSource: [ScheduleViewModel] = ScheduleViewModel.sample
    
    private var selectedIndex: Int?
    
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
        collectionView.isScrollEnabled = false
        collectionView.register(ScheduleCollectionViewCell.self, forCellWithReuseIdentifier: ScheduleCollectionViewCell.reuseIdentifier)
        collectionView.layer.masksToBounds = false
    }
    
    func update(with source: [ScheduleViewModel]) {
        self.dataSource = source
        collectionView.reloadData()
    }
}

extension ScheduleCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleCollectionViewCell.reuseIdentifier, for: indexPath) as! ScheduleCollectionViewCell
        let source = dataSource[indexPath.row]
        let isSelected = selectedIndex == indexPath.row
        cell.update(with: source.time, isAvailable: source.isAvailable, isSelected: isSelected)
        cell.layer.masksToBounds = false
        cell.dropShadow(color: .appRed!, height: 3, shadowRadius: 7, opacity: 0.1, cornerRadius: 8)
        return cell
    }
}

extension ScheduleCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 55, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}

extension ScheduleCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return dataSource[indexPath.row].isAvailable
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedIndex = selectedIndex, selectedIndex == indexPath.row {
            self.selectedIndex = nil
        }
        else {
            selectedIndex = indexPath.row
        }
        collectionView.reloadData()
        onSelection?(indexPath.row)
    }
}

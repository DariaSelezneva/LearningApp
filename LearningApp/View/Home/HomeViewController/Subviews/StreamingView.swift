//
//  StreamingView.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import UIKit

class StreamingView: UIView {
    
    private var dataSource: [StreamerViewModel] = []
    
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
        collectionView.indicatorStyle = .white
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
        collectionView.register(StreamingCollectionViewCell.self, forCellWithReuseIdentifier: StreamingCollectionViewCell.reuseIdentifier)
    }
    
    func update(with streamers: [StreamerViewModel]) {
        dataSource = streamers
        collectionView.reloadData()
    }
}

extension StreamingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StreamingCollectionViewCell.reuseIdentifier, for: indexPath) as! StreamingCollectionViewCell
        let streamer = dataSource[indexPath.row]
        cell.update(image: streamer.image, isStreaming: streamer.isStreaming)
        cell.dropShadow(color: .appRed!, height: 2, shadowRadius: 3, opacity: 0.2, cornerRadius: 24)
        return cell
    }
}

extension StreamingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

extension StreamingView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! StreamingCollectionViewCell
        cell.animateScale(duration: 0.1, scale: 1.1)
        onSelection?(indexPath.row)
    }
}

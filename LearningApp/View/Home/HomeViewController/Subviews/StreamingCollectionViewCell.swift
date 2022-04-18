//
//  StreamingCollectionViewCell.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import UIKit

class StreamingCollectionViewCell: UICollectionViewCell {

    let borderView = UIView()
    let avatarImageView = UIImageView()
    let cameraView = UIView()
    let cameraImageView = UIImageView()
    
    static let reuseIdentifier = "storiesCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup() {
        contentView.pinToEdges(subview: borderView, leading: 3, trailing: 3, top: 3, bottom: 3)
        borderView.layer.cornerRadius = 24
        borderView.layer.borderWidth = 4
        borderView.backgroundColor = .white
        borderView.pinToEdges(subview: avatarImageView, leading: 7, trailing: 7, top: 7, bottom: 7)
        avatarImageView.layer.cornerRadius = 18
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        contentView.pinToEdges(subview: cameraView, leading: nil, trailing: 0, top: nil, bottom: 0)
        cameraView.setDimensions(width: 24, height: 24)
        cameraView.layer.cornerRadius = 12
        cameraView.layer.borderWidth = 2
        cameraView.layer.borderColor = UIColor.white.cgColor
        cameraView.backgroundColor = UIColor.appMint
        cameraView.pinToEdges(subview: cameraImageView, leading: 5, trailing: 5, top: 5, bottom: 5)
        cameraImageView.image = UIImage(systemName: "video.fill")
        cameraImageView.tintColor = .white
    }
    
    func update(image: UIImage, isStreaming: Bool) {
        borderView.layer.borderColor = isStreaming ? UIColor.appRed!.cgColor : UIColor.clear.cgColor
        cameraView.isHidden = isStreaming ? false : true
        avatarImageView.image = image
    }
}

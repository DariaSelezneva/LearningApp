//
//  LessonPlayView.swift
//  LearningApp
//
//  Created by Дарья Селезнёва on 15.04.2022.
//

import UIKit

class LessonPlayView: UIView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setDimensions(width: 15, height: 22)
        imageView.image = UIImage(systemName: "play.fill")
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.alignToCenter(subview: imageView)
    }
    
    func update(isRed: Bool) {
        self.backgroundColor = isRed ? .appRed : .white
        imageView.tintColor =  isRed ? .white : .appRed
    }
}

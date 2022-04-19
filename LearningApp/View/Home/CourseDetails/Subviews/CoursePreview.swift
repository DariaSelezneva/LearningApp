//
//  CoursePreview.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import UIKit

class CoursePreview: UIView {
    
    var image: UIImage? {
        didSet {
            previewImageView.image = image
        }
    }
    
    var onPressPlay: (() -> ())?
    
    private let previewImageContainer = UIView()
    
    private let previewImageView: UIImageView = {
        let previewImageView = UIImageView()
        previewImageView.layer.cornerRadius = 24
        previewImageView.clipsToBounds = true
        previewImageView.contentMode = .scaleAspectFill
        return previewImageView
    }()
    
    private let playButton: CoursePlayButton = {
        let playButton = CoursePlayButton()
        playButton.addTarget(nil, action: #selector(didPressPlay(_:)), for: .touchUpInside)
        return playButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup() {
        self.pinToEdges(subview: previewImageView)
        let gradientView = GradientView(colors: [UIColor.clear, UIColor.clear, UIColor.black])
        self.pinToEdges(subview: gradientView)
        self.alignToCenter(subview: playButton)
    }
    
    @objc func didPressPlay(_ sender: UIButton) {
        sender.animateScale(duration: 0.1, scale: 1.1)
        onPressPlay?()
    }
}

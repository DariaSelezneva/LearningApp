//
//  AppTabBar.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import UIKit

class AppTabBar: UIView {
    
    var didSelectItem: ((Int) -> Void)?
    
    var selectedItem: Int = 0 {
        didSet {
            items[selectedItem].isActive = true
        }
    }
    
    static let height : CGFloat = 74

    private let stackView = UIStackView()
    
    let homeItem = AppTabItem(selectedImageName: "Menu_fill", deselectedImageName: "Menu")
    let exploreItem = AppTabItem(selectedImageName: "Discovery", deselectedImageName: "Discovery")
    let messagesItem = AppTabItem(selectedImageName: "Message_fill", deselectedImageName: "Message")
    let profileItem = AppTabItem(selectedImageName: "Profile", deselectedImageName: "Profile")
    
    var items : [AppTabItem] { [homeItem, exploreItem, messagesItem, profileItem] }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.backgroundColor = .white
        self.pinToEdges(subview: stackView)
        stackView.spacing = 0
        let width = UIScreen.main.bounds.width / 4
        for (index, item) in items.enumerated() {
            stackView.addArrangedSubview(item)
            item.setDimensions(width: width, height: AppTabBar.height)
            item.tag = index
            item.addTarget(nil, action: #selector(tapped(_:)), for: .touchUpInside)
            item.isActive = selectedItem == item.tag
        }
    }
    
    @objc func tapped(_ sender: AppTabItem) {
        for (index, item) in items.enumerated() {
            item.isActive = index == sender.tag
        }
        didSelectItem?(sender.tag)
    }
}

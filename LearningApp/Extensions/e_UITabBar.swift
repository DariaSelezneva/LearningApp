//
//  e_UITabBar.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import UIKit

//extension UITabBarItem {
//    
//    func setBadge(value: String?) {
////        let existingBadge = subviews.first { ($0 as? TabBarBadge)?.hasIdentifier(for: index) == true }
////        existingBadge?.removeFromSuperview()
//        
//        guard let value = value else { return }
//        
//        let itemWidth = self.frame.width
//        let itemHeight = self.frame.height
//        
//        let badge = TabBarBadge(for: 2)
//        badge.frame.size = .init(width: 16, height: 166)
//        badge.center = CGPoint(x: (itemWidth * itemPosition) - (0.5 * itemWidth) + 12,
//                               y: (0.5 * itemHeight) - 9)
//        badge.layer.cornerRadius = 8
//        badge.clipsToBounds = true
//        badge.textAlignment = .center
//        badge.backgroundColor = .appRed
//        badge.font = UIFont(name: poppinsMedium, size: 10)
//        badge.textColor = .white
//        badge.text = value
//        
//        addSubview(badge)
//    }
//}
//
//class TabBarBadge: UILabel {
//    var identifier: String = String(describing: TabBarBadge.self)
//    
//    private func identifier(for index: Int) -> String {
//        return "\(String(describing: TabBarBadge.self))-\(index)"
//    }
//    
//    convenience init(for index: Int) {
//        self.init()
//        identifier = identifier(for: index)
//    }
//    
//    func hasIdentifier(for index: Int) -> Bool {
//        let has = identifier == identifier(for: index)
//        return has
//    }
//}

//class TabBarBadgeConfiguration {
//
//    var backgroundColor: UIColor = .appRed!
//    var centerOffset: CGPoint = .init(x: 12, y: -9)
//    var size: CGSize = .init(width: 15, height: 15)
//    var textColor: UIColor = .white
//    var font: UIFont = UIFont(name: poppinsMedium, size: 10)!
//
//    static func construct(_ block: (TabBarBadgeConfiguration) -> Void) -> TabBarBadgeConfiguration {
//        let new = TabBarBadgeConfiguration()
//        block(new)
//        return new
//    }
//}

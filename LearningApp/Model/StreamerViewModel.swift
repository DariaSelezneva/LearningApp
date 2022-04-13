//
//  StreamingViewModel.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import UIKit

struct StreamerViewModel {
    var id: Int
    var image: UIImage
    var isStreaming: Bool
    
    static let sample = [
        StreamerViewModel(
            id: 0,
            image: UIImage(named: "eccleston")!,
            isStreaming: true),
        StreamerViewModel(
            id: 1,
            image: UIImage(named: "tennant")!,
            isStreaming: true),
        StreamerViewModel(
            id: 2,
            image: UIImage(named: "smith")!,
            isStreaming: true),
        StreamerViewModel(
            id: 3,
            image: UIImage(named: "capaldi")!,
            isStreaming: true)]
}

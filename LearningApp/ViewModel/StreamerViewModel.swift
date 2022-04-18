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
}


extension StreamerViewModel {
    init(from streamer: Streamer) {
        self.id = streamer.person.id
        self.image = streamer.person.image ?? UIImage(systemName: "person")!
        self.isStreaming = streamer.isStreaming
    }
}

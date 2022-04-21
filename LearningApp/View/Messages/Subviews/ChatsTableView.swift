//
//  ChatsTableView.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import UIKit

class ChatsTableView: UIView {

    private var dataSource: [ChatViewModel] = []
    
    private let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.pinToEdges(subview: tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = true
        tableView.separatorInset.left = 72
        tableView.separatorInset.right = 16
        tableView.separatorColor = .appLightGray
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.reuseIdentifier)
    }
    
    func update(with chats: [ChatViewModel]) {
        dataSource = chats
        tableView.reloadData()
    }
}

extension ChatsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.reuseIdentifier, for: indexPath) as! ChatTableViewCell
        let chat = dataSource[indexPath.row]
        cell.update(with: chat)
        return cell
    }
}

extension ChatsTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

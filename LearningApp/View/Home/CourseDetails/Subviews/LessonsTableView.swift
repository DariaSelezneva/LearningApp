//
//  LessonsTableView.swift
//  LearningApp
//
//  Created by Дарья Селезнёва on 15.04.2022.
//

import UIKit

class LessonsTableView: UIView {
    
    private var dataSource: [LessonViewModel] = LessonViewModel.sample
    
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
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.register(LessonTableViewCell.self, forCellReuseIdentifier: LessonTableViewCell.reuseIdentifier)
    }
    
    func update(with lessons: [LessonViewModel]) {
        dataSource = lessons
        tableView.reloadData()
    }
}

extension LessonsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LessonTableViewCell.reuseIdentifier, for: indexPath) as! LessonTableViewCell
        let lesson = dataSource[indexPath.row]
        cell.update(with: lesson, isRed: indexPath.row == 0)
        return cell
    }
    
}

extension LessonsTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

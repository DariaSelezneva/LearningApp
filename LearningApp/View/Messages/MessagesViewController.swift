//
//  MessagesViewController.swift
//  LearningApp
//
//  Created by Daria on 12.04.2022.
//

import UIKit

protocol MessagesDisplayLogic: UIViewController {
    func displayUser(_ user: UserViewModel)
    func displayChats(_ chats: [ChatViewModel])
}

class MessagesViewController: UIViewController {
    
    var interactor : MessagesInteractionLogic?
    var router : MessagesRouter?
    
    private let stackView = UIStackView()
    
    private let userView = UserView()
    private let searchBar = SearchBar()
    
    private let chatsTableView = ChatsTableView()
    
    private var chatsHeightConstraint = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        view.backgroundColor = .white
        view.pinToEdges(subview: stackView, leading: 20, trailing: 20, top: nil, bottom: nil)
        stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(userView)
        stackView.addArrangedSubview(searchBar)
        searchBar.heightAnchor.constraint(equalToConstant: 56).isActive = true
        searchBar.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        searchBar.textChanged = { [unowned self] string in
            if let string = string, !string.isEmpty {
                interactor?.filterMessages(string)
            }
            else {
                interactor?.getMessages()
            }
        }
        view.pinToEdges(subview: chatsTableView, top: nil, bottom: AppTabBar.height + 16)
        chatsTableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16).isActive = true
        interactor?.getUser()
        interactor?.getMessages()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchBar.dropButtonShadow()
    }
}

extension MessagesViewController: MessagesDisplayLogic {
    
    func displayUser(_ user: UserViewModel) {
        userView.updateForMessages(with: user)
    }
    
    func displayChats(_ chats: [ChatViewModel]) {
        chatsTableView.update(with: chats)
    }
}

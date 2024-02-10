//
//  RMCharactersViewController.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 22.01.2024.
//

import UIKit

/// Controller to search and show for Characters
final class RMCharactersViewController: UIViewController, RMCharacterListViewDelegate {
    
    //MARK: - Properties
    
    private let charactetListView = RMCharacterListView()
    
    //MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        setupView()
        
    }
    //MARK: - Helpers
    private func setupView() {
        view.addSubview(charactetListView)
        charactetListView.delegate = self
        NSLayoutConstraint.activate([
            charactetListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            charactetListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            charactetListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            charactetListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    //MARK: - RMCharacterListViewDelegate
    func rmCharacterListView(_ rmCharacterListView: RMCharacterListView, character: RMCharacter) {
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVc = RMCharacterDetailViewController(viewModel: viewModel)
        detailVc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVc, animated: true)
    }
}

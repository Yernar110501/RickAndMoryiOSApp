//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 28.01.2024.
//

import UIKit

/// Controller to show info about the character
final class RMCharacterDetailViewController: UIViewController {
    //MARK: - Properties
    private let viewModel: RMCharacterDetailViewViewModel
    //MARK: - Initializer
    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        
    }

}

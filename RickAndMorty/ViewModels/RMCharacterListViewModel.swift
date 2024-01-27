//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 25.01.2024.
//

import UIKit

final class RMCharacterListViewModel: NSObject {
    
   // private var viewModel = [RMCharacterCollectionViewCellViewModel]()
    
    func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: \(model.info.count)")
                print("Total: \(model.results.count)")
                print("Image example: \(model.results.first?.image ?? "image is nil for first")")
                //self.viewModel = model
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
extension RMCharacterListViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell type")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Name",
                                                               characterStatus: .alive,
                                                               chracterImage:  URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return .init(width: width, height: width * 1.5)
    }
    
}

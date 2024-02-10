//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 27.01.2024.
//

import UIKit

final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable {

    
    //MARK: - Properties
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    //MARK: - Initializer
    init(characterName: String, characterStatus: RMCharacterStatus, chracterImage: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = chracterImage
    }
    //MARK: - Helpers
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> () ) {
        //TODO: abstrato to image manager
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        RMImageLoader.shared.downloadImage(url, completion: completion)
    }
    
    //MARK: - Hashable
    static func == (lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }
}

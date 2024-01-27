//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 27.01.2024.
//

import UIKit

final class RMCharacterCollectionViewCellViewModel {
    //MARK: - Properties
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    public var characterStatusText: String {
        return characterStatus.rawValue
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
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}

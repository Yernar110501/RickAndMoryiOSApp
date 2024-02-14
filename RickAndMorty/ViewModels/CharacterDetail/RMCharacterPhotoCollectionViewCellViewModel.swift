//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 12.02.2024.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel {
    //MARK: - Properties
    private let imageUrl:URL?
    
    //MARK: - Initializers
    init(imageUrl: URL?){
        self.imageUrl = imageUrl
    }
    
    //MARK: - Helpers
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> () ) {
        guard let imageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(imageUrl, completion: completion)
    }
}

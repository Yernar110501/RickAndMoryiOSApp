//
//  RMCharacterEpisodesCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 12.02.2024.
//

import Foundation

final class RMCharacterEpisodesCollectionViewCellViewModel {
    //MARK: - Properties
    private let episodeDataUrl: URL?
    
    //MARK: - Initializers
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
}

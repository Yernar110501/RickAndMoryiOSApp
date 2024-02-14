//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 12.02.2024.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    //MARK: - Properties
    public let value: String
    public let title: String
    
    //MARK: - Initializers
    init(value: String, title: String){
        self.value = value
        self.title = title
    }
}

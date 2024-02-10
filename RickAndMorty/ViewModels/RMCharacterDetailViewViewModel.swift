//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 28.01.2024.
//

import UIKit

final class RMCharacterDetailViewViewModel {
    //MARK: - Properties
    private var character: RMCharacter
    
    public var title: String {
        character.name.uppercased()
    }
    //MARK: - Initializers 
    init(character: RMCharacter) {
        self.character = character
    }
    
}

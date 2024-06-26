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
    
    enum SectionType {
        case photo(viewModel: RMCharacterPhotoCollectionViewCellViewModel)
        case info(viewModel: [RMCharacterInfoCollectionViewCellViewModel])
        case episodes(viewModel: [RMCharacterEpisodesCollectionViewCellViewModel])
    }
    
    public var sections: [SectionType] = []
    
    public var title: String {
        character.name.uppercased()
    }
    
    private var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    //MARK: - Initializers
    init(character: RMCharacter) {
        self.character = character
        setupSections()
    }
    
    //MARK: - Helpers
    
    /*
     let id: Int
     let name: String
     let status: RMCharacterStatus
     let species: String
     let type: String
     let gender: RMCharacterGender
     let origin: RMOrigin
     let location: RMSingleLocation
     let image: String
     let episode: [String]
     let url: String
     let created: String
     */
    private func setupSections() {
        sections = [
            .photo(viewModel:  .init(imageUrl: URL(string: character.image)) ),
            .info(viewModel: [
                .init(type: .status, value: character.status.text),
                .init(type: .gender, value: character.gender.rawValue),
                .init(type: .type, value: character.type),
                .init(type: .species, value: character.species),
                .init(type: .origin, value: character.origin.name),
                .init(type: .location, value: character.location.name),
                .init(type: .created, value: character.created),
                .init(type: .episodeCount, value: "\(character.episode.count)")

            ]),
            .episodes(viewModel: character.episode.compactMap({
                RMCharacterEpisodesCollectionViewCellViewModel(episodeDataUrl: URL(string: $0))
//                .init(episodeDataUrl: URL(string: $0))
            }))
        ]
    }
    
    //MARK: - Layouts
    
    public func createPhotoSectionLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 0,
                                                     bottom: 10,
                                                     trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    public func createInfoSectionLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                               heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2 ,
                                                     leading: 2,
                                                     bottom: 2,
                                                     trailing: 2)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(150)),
            subitems: [item, item])
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    public func createEpisodeSectionLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                     leading: 5,
                                                     bottom: 10,
                                                     trailing: 8)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.8),
                heightDimension: .absolute(150)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
}

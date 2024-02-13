//
//  RMCharacterPhotoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 12.02.2024.
//

import UIKit

final class RMCharacterPhotoCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "RMCharacterPhotoCollectionViewCell"
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func prepareForReuse() {
         super.prepareForReuse()
    }
    
    //MARK: - Helpers
    private func setUpConstraints() {
        
    }
    
    public func configure(with viewModel: RMCharacterPhotoCollectionViewCellViewModel) {
        
    }
    
}

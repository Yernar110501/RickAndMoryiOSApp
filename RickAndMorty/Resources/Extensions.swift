//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 25.01.2024.
//

import UIKit

extension UIView {
    func addSubviews( _ views: UIView... ){
        views.forEach({addSubview($0)})
    }
}

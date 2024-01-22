//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 22.01.2024.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndpoint: String {
    ///Endpoint ot get character info
    case location
    ///Endpoint ot get locations info
    case character
    ///Endpoint ot get episode info
    case episode
}

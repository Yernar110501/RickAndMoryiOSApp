//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 23.01.2024.
//

import Foundation

/// Represents character live status
enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

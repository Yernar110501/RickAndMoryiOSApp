//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 23.01.2024.
//

import Foundation


/// Represents characters gender
enum RMCharacterGender: String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderlless"
    case unknown = "unknown"
}

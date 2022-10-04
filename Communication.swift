//
//  Communication.swift
//  LangApp
//
//  Created by Matthew Owen on 8/13/22.
//

import Foundation

struct Communication: Codable {
    struct Language: Codable {
        let languages: [LanguageKeys]
    }
    
    struct LanguageKeys: Codable {
        let name, creator: String
        let firstAppeared: Int
        let typing: [String]
    }
}

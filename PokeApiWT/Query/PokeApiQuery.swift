//
//  PokeApiQuery.swift
//  PokeApiWT
//
//  Created by Wilson Jair Tique Aguja on 27/06/23.
//

import Foundation
import SwiftUI
struct PokemonList: Decodable {
    
    let results: [Pokemon]
}

struct Pokemon: Decodable,Identifiable {
    
    let name: String
    let url: String
    
    var id: Int? {
        return Int(url.split(separator: "/").last?.description ?? "0")
    }
    
    var imageUrl: URL? {
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id ?? 0).png")
    }
}

struct DetailPokemon: Codable, Identifiable {
    let id: Int
    let height: Int
    let weight: Int
}

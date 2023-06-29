//
//  ViewModel.swift
//  PokeApiWT
//
//  Created by Wilson Jair Tique Aguja on 29/06/23.
//

import Foundation
import SwiftUI


class ViewModel: ObservableObject {
    private let pokemonManager = PokemonApi()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
   
    
    // Get specific details for a pokemon
    func getDetails(pokemon: Pokemon) {
        
        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0)
        
        pokemonManager.getPokemonDetails(pokemon: pokemon) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
    
    // Formats the Height or the Weight of a given pokemon
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
}

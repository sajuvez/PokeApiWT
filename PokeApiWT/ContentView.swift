//
//  ContentView.swift
//  PokeApiWT
//
//  Created by Wilson Jair Tique Aguja on 27/06/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @State var pokemonList=[Pokemon]()
    @State var searchText = ""
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchText == "" ? pokemonList:pokemonList.filter({
                    $0.name.contains(searchText.lowercased())
                })){ pokemon in
                    NavigationLink(destination: ListPokemonDetail(pokemon: pokemon)){
                            PokemonRV(pokemon: pokemon)
                    }
                }
            }
            .onAppear() {
                PokemonApi().loadPokemon { result in
                    switch result {
                    case .success(let pokemonList):
                        self.pokemonList = pokemonList
                    case .failure(let error):
                        print(error)
                    }
                }
            }.navigationTitle("Pokémon list")
                .searchable(text: $searchText)
        }
        .environmentObject(vm)

    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

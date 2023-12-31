//
//  PokemonRV.swift
//  PokeApiWT
//
//  Created by Wilson Jair Tique Aguja on 27/06/23.
//

import SwiftUI

struct PokemonRV: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        
        HStack {
            
            AsyncImage(url: pokemon.imageUrl) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "number")
                    .resizable()
                    .padding()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 60)
            .background(Color.gray.opacity(0.1))
            .clipShape(Circle())
                
            Text("#\(pokemon.id?.description ?? "")")
                .font(.title2)
                .fontWeight(.light)
            
            Text(pokemon.name.capitalized)
                .font(.title)
                .fontWeight(.medium)
            
            Spacer()
        }
    }
}

struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRV(pokemon: Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
    }
}

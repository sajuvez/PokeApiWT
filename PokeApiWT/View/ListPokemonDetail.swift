//
//  ListPokemonDetail.swift
//  PokeApiWT
//
//  Created by Wilson Jair Tique Aguja on 27/06/23.
//

import SwiftUI

struct ListPokemonDetail: View {
    @EnvironmentObject var vm:ViewModel
    var pokemon: Pokemon
    var body: some View {
        VStack{
            AsyncImage(url: pokemon.imageUrl) { image in
                image.resizable(resizingMode: .stretch)
            } placeholder: {
                Image(systemName: "number")
                    .resizable()
                    .padding()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .background(Color.gray.opacity(0.1))
            .clipShape(Circle())
            HStack{
                Text(pokemon.name.capitalized).font(.largeTitle)
            }
            VStack(spacing: 10){
                Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) KG")
                Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) M")
            }
            Spacer()
                .onAppear{
                    vm.getDetails(pokemon: pokemon)
                }
        }
        
    }
}

struct ListPokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        ListPokemonDetail(pokemon: Pokemon(name: "char", url: "urllll")).environmentObject(ViewModel())
    }
}

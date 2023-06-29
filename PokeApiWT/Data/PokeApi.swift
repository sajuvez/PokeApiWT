//
//  PokeApi.swift
//  PokeApiWT
//
//  Created by Wilson Jair Tique Aguja on 27/06/23.
//

import Foundation
import Alamofire

final class PokemonApi {
    
    func loadPokemon(completion: @escaping (Result<[Pokemon], Error>) -> ())  {
        
        AF.request("https://pokeapi.co/api/v2/pokemon?limit=151").responseDecodable(of: PokemonList.self) { response in
            
            switch response.result {
            case .success(let pokemonList):
                completion(.success(pokemonList.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getPokemonDetails(pokemon:Pokemon,_ completion: @escaping (DetailPokemon) -> ()){
        AF.request(pokemon.url).responseDecodable(of: DetailPokemon.self){pokemonDetails in
            //print(pokemonDetails)
            switch pokemonDetails.result {
            case .success(let pokemonList):
                //print(pokemonList.height)
                completion(pokemonList)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

//
//  PokemonManagers.swift
//  pokedex
//
//  Created by Alexander Parreira on 07/08/23.
//

import Foundation

class PokemonManagers{
    func getPokemon() -> [Pokemon]{
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] =  data.results
        
        return pokemon
    }
    
    func getDetailedPokemon(id: Int, _ completion:@escaping (DetailPokemon) -> ()){
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPokemon.self){
            data in
            completion(data)
        }failure: { error in
            print(error)
        }
    }
}

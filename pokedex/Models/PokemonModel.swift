//
//  PokemonModel.swift
//  pokedex
//
//  Created by Alexander Parreira on 06/08/23.
//

import Foundation


struct PokemonPage: Codable{
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable{
    let id = UUID()
    let name: String
    let url: String

    
    static var samplePokemon = Pokemon(name: "bulbasaur", url:
                                        "https://pokeapi.co/api/v2/pokemon/1/")
    
}
struct Stats: Codable{
    let base_stat: Int
    let stat: StatDetail
}

struct StatDetail: Codable{
    let name: String
}

struct Types: Codable{
    let slot: Int
    let type: TypeName
}

struct TypeName: Codable{
    let name: String
    
}

struct DetailPokemon: Codable{
    let id: Int
    let height: Int
    let weight: Int
    let stats: [Stats]
    let types: [Types]
}

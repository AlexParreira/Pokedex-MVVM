//
//  ViewModel.swift
//  pokedex
//
//  Created by Alexander Parreira on 07/08/23.
//

import Foundation
import SwiftUI


final class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManagers()
    

    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
    var filterdPokemon: [Pokemon]{
        return searchText == "" ? pokemonList : pokemonList.filter{
            $0.name.contains(searchText.lowercased())
        }
    }
    init(){
        self.pokemonList = pokemonManager.getPokemon()
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int{
        if let index = self.pokemonList.firstIndex(of: pokemon){
            return index + 1
        }
        return 0
    }
    func getDetails(pokemon: Pokemon){
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0, stats: [], types: [])
        
        pokemonManager.getDetailedPokemon(id: id){ data in
            
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
    func formatHW(value: Int) -> String{
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
    func statValue(for statName: String) -> Int {
        if let stats = pokemonDetails?.stats,
           let stat = stats.first(where: { $0.stat.name == statName }) {
            return stat.base_stat
        }
        return 0
    }
    func getTypeNames() -> [String] {
        guard let types = pokemonDetails?.types else {
            return []
        }
        
        return types.map { $0.type.name }
    }
}

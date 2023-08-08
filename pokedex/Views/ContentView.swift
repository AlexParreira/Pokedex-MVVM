//
//  ContentView.swift
//  pokedex
//
//  Created by Alexander Parreira on 06/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    private let adaptiveCollumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        
        NavigationView{
            ScrollView{
                LazyVGrid(columns: adaptiveCollumns,spacing: 2){
                    ForEach(vm.filterdPokemon){ pokemon in
                        NavigationLink(destination:PokemonDetailView(pokemon: pokemon)){
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeIn(duration: 0.3),value: vm.filterdPokemon.count)
                .navigationTitle("PokemonUI")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
            
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

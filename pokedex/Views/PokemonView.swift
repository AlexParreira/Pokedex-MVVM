//
//  PokemonView.swift
//  pokedex
//
//  Created by Alexander Parreira on 07/08/23.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(vm.getPokemonIndex(pokemon: pokemon)).png")) {image in
                if  image != nil {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                }
                } placeholder: {
                    ProgressView()
                        .frame(width: dimensions, height: dimensions)
                    
                }
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 5)
            
            }
        }
    }

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon:Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}

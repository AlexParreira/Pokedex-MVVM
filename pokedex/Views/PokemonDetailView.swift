//
//  PokemonDetailView.swift
//  pokedex
//
//  Created by Alexander Parreira on 07/08/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        
        VStack{
            PokemonView(pokemon: pokemon)
            Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
            VStack{
                
                if let pokemon = vm.pokemonDetails{
                    if !pokemon.types.isEmpty {
                        HStack{
                            Text("**Types**: ")
                            VStack {
                                ForEach(vm.getTypeNames(), id: \.self){ typeName in
                                    Text(typeName)
                                        .font(Font.custom("", size: 8))
                                    
                                }
                            }
                        }
                    }
                }else{
                    Text("Pokémon data not found")
                }

               
                StatProgressBar(title: "HP",value: vm.statValue(for: "hp"),
                                color: .red,
                                range: 150)
                    
                StatProgressBar(title: "Attack",value: vm.statValue(for: "attack"),
                                color: .blue,
                                range: 150)
                    
                StatProgressBar(title: "Defense",value: vm.statValue(for: "defense"),
                                color: .green,
                                range: 150)
                    
                StatProgressBar(title: "Speed",value: vm.statValue(for: "speed"),
                                color: .purple,
                                range: 150)
                
                StatProgressBar(title: "Weight",
                                    value: vm.pokemonDetails?.weight,
                                color: .orange,
                                range: 500)
                
                StatProgressBar(title: "Height",
                                value: vm.pokemonDetails?.height,
                                color: .brown,
                                range: 20)
               
            }
            
        }
        .onAppear(){
            vm.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon:Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
struct StatProgressBar: View {
    var title: String
    var value: Int?
    var color: Color
    var range: Double

    
    var body: some View {
        HStack {
            
            ZStack {
                ProgressView(
                    value: Double(value ?? 0),
                    total: range
                ){
                    Text("**\(title)**: ")
                }
                .progressViewStyle(ThickProgressBarStyle(thickness: 30.0))
                .accentColor(color)
                
                
                Text("\(value ?? 0) / \(Int(range))")
                    .foregroundColor(.gray)
                    .font(.caption)
                    .padding(.top,5)
            }
        }
        .padding(.leading, 100)
        .padding(.trailing, 100)
    }
}
struct ThickProgressBarStyle: ProgressViewStyle {
    var thickness: CGFloat = 0
    
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .frame(height: thickness)
            
    }
}

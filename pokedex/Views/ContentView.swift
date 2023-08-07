//
//  ContentView.swift
//  pokedex
//
//  Created by Alexander Parreira on 06/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        
        NavigationView{
            Text("Hello, world!")
                .padding()
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

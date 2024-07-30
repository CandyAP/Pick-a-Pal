//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Candy Pangestu on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Tom", "Mark", "Travis"]
    @State private var nameToAdd = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.self) {
                    name in Text(name)
                }
            }
            
            TextField("Add Name", text: $nameToAdd)
                .padding()
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
        }
        
    }
}

#Preview {
    ContentView()
}

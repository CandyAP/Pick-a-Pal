//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Candy Pangestu on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            
            VStack {
                VStack {
                    Image(systemName: "person.3.sequence.fill")
                        .foregroundStyle(.tint)
                        .symbolRenderingMode(.hierarchical)
                    Text("Pick-a-Pal")
                }
                .font(.title)
                .bold()
                
                
                Text(pickedName.isEmpty ? " " : pickedName)
                    .foregroundStyle(.tint)
            }
            
            List {
                ForEach(names, id: \.self) {
                    name in Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove When Picked", isOn: $shouldRemovePickedName)
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll { name in return (name == randomName)}
                    }
                    
                } else {
                    pickedName = " "
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title)
        }
        .padding()
    }
        
}

#Preview {
    ContentView()
}

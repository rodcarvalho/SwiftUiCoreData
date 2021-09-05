//
//  ContentView.swift
//  SwiftUiCoreData
//
//  Created by Rodrigo Carvalho on 26/10/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Historia.entity(), sortDescriptors: [])
    
    var historias: FetchedResults<Historia>
    @State var mostrarHistoria = false
    
        var body: some View {
        NavigationView{
            List {
                ForEach(historias) { historia in
                    HStack{
                        VStack(alignment: .leading) {
                            Text("\(historia.titulo ?? "")")
                                .font(.title)
                            Text("Data de criação: \(historia.dataCriacao?.description ?? "" )")
                        }
                        Spacer()
                    }
                }
            }
            .navigationTitle("Histórias")
            .navigationBarItems(trailing: Button(action: {
                mostrarHistoria = true
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
            .sheet(isPresented: $mostrarHistoria) {
                FaseUmView()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

//
//  FaseUmView.swift
//  SwiftUiCoreData
//
//  Created by Rodrigo Carvalho on 26/10/20.
//

import SwiftUI

struct FaseUmView: View {
    //Acesso ao viewContext
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    @State var titulo = ""
    let bd = PersistenceController()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Título")){
                    TextField("Título da história", text: $titulo)
                        .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                }
                
                Button(action: {
                    guard self.titulo != "" else {return}
                    let novaHistoria = Historia(context: viewContext)
                    novaHistoria.titulo = self.titulo

                    novaHistoria.dataCriacao = Date()
                    novaHistoria.numeroPalavras = 8001
                    novaHistoria.id = UUID()
                    print(novaHistoria.dataCriacao?.description ?? String())
                    do {
                        try viewContext.save()
                        print("História Salva")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }, label: {
                    Text("Salvar História")
                })
            }
            .navigationTitle("Criar História")
        }

    }
}

struct FaseUmView_Previews: PreviewProvider {
    static var previews: some View {
        FaseUmView()
    }
}

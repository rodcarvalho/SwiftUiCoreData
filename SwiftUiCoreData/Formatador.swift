//
//  Formatador.swift
//  SwiftUiCoreData
//
//  Created by Rodrigo Carvalho on 27/10/20.
//

import Foundation

struct FormatadorData {
    
    let formatador = DateFormatter()
    
    func formatoData () {
        formatador.dateFormat = "dd/MM/yyyy"
    }
    
    func conversor(data: Date) -> String {
        formatador.string(from: data)
    }
    
}

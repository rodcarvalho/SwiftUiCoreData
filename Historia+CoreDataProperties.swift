//
//  Historia+CoreDataProperties.swift
//  SwiftUiCoreData
//
//  Created by Rodrigo Carvalho on 26/10/20.
//
//

import Foundation
import CoreData


extension Historia {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Historia> {
        return NSFetchRequest<Historia>(entityName: "Historia")
    }

    @NSManaged public var titulo: String?
    @NSManaged public var id: UUID?
    @NSManaged public var dataCriacao: Date?
    @NSManaged public var numeroPalavras: Int16

}

extension Historia : Identifiable {

}

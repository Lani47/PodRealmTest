//
//  CocoaMemoryItem.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/15.
//

import Foundation

struct DrugItem: Identifiable {
    let id: String
    let name: String
    let drugcalc: Int
    let stockpile: Int
    var drugColorRed: Double
    var drugColorGreen: Double
    var drugColorBlue: Double
    let order: Int
}

extension DrugItem {
    init(Drug: DrugDB){
        id = Drug.id
        name = Drug.name
        drugcalc = Drug.drugcalc
        stockpile = Drug.stockpile
        drugColorRed = Drug.drugColorRed
        drugColorGreen = Drug.drugColorGreen
        drugColorBlue = Drug.drugColorBrue
        order = Drug.order
    }
}

//
//  RimaindDrugItem.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/06.
//

import RealmSwift

// テーブル
class RimaindDrugDB: Object,ObjectKeyIdentifiable {
    @Persisted var id = ""
    
    @Persisted var name = ""  // カラム
    @Persisted var drugcalc = 0  // カラム
    @Persisted var stockpile = 0
    @Persisted var drugColorRed = 0.5
    @Persisted var drugColorGreen = 0.5
    @Persisted var drugColorBrue = 0.5
    @Persisted var order = 0
    
    override class func primaryKey() -> String? {
        "id"
    }
}
struct RimaindDrugItem: Identifiable {
    let id: String
    let name: String
    let drugcalc: Int
    let stockpile: Int
    var drugColorRed: Double
    var drugColorGreen: Double
    var drugColorBlue: Double
    let order: Int
}

extension RimaindDrugItem {
    init(Drug: RimaindDrugDB){
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

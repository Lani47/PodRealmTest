//
//  CocoaMemoryClass.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/15.
//

import SwiftUI
import RealmSwift

// テーブル
class Remaind: Object {
    @Persisted  var time = ""   // カラム
    @Persisted  var drug:DrugDB?  // カラム
}

// テーブル
class DrugDB: Object,ObjectKeyIdentifiable {
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

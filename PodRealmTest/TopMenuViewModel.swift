//
//  TopMenuViewModel.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/20.
//

import SwiftUI
import RealmSwift

class TopMenuViewModel: ObservableObject{
    
    @EnvironmentObject private var rimaindStore: RimindTimeStore
    
    @ObservedResults(RimindTimeDB.self) var rimaindGroups
    
    @State private var RimaindTimeset: RimindTimeItem?
    
    @AppStorage("launchedCount") var launchedCount = 0
    
    
    
    /// 初回起動なら発動
    func requestIfNeeded() {
        
        launchedCount += 1
        print("起動回数:\(launchedCount)")
        if launchedCount == 1 {
            
            newSet()
        }
    }
    
    
    //    func setup() {
    //        //UserDefaults.standard.set(false, forKey: "visit") //リセット用
    //        let visit = UserDefaults.standard.bool(forKey: "visit")
    //        if visit {
    //            //二回目以降
    //            print("二回目以降")
    //        } else {
    //            //初回アクセス
    //            print("初回起動")
    //            UserDefaults.standard.set(true, forKey: "visit")
    //        }
    //    }
    
    
    func newSet() {
        create(rimindDay: "月曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "火曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "水曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "木曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "金曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "土曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "日曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        print("初期データセット完了")
        
        
    }
    func create(rimindDay: String, kisyou:String, asamae:String, asaato: String, hirumae: String, hiruato:String, oyatu:String,banmae:String,banato:String,nerumae:String) {
        
        objectWillChange.send()
//
        do {
            let realm = try Realm()

            let rimind = RimindTimeDB()
            rimind.id = UUID().uuidString
            rimind.rimindDay = rimindDay
            rimind.kisyou = kisyou
            rimind.asamae = asamae
            rimind.asaato = asaato
            rimind.hirumae = hirumae
            rimind.hiruato = hiruato
            rimind.oyatu = oyatu
            rimind.banmae = banmae
            rimind.banato = banato
            rimind.nerumae = nerumae
            
            try realm.write {
                realm.add(rimind)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        print("test")
    }
    
}
//extension TopMenuViewModel {
//
//    private func create(index: Int) {
//        //    store.create(title: self.title, order: items.count)
//        //    self.title = ""
//
//        rimaindStore.create(rimindDay: <#T##String#>, kisyou: <#T##String#>, asamae: <#T##String#>, asaato: <#T##String#>, hirumae: <#T##String#>, hiruato: <#T##String#>, oyatu: <#T##String#>, banmae: <#T##String#>, banato: <#T##String#>, nerumae: <#T##String#>)
//
//        //        print("name:\(groups[index].name)drugcalc:\(groups[index].drugcalc)drugDay:\(drugDay)drugTime:\(drugTime)")
//    }
//
//    private func delete(offsets: IndexSet) {
//        guard let index = offsets.first else {
//            return
//        }
//        // 削除する行のIDを取得
//        let deleteId = groups[index].id
//        // 削除する行の行番号を取得
//        let deleteOrder = groups[index].order
//        let allcount = groups.count
//        if deleteOrder == allcount {
//        } else {
//            // 削除する行の行番号より大きい行番号を全て -1 する
//            for i in (deleteOrder + 1)..<groups.count {
//                store.update(id: groups[i].id, order: groups[i].order - 1)
//            }
//        }
//        //        // 行を削除する
//        store.delete(id: deleteId)
//
//        //
//        //        store.test()
//
//        //        print("id:\(deleteId)name:\(groups[index].name)")
//        print("index:\(index)")
//    }
//
//    private func deleteindex(index: Int) {
//        // 削除する行のIDを取得
//        let deleteId = groups[index].id
//        // 削除する行の行番号を取得
//        let deleteOrder = groups[index].order
//        let allcount = groups.count
//        if deleteOrder == allcount {
//        } else {
//            // 削除する行の行番号より大きい行番号を全て -1 する
//            for i in (deleteOrder + 1)..<groups.count {
//                store.update(id: groups[i].id, order: groups[i].order - 1)
//            }
//        }
//        //        // 行を削除する
//        store.delete(id: deleteId)
//
//        //
//        //        store.test()
//
//        //        print("id:\(deleteId)name:\(groups[index].name)")
////        print("index:\(index)")
//    }
//
//    private func move(sourceIndexSet: IndexSet, destination: Int) {
//        store.move(sourceIndexSet: sourceIndexSet, destination: destination)
//    }
//}
//
//
//
//

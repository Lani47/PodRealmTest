//
//  RimindSetNightView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2023/01/11.
//

import SwiftUI

import SwiftUI
import RealmSwift

struct RimindSetNightView: View {
    
    @State var dateModel = DateFormatterModel()
    
    @State var cat1: Bool = false
    
    @State var cat2: Bool = false
    
    @State var cat3: Bool = false
    // DrugStore
    //
    
    @State private var move = ""
    
    @State var drugDay = "月曜日"
    @State var drugTime = "夜"
    
    @State private var isDrugView: Bool = false
    @State private var isDatePickerView: Bool = false
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    //    // RimaindDB
    @ObservedResults(RimindDrugDB.self) var rimaindGroups
    
    @State private var rimaindItemset: RimindDrugItem?
    
    @EnvironmentObject private var rimaindStore: RimaindStore
    
    //　フィルター
    @ObservedResults(RimindDrugDB.self,where: {$0.rimindTime == "夜食前"}) var rimaindGroups1
    @ObservedResults(RimindDrugDB.self,where: {$0.rimindTime == "夜食後"}) var rimaindGroups2
    
    // RimindTestDB
    //    @ObservedResults(RimindTestDB.self) var rimindGroups
    //
    //    @State private var rimaindItemset: RimindTestItem?
    //
    //    @EnvironmentObject private var rimaindStore: RimindTestStore
    
    // DrugStoreテンプレ
    @EnvironmentObject private var store: DrugStore
    
    @ObservedResults(DrugDB.self) var groups
    
    @State private var itemset: DrugItem?
    
    // RimindTimeDB
    @ObservedResults(RimindTimeDB.self) var rimindTime
    
    @State private var rimindTimeset: RimindTimeItem?
    
    @EnvironmentObject private var rimindTimeStore: RimindTimeStore
    // MARK: 曜日を設定
    @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
    @State var date1:Date = Date()
    
    @State var date2:Date = Date()
  
    
   
    
    
    
    var body: some View {
        ScrollView{
        VStack{
            //夜食前ここから
            HStack{
                Text("夜食前")
                    .font(.largeTitle)
                DatePicker("", selection: $date1,displayedComponents: .hourAndMinute)
                    .frame(width: widht * 0.3)
                    .font(.largeTitle)
                    .onChange(of: date1, perform: {newValue in
                        
                        let dateset = dateModel.date_string(date: date1)
                        rimindbanmaeUpdate(time: dateset)
                        
                        print("$date1が操作された:\(dateset)")
                    })
                // MARK: 初期時刻を設定
                    .onAppear(perform: {
                        date1 = dateModel.StringToDate(dateValue: rimaindGroups22[0].banmae)
                        date2 = dateModel.StringToDate(dateValue: rimaindGroups22[0].banato)
                    
                    })
                
                
                
                
                
            }
            
            if rimaindGroups1.count != 0 {
                ScrollViewReader { reader in List {
                    
                    
                    
                    ForEach(rimaindGroups1) { item in
                        
                        if item.rimindTime == "夜食前"{
                            Text(item.name)
                                .font(.largeTitle)
                                .listRowBackground(Color(red: item.drugColorRed, green: item.drugColorGreen, blue: item.drugColorBrue))
                                .onTapGesture {
                                    deleteindex(index: item.order)
                                }
                            
                        }
                        
                        
                        
                    }
                    
                }
                }
                .frame(height: 1 * (100 + 0.4))
                
            }
            
            
            
            ZStack{
                
                Ellipse()
                    .fill(Color(red: 0.99, green: 0.46, blue: 0.58))
                
                    .frame(width: 50, height: 50)
                
                Text("+")
                    .onTapGesture {
                        self.drugTime = "夜食前"
                        self.drugDay = "月曜日"
                        print($drugTime)
                        
                        isDrugView.toggle()
                            
                    }
                    .sheet(isPresented: $isDrugView) {
                        let realm = try! Realm()
                        
                        
                        
                        DrugListView(drugDay: $drugDay, drugTime: $drugTime)
                            .environmentObject(DrugStore(realm: realm))
                            .environmentObject(RimaindStore(realm: realm))
                            .environmentObject(RimindTestStore(realm: realm))
                    }
            }
            
            //夜食前ここまで
            //夜食後ここから
            

            HStack{
                Text("夜食後")
                    .font(.largeTitle)
                DatePicker("", selection: $date2,displayedComponents: .hourAndMinute)
                    .frame(width: widht * 0.3)
                    .font(.largeTitle)
                    .onChange(of: date2, perform: {newValue in
                        
                        let dateset = dateModel.date_string(date: date2)
                        rimindbanatoUpdate(time: dateset)
                        
                        print("$date2が操作された:\(dateset)")
                    })
            }
            
            if rimaindGroups2.count != 0 {
                ScrollViewReader { reader in List {
                    
                    
                    
                    ForEach(rimaindGroups2) { item in
                        
                        if item.rimindTime == "夜食後"{
                            Text(item.name)
                                .font(.largeTitle)
                                .listRowBackground(Color(red: item.drugColorRed, green: item.drugColorGreen, blue: item.drugColorBrue))
                                .onTapGesture {
                                    deleteindex(index: item.order)
                                }
                            
                        }
                        
                        
                        
                    }
                    
                }
                }
                .frame(height: 1 * (100 + 0.4))
            }
            
            ZStack{
                
                Ellipse()
                    .fill(Color(red: 0.99, green: 0.46, blue: 0.58))
                
                    .frame(width: 50, height: 50)
                
                Text("+")
                    .onTapGesture {
                        
                        self.drugTime = "夜食後"
                        self.drugDay = "月曜日"
                        print($drugTime)
                        
                        isDrugView.toggle()
                    }
                    .sheet(isPresented: $isDrugView) {
                        let realm = try! Realm()
                        
                        
                        
                        DrugListView(drugDay: $drugDay, drugTime: $drugTime)
                            .environmentObject(DrugStore(realm: realm))
                            .environmentObject(RimaindStore(realm: realm))
                            .environmentObject(RimindTestStore(realm: realm))
                        
                        
                        
                    }
                
                
            }
            //夜食後ここまで

            
            
            

            
        }
        }
        
        // MARK: - ここに飲む予定の薬を表示させたい。
        
        
    }
}



struct RimindSetNightView_Previews: PreviewProvider {
    static var previews: some View {
        RimindSetNightView()
    }
}


extension RimindSetNightView {
    
    private func rimindbanmaeUpdate(time: String){
        
        
        let realm = try! Realm()
        
        // MARK: 曜日を変更
        @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
        do{
            try realm.write{
                rimaindGroups22[0].banmae = time
            }
        }catch {
            print("Error \(error)")
        }
        
    }
    private func rimindbanatoUpdate(time: String){
        
        // ① realmインスタンスの生成
        let realm = try! Realm()
        //        // ② 更新したいデータを検索する
        
        @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
        
        
        // ③ 部署を更新する
        do{
            try realm.write{
                
                
                rimaindGroups22[0].banato = time
                
            }
        }catch {
            print("Error \(error)")
        }
        
    }
    
    
    private func deleteindex(index: Int) {
        // 削除する行のIDを取得
        let deleteId = rimaindGroups[index].id
        // 削除する行の行番号を取得
        let deleteOrder = rimaindGroups[index].order
        let allcount = rimaindGroups.count
        if deleteOrder == allcount {
        } else {
            // 削除する行の行番号より大きい行番号を全て -1 する
            for i in (deleteOrder + 1)..<rimaindGroups.count {
                rimaindStore.update(id: rimaindGroups[i].id, order: rimaindGroups[i].order - 1)
            }
        }
        //        // 行を削除する
        rimaindStore.delete(id: deleteId)
        
        //
        //        store.test()
        
        //        print("id:\(deleteId)name:\(groups[index].name)")
        //        print("index:\(index)")
    }
    
    //    private func move(sourceIndexSet: IndexSet, destination: Int) {
    //        store.move(sourceIndexSet: sourceIndexSet, destination: destination)
    //    }
}


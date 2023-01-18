//
//  RimindSetSundayView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2023/01/11.
//

import SwiftUI

import SwiftUI
import RealmSwift

struct RimindSetSundayView: View {
    
    @State var dateModel = DateFormatterModel()
    
    @State var cat1: Bool = false
    
    @State var cat2: Bool = false
    
    @State var cat3: Bool = false
    // DrugStore
    //
    
    @State private var move = ""
    
    @State var drugDay = "月曜日"
    @State var drugTime = "昼"
    
    @State private var isDrugView: Bool = false
    @State private var isDatePickerView: Bool = false
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    //    // RimaindDB
    @ObservedResults(RimindDrugDB.self) var rimaindGroups
    
    @State private var rimaindItemset: RimindDrugItem?
    
    @EnvironmentObject private var rimaindStore: RimaindStore
    
    //　フィルター
    @ObservedResults(RimindDrugDB.self,where: {$0.rimindTime == "昼食前"}) var rimaindGroups1
    @ObservedResults(RimindDrugDB.self,where: {$0.rimindTime == "昼食後"}) var rimaindGroups2
    @ObservedResults(RimindDrugDB.self,where: {$0.rimindTime == "間食"}) var rimaindGroups3
    
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
    @State var date3:Date = Date()
    
    
    
    var body: some View {
        ScrollView{
        VStack{
            //昼食前ここから
            HStack{
                Text("昼食前")
                    .font(.largeTitle)
                DatePicker("", selection: $date1,displayedComponents: .hourAndMinute)
                    .frame(width: widht * 0.3)
                    .font(.largeTitle)
                    .onChange(of: date1, perform: {newValue in
                        
                        let dateset = dateModel.date_string(date: date1)
                        rimindhirumaeUpdate(time: dateset)
                        
                        print("$date1が操作された:\(dateset)")
                    })
                // MARK: 初期時刻を設定
                    .onAppear(perform: {
                        date1 = dateModel.StringToDate(dateValue: rimaindGroups22[0].hirumae)
                        date2 = dateModel.StringToDate(dateValue: rimaindGroups22[0].hiruato)
                        date3 = dateModel.StringToDate(dateValue: rimaindGroups22[0].oyatu)
                    })
                
                
                
                
                
            }
            
            if rimaindGroups1.count != 0 {
                ScrollViewReader { reader in List {
                    
                    
                    
                    ForEach(rimaindGroups1) { item in
                        
                        if item.rimindTime == "昼食前"{
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
                        //                        if groups.count == 0{
                        //                            print("薬が登録されていません。")
                        //
                        //                        } else {
                        //                            print("TopMenuView:薬登録に移動")
                        //
                        //                        }
                        self.drugTime = "昼食前"
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
            //昼食前ここまで
            //昼食後ここから
            HStack{
                Text("昼食後")
                    .font(.largeTitle)
                DatePicker("", selection: $date2,displayedComponents: .hourAndMinute)
                    .frame(width: widht * 0.3)
                    .font(.largeTitle)
                    .onChange(of: date2, perform: {newValue in
                        
                        let dateset = dateModel.date_string(date: date2)
                        rimindhiruatoUpdate(time: dateset)
                        
                        print("$date2が操作された:\(dateset)")
                    })
            }
            
            if rimaindGroups2.count != 0 {
                ScrollViewReader { reader in List {
                    
                    
                    
                    ForEach(rimaindGroups2) { item in
                        
                        if item.rimindTime == "昼食後"{
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
                        
                        self.drugTime = "昼食後"
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
            //昼食後ここまで
            //間食ここから
            HStack{
                Text("間食")
                    .font(.largeTitle)
                DatePicker("", selection: $date3,displayedComponents: .hourAndMinute)
                    .frame(width: widht * 0.3)
                    .font(.largeTitle)
                    .onChange(of: date3, perform: {newValue in
                        
                        let dateset = dateModel.date_string(date: date3)
                        rimindoyatuUpdate(time: dateset)
                        
                        print("$date3が操作された:\(dateset)")
                    })
            }
            
            if rimaindGroups3.count != 0 {
                ScrollViewReader { reader in List {
                    
                    
                    
                    ForEach(rimaindGroups3) { item in
                        
                        if item.rimindTime == "間食"{
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
                        
                        self.drugTime = "間食"
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
            //間食ここまで
            
        }
        }
        
        // MARK: - ここに飲む予定の薬を表示させたい。
        
        
    }
}



struct RimindSetSundayView_Previews: PreviewProvider {
    static var previews: some View {
        RimindSetSundayView()
    }
}


extension RimindSetSundayView {
    
    
    private func rimindhirumaeUpdate(time: String){
        
        
        let realm = try! Realm()
        
        // MARK: 曜日を変更
        @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
        do{
            try realm.write{
                rimaindGroups22[0].hirumae = time
            }
        }catch {
            print("Error \(error)")
        }
        
    }
    private func rimindhiruatoUpdate(time: String){
        
        // ① realmインスタンスの生成
        let realm = try! Realm()
        //        // ② 更新したいデータを検索する
        
        @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
        
        
        // ③ 部署を更新する
        do{
            try realm.write{
                
                
                rimaindGroups22[0].hiruato = time
                
            }
        }catch {
            print("Error \(error)")
        }
        
    }

    private func rimindoyatuUpdate(time: String){
        
        // ① realmインスタンスの生成
        let realm = try! Realm()
        //        // ② 更新したいデータを検索する
        
        @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
        
        
        // ③ 部署を更新する
        do{
            try realm.write{
                
                
                rimaindGroups22[0].oyatu = time
                
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


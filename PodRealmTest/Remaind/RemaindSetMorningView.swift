//
//  RemaindSetView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/06.
//

import SwiftUI
import RealmSwift

struct RemaindSetMorningView: View {
    
    @State var dateModel = DateFormatterModel()
    
    @State var cat1: Bool = false
    
    @State var cat2: Bool = false
    
    @State var cat3: Bool = false
    // DrugStore
    //
    
    @State private var move = ""
    
    @State var drugDay = "月曜日"
    
    //    @Binding var drugDay: String
    @State var drugTime = "朝"
    
    @State private var isDrugView: Bool = false
    @State private var isDatePickerView: Bool = false
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    //    // RimaindDB
    @ObservedResults(RimindDrugDB.self) var rimaindGroups
    
    @State private var rimaindItemset: RimindDrugItem?
    
    @EnvironmentObject private var rimaindStore: RimaindStore
    
    //　フィルター
    @ObservedResults(RimindDrugDB.self,where: {$0.rimindTime == "起床時"}) var rimaindGroups1
    @ObservedResults(RimindDrugDB.self,where: {$0.rimindTime == "朝食後"}) var rimaindGroups2
    
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
    
    
//    @State var date1:Date = Calendar.current.date(from: DateComponents(year : 2022, month: 1, day: 1)) ?? Date()
    @State var date1:Date = Calendar.current.date(from: DateComponents(hour: 6, minute: 30)) ?? Date()
    
    @State var date2:Date = Calendar.current.date(from: DateComponents(hour: 7, minute: 0)) ?? Date()
    @State var date3:Date = Calendar.current.date(from: DateComponents(hour: 7, minute: 15)) ?? Date()
    
    
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    //                Text("起床時")
                    //                    .font(.largeTitle)
                    //                Text("@@:@@")
                    //                    .font(.largeTitle)
                    //                    .onTapGesture {
                    //                        isDrugView.toggle()
                    //                    }
                    //                    .sheet(isPresented: $isDatePickerView) {
                    //
                    //
                    //                        DatePickerView()
                    //
                    //
                    //                    }
                    Text("起床時:").font(.largeTitle)
                    
                    DatePicker("", selection: $date1,displayedComponents: .hourAndMinute)
                        .frame(width: widht * 0.3)
                        .font(.largeTitle)
                    
                    
                    
                    
                    
                    
                }
                
                if rimaindGroups1.count != 0 {
                    ScrollViewReader { reader in List {
                        
                        
                        
                        ForEach(rimaindGroups1) { item in
                            
                            if item.rimindTime == "起床時"{
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
                            self.drugTime = "起床時"
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
                
                
                
                HStack{
                    //                Text("朝食前")
                    //                    .font(.largeTitle)
                    //                Text("@@:@@")
                    //                    .font(.largeTitle)
                    
                    
                    Text("朝食前:").font(.largeTitle)
                    
                    DatePicker("", selection: $date2,displayedComponents: .hourAndMinute)
                        .frame(width: widht * 0.3)
                        .font(.largeTitle)
                }
                
                
                ZStack{
                    
                    Ellipse()
                        .fill(Color(red: 0.99, green: 0.46, blue: 0.58))
                    
                        .frame(width: 50, height: 50)
                    
                    Text("+")
                        .onTapGesture {
                            
                            //データの一覧を表示
                            
                            let realm = try! Realm()
                            
                            let drugTable = realm.objects(RimindDrugDB.self)
                            //                        print(drugTable)
                            var test = dateModel.date_string(date: date1)
                            
                            print(test)
                            
                            
                            
                            
                            
                        }
                    
                    
                }
                HStack{
                    //                Text("朝食後")
                    //                    .font(.largeTitle)
                    //                Text("@@:@@")
                    //                    .font(.largeTitle)
                    Text("朝食後:").font(.largeTitle)
                    
                    DatePicker("", selection: $date3,displayedComponents: .hourAndMinute)
                        .frame(width: widht * 0.3)
                        .font(.largeTitle)
                }
                
                if rimaindGroups2.count != 0 {
                    ScrollViewReader { reader in List {
                        
                        
                        
                        ForEach(rimaindGroups2) { item in
                            
                            if item.rimindTime == "朝食後"{
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
                            
                            self.drugTime = "朝食後"
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
                
                
                
                
                
            }
        }
        
        // MARK: - ここに飲む予定の薬を表示させたい。
        
        
    }
}



struct RemaindSetMorningView_Previews: PreviewProvider {
    static var previews: some View {
        RemaindSetMorningView()
    }
}


extension RemaindSetMorningView {
    
    
    
    
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


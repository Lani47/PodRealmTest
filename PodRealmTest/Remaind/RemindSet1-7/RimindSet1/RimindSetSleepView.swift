//
//  RimindSheepView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2023/01/18.
//

import SwiftUI

import SwiftUI
import RealmSwift

struct RimindSetSleepView: View {
    
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
    @ObservedResults(RimindDrugDB.self,where: {$0.rimindTime == "就寝前"}) var rimaindGroups1
    
    
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
    
    var body: some View {
        ScrollView{
        VStack{
            //就寝前ここから
            HStack{
                Text("就寝前")
                    .font(.largeTitle)
                DatePicker("", selection: $date1,displayedComponents: .hourAndMinute)
                    .frame(width: widht * 0.3)
                    .font(.largeTitle)
                    .onChange(of: date1, perform: {newValue in
                        
                        let dateset = dateModel.date_string(date: date1)
                        rimindnerumeUpdate(time: dateset)
                        
                        print("$date1が操作された:\(dateset)")
                    })
                // MARK: 初期時刻を設定
                    .onAppear(perform: {
                        date1 = dateModel.StringToDate(dateValue: rimaindGroups22[0].nerumae)
                        
                    
                    })
            }
            
            if rimaindGroups1.count != 0 {
                ScrollViewReader { reader in List {
                    
                    
                    
                    ForEach(rimaindGroups1) { item in
                        
                        if item.rimindTime == "就寝前"{
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
                        self.drugTime = "就寝前"
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

            
            
        }
        }
        
        // MARK: - ここに飲む予定の薬を表示させたい。
        
        
    }
}



struct RimindSetSleepView_Previews: PreviewProvider {
    static var previews: some View {
        RimindSetSleepView()
    }
}


extension RimindSetSleepView {
    
    private func rimindnerumeUpdate(time: String){
        
        
        let realm = try! Realm()
        
        // MARK: 曜日を変更
        @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
        do{
            try realm.write{
                rimaindGroups22[0].nerumae = time
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


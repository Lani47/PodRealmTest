//
//  RemaindSetView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/06.
//

import SwiftUI
import RealmSwift

struct RemaindSetMorningView: View {
    
    @State var choice1: Bool = true
    
    @State var push = UserNotificationUtil()
    
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
    @ObservedResults(RimindDrugDB.self,where: {$0.rimindTime == "朝食前"}) var rimaindGroups2
    @ObservedResults(RimindDrugDB.self,where: {$0.rimindTime == "朝食後"}) var rimaindGroups3
    
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
    
    // RimindResultDB テンプレ
    @EnvironmentObject private var RimindResultStore: RimindResultStore
    
    @ObservedResults(RimindResultDB.self) var rimaindResultGroups
    
    @State private var RimindResultset: RimindResultItem?
    
    
    
    // MARK: 曜日を設定
    @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
    @State var date1:Date = Date()
    
    @State var date2:Date = Date()
    @State var date3:Date = Date()
    
    

    
    
    
    var body: some View {
        
        
        
        ScrollView{
            
            VStack{
                
                HStack{
                    
                    
                    
                    Text("起床時:").font(.largeTitle)
                    
                    
                    DatePicker("", selection: $date1,displayedComponents: .hourAndMinute)
                        .frame(width: widht * 0.3)
                        .font(.largeTitle)
                        .onChange(of: date1, perform: {newValue in
                            
                            let dateset = dateModel.date_string(date: date1)
                            rimindkisyouUpdate(time: dateset)
                            
                            print("$date1が操作された:\(dateset)")
                        })
                    // MARK: 初期時刻を設定
                        .onAppear(perform: {
                            date1 = dateModel.StringToDate(dateValue: rimaindGroups22[0].kisyou)
                            date2 = dateModel.StringToDate(dateValue: rimaindGroups22[0].asamae)
                            date3 = dateModel.StringToDate(dateValue: rimaindGroups22[0].asaato)
                            

                        })
                    
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
                //朝食前 ここから
                HStack{
                    Text("朝食前:").font(.largeTitle)
                    
                    DatePicker("", selection: $date2,displayedComponents: .hourAndMinute)
                        .frame(width: widht * 0.3)
                        .font(.largeTitle)
                        .onChange(of: date2, perform: {newValue in
                            
                            let dateset = dateModel.date_string(date: date2)
                            rimindasamaeUpdate(time: dateset)
                            
                            print("$date2が操作された:\(dateset)")
                        })
                }
                if rimaindGroups2.count != 0 {
                    ScrollViewReader { reader in List {
                        
                        
                        
                        ForEach(rimaindGroups2) { item in
                            
                            if item.rimindTime == "朝食前"{
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
                    // テスト用
                        .onTapGesture {

                            //データの一覧を表示

                            let realm = try! Realm()

                            let drugTable = realm.objects(RimindDrugDB.self)
                            //                        print(drugTable)


                            let timeTable = realm.objects(RimindTimeDB.self)

                           
//                            bom(charArray: Array(rimaindGroups22[0].kisyou))

                        }
                    
                    // 実践用
//                        .onTapGesture {
//                            self.drugTime = "朝食前"
//                            self.drugDay = "月曜日"
//                            print($drugTime)
//
//                            isDrugView.toggle()
//                        }
//                        .sheet(isPresented: $isDrugView) {
//                            let realm = try! Realm()
//                            DrugListView(drugDay: $drugDay, drugTime: $drugTime)
//                                .environmentObject(DrugStore(realm: realm))
//                                .environmentObject(RimaindStore(realm: realm))
//                                .environmentObject(RimindTestStore(realm: realm))
//                        }
                    
                }
                //朝食前　ここまで
                
                HStack{
                    //                Text("朝食後")
                    //                    .font(.largeTitle)
                    //                Text("@@:@@")
                    //                    .font(.largeTitle)
                    Text("朝食後:").font(.largeTitle)
                    
                    DatePicker("", selection: $date3,displayedComponents: .hourAndMinute)
                        .frame(width: widht * 0.3)
                        .font(.largeTitle)
                        .onChange(of: date3, perform: {newValue in
                            
                            let dateset = dateModel.date_string(date: date3)
                            rimindasaatoUpdate(time: dateset)
                            
                            print("$date3が操作された:\(dateset)")
                        })
                }
                
                if rimaindGroups3.count != 0 {
                    ScrollViewReader { reader in List {
                        
                        
                        
                        ForEach(rimaindGroups3) { item in
                            
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


// MARK: 時間別に設定
struct RemaindSetMorningView_Previews: PreviewProvider {
    static var previews: some View {
        RemaindSetMorningView()
    }
}


extension RemaindSetMorningView {
    
    private func datefunc() -> Date{
        let datetest:Date = Calendar.current.date(from: DateComponents(hour: 6, minute: 30)) ?? Date()
        
        return datetest
    }
    
    private func rimindkisyouUpdate(time: String){
        
        
        let realm = try! Realm()
        
        // MARK: 曜日を変更
        @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
        @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups23

        do{
            try realm.write{
                
                rimaindGroups22[0].kisyou = time
                if rimaindGroups1.count != 0 {
                    rimaindGroups23[0].kisyou = "◎"
                    bom(charArray: Array(rimaindGroups22[0].kisyou),timeStr: "起床時", drugCount: rimaindGroups1.count)
                }
                
            }
        }catch {
            print("Error \(error)")
        }
        
    }
    private func rimindasamaeUpdate(time: String){
        
        // ① realmインスタンスの生成
        let realm = try! Realm()
        //        // ② 更新したいデータを検索する
        
        @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
        @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups23
        
        
        // ③ 部署を更新する
        do{
            try realm.write{
                
                
                rimaindGroups22[0].asamae = time
                if rimaindGroups2.count != 0 {
                    rimaindGroups23[0].kisyou = "◎"
                bom(charArray: Array(rimaindGroups22[0].asamae),timeStr: "朝食前", drugCount: rimaindGroups2.count)
                }
            }
        }catch {
            print("Error \(error)")
        }
        
    }
    private func rimindasaatoUpdate(time: String){
        
        // ① realmインスタンスの生成
        let realm = try! Realm()
        //        // ② 更新したいデータを検索する
        
        @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
        @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups23

        
        
        // ③ 部署を更新する
        do{
            try realm.write{
                
                
                rimaindGroups22[0].asaato = time
                if rimaindGroups3.count != 0 {
                    rimaindGroups23[0].kisyou = "◎"

                bom(charArray: Array(rimaindGroups22[0].asaato),timeStr: "朝食後", drugCount: rimaindGroups3.count)
                }
            }
        }catch {
            print("Error \(error)")
        }
        
    }
    
    
    
    private func bom(charArray: Array<Character>, timeStr: String, drugCount: Int){
        //　通知を設定した時間に毎週設定
        
        //　全ての通知を消す
        let center = UNUserNotificationCenter.current()
//        center.removeAllPendingNotificationRequests()
        center.removePendingNotificationRequests(withIdentifiers: ["\(drugDay)\(timeStr)"])
        
        let content = UNMutableNotificationContent()
        content.title = "薬を飲みましょう！"
        content.body = "\(drugCount)種類の薬を飲む必要があります。"
        //StringからDateに変換する準備
//        let charArray = Array(rimaindGroups22[0].kisyou)

//        print(type(of: charArray))
        
        let hour1 = "\(charArray[0])"
        
        let hour = hour1 == "0" ? "\(charArray[1])": "\(charArray[0])\(charArray[1])"
        let minute1 = "\(charArray[3])"

        
        let minute = minute1 == "0" ?  "\(charArray[4])" : "\(charArray[3])\(charArray[4])"
        print("\(hour)時\(minute)分")
        
        
        //準備ができたので変換する
        let hourInt = Int(hour)!
        let munuteInt = Int(minute)!
        
       



        content.sound = UNNotificationSound.default

        let notificationCenter = UNUserNotificationCenter.current()

        var dateComponentsDay = DateComponents()

        dateComponentsDay.hour = hourInt
        dateComponentsDay.minute = munuteInt
        
//        switch drugDay {
//        case "月曜日":
//            dateComponentsDay.weekday  = 2
//        case "火曜日":
//            dateComponentsDay.weekday  = 3
//        case "水曜日":
//            dateComponentsDay.weekday  = 4
//        case "木曜日":
//            dateComponentsDay.weekday  = 5
//        case "金曜日":
//            dateComponentsDay.weekday  = 6
//        case "土曜日":
//            dateComponentsDay.weekday  = 7
//        case "日曜日":
//            dateComponentsDay.weekday  = 1
//        default:
//            dateComponentsDay.weekday  = 1
//
//        }


                            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsDay, repeats: true)
       

//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        let request = UNNotificationRequest(identifier: "\(drugDay)\(timeStr)", content: content, trigger: trigger)

        //⑤④のリクエストの通りに通知を実行させる
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        notificationCenter.add(request) { (error) in
            if error != nil {
                print(error.debugDescription)
            }
        }
        
        // 登録されている通知確認
        UNUserNotificationCenter.current().getPendingNotificationRequests {
            print("Pending requests :", $0)
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
        

    }
    
    //    private func move(sourceIndexSet: IndexSet, destination: Int) {
    //        store.move(sourceIndexSet: sourceIndexSet, destination: destination)
    //    }
}

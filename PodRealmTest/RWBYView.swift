//
//  RWBYView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/11.
//

import SwiftUI
import RealmSwift

struct RWBYView: View {
    @State var drugname = ""
    @State var drugcalc = 1
    @State var stockpile = 1
    //    @Binding var drugColors :Color
    @State var drugColors = Color(red: 0.852, green: 0.941, blue: 0.953)
    
    @EnvironmentObject var store: DrugStore
    
    
    // 表示フラグ
    @State private var isShowingView: Bool = false
    @State private var isShowingView2: Bool = false
    
    var body: some View {
        VStack{
            // 登録画面
            Text("登録画面")
                .font(.largeTitle)
                .padding(.bottom, 10.0)
            
            
            Text("名前")
                .font(.largeTitle)
            
            TextField("薬の名前", text: $drugname).background(Color(red: 0.852, green: 0.941, blue: 0.953)).font(.largeTitle)
                .frame(width: 305, height: 36)
            Text("使用量")
                .font(.largeTitle)
            
            TextField("使用量", value: $drugcalc, format: .number) .keyboardType(.numberPad).background(Color(red: 0.852, green: 0.941, blue: 0.953)).font(.largeTitle)
                .frame(width: 305, height: 36)
            Text("貯蓄量")
                .font(.largeTitle)
            
            TextField("貯蓄量", value: $stockpile, format: .number) .keyboardType(.numberPad).background(Color(red: 0.852, green: 0.941, blue: 0.953)).font(.largeTitle)
                .frame(width: 305, height: 36)
            HStack{
                Text("判別色")
                    .font(.largeTitle)
                
                //色の変更 別Viewに移動して変更
                Ellipse()
                    .fill($drugColors.wrappedValue)
                    .frame(width: 63, height: 61)
                    .onTapGesture {
                        isShowingView.toggle()
                    }
                    .sheet(isPresented: $isShowingView) {
                        ColorView( drugColors: $drugColors)
                    }
                
                
            }
            HStack{
            Button(action: {
                //データの登録
                let drug = DrugDB()
                drug.id = UUID().uuidString
                if drugname == ""{
                    drug.name = "メイショウフメイ"
                } else {
                    drug.name = drugname
                }
                drug.drugcalc = drugcalc
                drug.stockpile = stockpile
                drug.drugColorRed = drugColors.rgbValues.red
                drug.drugColorGreen =
                drugColors.rgbValues.green
                drug.drugColorBrue = drugColors.rgbValues.blue
                
                
                
                // 保存
                let realm = try! Realm()
                
                //の前に並び替えのためのデータの要素数を数える
                let drugTable = realm.objects(DrugDB.self)
                drug.order = drugTable.count
                //今度こそ保存？
                try! realm.write {
                    realm.add(drug)
                }
                print("\(drugname)を登録しました。")
            }, label: {
                Text("登録")
                
            }
            )
                //データの一覧を表示
                Button(action: {
                    let realm = try! Realm()

                    let drugTable = realm.objects(DrugDB.self)
                    print(drugTable)
                }, label: {
                    Text("一覧")
                })
                //薬一覧画面を表示
                Button(action: {
                    isShowingView2.toggle()
                    
                }, label: {
                    Text("薬一覧β")
                })
                .sheet(isPresented: $isShowingView2) {
                    let realm = try! Realm()
                    
//                    DrugListView( items: store.items)
//                        .environmentObject(DrugStore(realm: <#Realm#>))
                    
                    DrugListView()
                        .environmentObject(DrugStore(realm: realm))
                        
                }
                //データをロードする
                Button(action: {
                    let realm = try! Realm()

                    let drugTable = realm.objects(DrugDB.self)
                        print(drugTable[0])
                    drugname = drugTable[0].name
                    drugcalc = drugTable[0].drugcalc
                    stockpile = drugTable[0].stockpile
                    drugColors = Color(red: drugTable[0].drugColorRed, green: drugTable[0].drugColorGreen, blue: drugTable[0].drugColorBrue)
                }, label: {
                    Text("読み込み")
                })
            }
            
            
            
            
            
            
        }
    }
}

struct RWBYView_Previews: PreviewProvider {
    static var previews: some View {
        RWBYView()
    }
}


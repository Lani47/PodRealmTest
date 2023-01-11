//
//  RWBYView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/11.
//

import SwiftUI
import RealmSwift

struct RWBYView: View {
    
    @State var viewModel = RWBYViewModel()
    
    // 表示フラグ
    @State private var isColorView: Bool = false
    @State private var isDrugView: Bool = false
    @State var drugColors = Color(red: 0.852, green: 0.941, blue: 0.953)
    
    var body: some View {
        VStack{
            // 登録画面
            Text("登録画面")
                .font(.largeTitle)
                .padding(.bottom, 10.0)
                .onTapGesture {
                    
                }
            Text("名前")
                .font(.largeTitle)
            
            TextField("薬の名前", text: $viewModel.drugname).background(Color(red: 0.852, green: 0.941, blue: 0.953)).font(.largeTitle)
                .frame(width: 305, height: 36)
            Text("使用量")
                .font(.largeTitle)
            
            TextField("使用量", value:$viewModel.drugcalc, format: .number) .keyboardType(.numberPad).background(Color(red: 0.852, green: 0.941, blue: 0.953)).font(.largeTitle)
                .frame(width: 305, height: 36)
            Text("貯蓄量")
                .font(.largeTitle)
            
            TextField("貯蓄量", value: $viewModel.stockpile, format: .number) .keyboardType(.numberPad).background(Color(red: 0.852, green: 0.941, blue: 0.953)).font(.largeTitle)
                .frame(width: 305, height: 36)
            HStack{
                Text("色タグ")
                    .font(.largeTitle)
                
                //色の変更 別Viewに移動して変更
                Ellipse()
                    .fill($drugColors.wrappedValue)
                    .frame(width: 63, height: 61)
                    .onTapGesture {
                        isColorView.toggle()
                        
                    }
                    .sheet(isPresented: $isColorView) {
                        ColorView( drugColors: $drugColors)
                    }
            }
            HStack{
                Button(action: {
                    /*
                     //                //データの登録
                     //                let drug = DrugDB()
                     //                drug.id = UUID().uuidString
                     //                if viewModel.drugname == ""{
                     //                    drug.name = "メイショウフメイ"
                     //                } else {
                     //                    drug.name = viewModel.drugname
                     //                }
                     //                drug.drugcalc = viewModel.drugcalc
                     //                drug.stockpile = viewModel.stockpile
                     //                drug.drugColorRed = viewModel.drugColors.rgbValues.red
                     //                drug.drugColorGreen =
                     //                viewModel.drugColors.rgbValues.green
                     //                drug.drugColorBrue = viewModel.drugColors.rgbValues.blue
                     //
                     //
                     //
                     //                // 保存
                     //                let realm = try! Realm()
                     //
                     //                //の前に並び替えのためのデータの要素数を数える
                     //                let drugTable = realm.objects(DrugDB.self)
                     //                drug.order = drugTable.count
                     //                //今度こそ保存？
                     //                try! realm.write {
                     //                    realm.add(drug)
                     //                }
                     //                print("\($viewModel.drugname)を登録しました。")
                     */
                    
                    viewModel.Create(drugColorRed: drugColors.rgbValues.red, drugColorGreen: drugColors.rgbValues.green
                                     ,drugColorBlur: drugColors.rgbValues.blue)
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
                    isDrugView.toggle()
                    
                }, label: {
                    Text("薬一覧β")
                })
                .sheet(isPresented: $isDrugView) {
                    let realm = try! Realm()
                    
                    DrugListView(drugDay: $viewModel.drugname, drugTime: $viewModel.drugname)
                        .environmentObject(DrugStore(realm: realm))
                    
                }
                //データをロードする
//                Button(action: {
//                    
//                    /*
//                     //                    let realm = try! Realm()
//                     //                    let drugTable = realm.objects(DrugDB.self)
//                     //
//                     //                    if drugTable.count != 0{
//                     //                        let drugTable = realm.objects(DrugDB.self)
//                     //                            print(drugTable[0])
//                     //                    viewModel.drugname = drugTable[0].name
//                     //                        viewModel.drugcalc = drugTable[0].drugcalc
//                     //                        viewModel.stockpile = drugTable[0].stockpile
//                     //                        viewModel.drugColors = Color(red:drugTable[0].drugColorRed, green: drugTable[0].drugColorGreen, blue: drugTable[0].drugColorBrue)
//                     //                    } else {
//                     //                        print("登録なし")
//                     //                    }
//                     
//                     */
//                    viewModel.load()
//                    drugColors = viewModel.loadColor()
//                    
//                    
//                }, label: {
//                    Text("読み込み")
//                })
            }
        }
        
    }
}

struct RWBYView_Previews: PreviewProvider {
    static var previews: some View {
        RWBYView()
    }
}


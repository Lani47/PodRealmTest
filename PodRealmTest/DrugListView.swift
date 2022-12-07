//
//  DrugListView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/16.
//

import SwiftUI

import RealmSwift

struct DrugListView: View {
    
    
    @EnvironmentObject private var store: DrugStore
    
    @State private var move = ""
    
    //    let realm = try Realm()
    //    @StateObject private var store = DrugStore(realm: realm)
    
    
    
    @State var title = ""
    //    var items: [DrugItem]
    
    @ObservedResults(DrugDB.self) var groups
    
    @State private var itemset: DrugItem?

    
    
    @State private var showingAlerttest = false
    
    @State private var showingAlert = false
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    
    
    
    
    
    var body: some View {
      
            ScrollViewReader { reader in List {
                ForEach(groups) { item in
                    
                 
                    
                    ZStack{
                        AlertView(isPresented: $showingAlerttest, title: "続きから再開しますか？", message: "", actions: [
                                (
                                  title: "続きから再開する",
                                  style: UIAlertAction.Style.default,
                                  completionHandler: {
                                      deleteindex(index: item.order)
                                  }
                                ),
                                (
                                  title: "最初から始める",
                                  style: UIAlertAction.Style.default,
                                  completionHandler: {
//                                    viewModel.loadNewSession()
                                  }
                                ),
                                (
                                  title: "キャンセル",
                                  style: UIAlertAction.Style.cancel,
                                  completionHandler: {
//                                    viewModel.closeAction()
                                  }
                                ),
                              ])

                        
                        
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .frame(width: widht * 0.80, height: height * 0.1)
                        HStack{
                            Ellipse()
                                .fill(Color(red: item.drugColorRed, green: item.drugColorGreen, blue: item.drugColorBrue))
                                .frame(width: 54, height: 54)
//                                .offset(x: widht * -0.1)
//                                .padding(.leading, 10.0)
                                
                            
                            Text(item.name)
                                .multilineTextAlignment(.center)
                                .font(.title2)
                                .padding(.leading, 10.0)


    //                        Text("order:\(item.order)")
                            Image(systemName: "trash")
                                .onTapGesture {
//                                    self.showingAlert.toggle()
//                                    print("alert:\(showingAlert)")
                                    //正常に取れる
                                    print("order:\(item.order)")
                                    deleteindex(index: item.order)
                                }
//                                .alert("警告",isPresented: $showingAlert){
//                                    Button("削除", role: .destructive){
//                                         // 正常に取れない
//                                        print("order:\(item.order)")
//                                     }
//
//                                } message:{
//                                    Text("データが削除されますが、よろしいですか？")
//                                }
                                
                                


                                        
                        }
                    }
                    }
                }
//                .onDelete { offsets in
////                    delete(offsets: offsets)
//                    print(offsets)
//                }
                //                    .onMove { source, destination in
                //                      move(sourceIndexSet: source, destination: destination)
                //                    }
            }}
 
        
    }
}

//struct DrugListView_Previews: PreviewProvider {
//    // プレビュー用
//    let realm = try! Realm()
//
//    static var previews: some View {
//
//        DrugListView()
//    }
//}

extension DrugListView {
    
    private func create() {
        //    store.create(title: self.title, order: items.count)
        //    self.title = ""
    }
    
    private func delete(offsets: IndexSet) {
        guard let index = offsets.first else {
            return
        }
        // 削除する行のIDを取得
        let deleteId = groups[index].id
        // 削除する行の行番号を取得
        let deleteOrder = groups[index].order
        let allcount = groups.count
        if deleteOrder == allcount {
        } else {
            // 削除する行の行番号より大きい行番号を全て -1 する
            for i in (deleteOrder + 1)..<groups.count {
                store.update(id: groups[i].id, order: groups[i].order - 1)
            }
        }
        //        // 行を削除する
        store.delete(id: deleteId)
        
        //
        //        store.test()
        
        //        print("id:\(deleteId)name:\(groups[index].name)")
        print("index:\(index)")
    }
    
    private func deleteindex(index: Int) {
        // 削除する行のIDを取得
        let deleteId = groups[index].id
        // 削除する行の行番号を取得
        let deleteOrder = groups[index].order
        let allcount = groups.count
        if deleteOrder == allcount {
        } else {
            // 削除する行の行番号より大きい行番号を全て -1 する
            for i in (deleteOrder + 1)..<groups.count {
                store.update(id: groups[i].id, order: groups[i].order - 1)
            }
        }
        //        // 行を削除する
        store.delete(id: deleteId)

        //
        //        store.test()

        //        print("id:\(deleteId)name:\(groups[index].name)")
//        print("index:\(index)")
    }
    
    private func move(sourceIndexSet: IndexSet, destination: Int) {
        store.move(sourceIndexSet: sourceIndexSet, destination: destination)
    }
}


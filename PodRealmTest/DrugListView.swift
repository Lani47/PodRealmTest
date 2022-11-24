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
    
    //    let realm = try Realm()
    //    @StateObject private var store = DrugStore(realm: realm)
    
    
    
    @State var title = ""
    //    var items: [DrugItem]
    
    @ObservedResults(DrugDB.self) var groups
    
    
    
    var body: some View {
        VStack{
            EditButton()
                .padding(.top)
            HStack{
                TextField("タイトルの入力", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //                Button("決定", action: create)
                //                    .padding(.leading)
                //                    .padding(.trailing)
            }
            
            List {
                ForEach(groups) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        // orderの番号が分かりやすいように表示
                        Text("order:\(item.order)")
                        //                        Text("order:")
                    }
                }
                .onDelete { offsets in
                    delete(offsets: offsets)
                }
                //                    .onMove { source, destination in
                //                      move(sourceIndexSet: source, destination: destination)
                //                    }
            }
        }
        
    }
}

//struct DrugListView_Previews: PreviewProvider {
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
        print(allcount)
    }
    
    
    private func move(sourceIndexSet: IndexSet, destination: Int) {
        store.move(sourceIndexSet: sourceIndexSet, destination: destination)
    }
}


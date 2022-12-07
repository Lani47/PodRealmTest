//
//  RemaindSetView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/06.
//

import SwiftUI
import RealmSwift

struct RemaindSetView: View {
    
    @State var cat1: Bool = false
    
    @State var cat2: Bool = false
    
    @State var cat3: Bool = false
    
    @EnvironmentObject private var store: DrugStore
    
    @State private var move = ""

    @State var title = ""
    
    @ObservedResults(DrugDB.self) var groups
    
    @State private var itemset: DrugItem?

    
    
    @State private var showingAlerttest = false
    
    @State private var showingAlert = false
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack{
            HStack{
                Text("起床時")
                    .font(.largeTitle)
                Text("@@:@@")
                    .font(.largeTitle)
            }
            
            
            ZStack{
                
                Ellipse()
                    .fill(Color(red: 0.99, green: 0.46, blue: 0.58))
                
                    .frame(width: 50, height: 50)
                
                Text("+")
                    .onTapGesture {
                        if groups.count == 0{
                            print("薬が登録されていません。")
                            
                        } else {
                            print("TopMenuView:薬登録に移動")
                        
                        }
                        
                        print("TopMenuView:薬登録に移動")
                    }
                
                
                
            }
            

            
            HStack{
                Text("起床時")
                    .font(.largeTitle)
                Text("@@:@@")
                    .font(.largeTitle)
            }
            

            ZStack{

                Ellipse()
                    .fill(Color(red: 0.99, green: 0.46, blue: 0.58))

                    .frame(width: 50, height: 50)

                Text("+")


            }
            HStack{
                Text("起床時")
                    .font(.largeTitle)
                Text("@@:@@")
                    .font(.largeTitle)
            }
            ZStack{

                Ellipse()
                    .fill(Color(red: 0.99, green: 0.46, blue: 0.58))

                    .frame(width: 50, height: 50)

                Text("+")


            }
        }
    }
}

struct RemaindSetView_Previews: PreviewProvider {
    static var previews: some View {
        RemaindSetView()
    }
}

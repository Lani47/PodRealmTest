//
//  TopMenuView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/15.
//

import SwiftUI

struct TopMenuView: View {
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var showingAlert = false
    var body: some View {
        VStack{
            HStack{
                Image(decorative: "medical_medicine")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
                    .frame(width: 50, height: 50)
                
                    
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.631, green: 0.851, blue: 0.879))
                        .frame(width: widht * 0.65, height: height * 0.1)
                    Text("薬登録")
                        .multilineTextAlignment(.center).font(.title2)
                    
                }.onTapGesture {
                    print("TopMenuView:薬登録に移動")
                }
                
            }
            HStack{
                Image(decorative: "medical_kusuri_calender")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
                    .frame(width: 50, height: 50)
                
                    
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.665, green: 0.879, blue: 0.631))
                        .frame(width: widht * 0.65, height: height * 0.1)
                    Text("カレンダー")
                        .multilineTextAlignment(.center).font(.title2)
                    
                }                        .onTapGesture {
                   print("TopMenuView:カレンダーに移動")
                }
                
            }
            
        }
        
        
    }
}

struct TopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuView()
    }
}



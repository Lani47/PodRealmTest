//
//  ColorView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/11.
//

import SwiftUI

struct ColorView: View {
    @Environment(\.dismiss) var dismiss
//    @State var drugColors = Color(red: 0.49, green: 1, blue: 0.30)
    
    @Binding var drugColors :Color
    
    var body: some View {
        ZStack {
        Group {
            Ellipse()
            .fill(Color(red: 0.99, green: 0.46, blue: 0.58))
            .offset(x: -121, y: -209)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.99, green: 0.46, blue: 0.58)
                dismiss()
                            }


            Ellipse()
            .fill(Color(red: 1, green: 0.75, blue: 0.45))
            .offset(x: -60, y: -209)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 1, green: 0.75, blue: 0.45)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.91, green: 0.93, blue: 0.21))
            .offset(x: 1, y: -210)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.91, green: 0.93, blue: 0.21)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.66, green: 0.88, blue: 0.63))
            .offset(x: 61, y: -209)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.66, green: 0.88, blue: 0.63)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
            .offset(x: 122, y: -209)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.55, green: 0.88, blue: 0.86)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 1, green: 0, blue: 0.42))
            .offset(x: 122, y: -151)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 1, green: 0, blue: 0.42)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
            .offset(x: 61, y: -151)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.85, green: 0.85, blue: 0.85)
                print("hoge")
                dismiss()
                
                            }

            Ellipse()
            .fill(Color(red: 0.04, green: 0.04, blue: 0.04))
            .offset(x: 0, y: -151)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.04, green: 0.04, blue: 0.04)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.89, green: 0.65, blue: 1))
            .offset(x: -60, y: -151)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.89, green: 0.65, blue: 1, opacity: 0.74)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.52, green: 0.63, blue: 1))
            .offset(x: -121, y: -151)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.52, green: 0.63, blue: 1)
                dismiss()
                            }
        }
        Group {
//            Ellipse()
//            .fill(Color(red: 0.63, green: 0.85, blue: 0.88))
//            .offset(x: 31.50, y: -507)
//            .frame(width: 59, height: 54)

            Text("色を選択してください")
                .font(.largeTitle)
                .frame(width: 303, height: 46)
            .offset(x: 5.50, y: -250)
        }
        }
        .frame(width: 360, height: 640)
        .background(Color.white)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(drugColors: .constant(.init( red: 0.852, green: 0.941, blue: 0.953)))
    }
}

//
//   TimeUIListView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/25.
//

import SwiftUI

struct TimeUIListView: View {
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @State var drugState = "◎";
    
    // 表示フラグ
    @State private var morningRimaindView: Bool = false
    
    var body: some View {
        ScrollViewReader { reader in
            VStack{
                // MARK: - 曜日のリスト
                List {
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.99, green: 0.46, blue: 0.58))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("月曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(drugState)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                morningRimaindView.toggle()
                                            }
                                            .sheet(isPresented: $morningRimaindView) {
                                                RemaindSetView()
                                            }
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(0)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.997, green: 0.745, blue: 0.447))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("火曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(drugState)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(1)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.913, green: 0.93, blue: 0.209))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("水曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(drugState)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(2)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.665, green: 0.879, blue: 0.631))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("木曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(drugState)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(3)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.631, green: 0.851, blue: 0.879))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("金曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(drugState)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(4)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.517, green: 0.619, blue: 0.987))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("土曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(drugState)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(5)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.909, green: 0.729, blue: 0.989))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("日曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(drugState)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(drugState)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(6)
                    
                }
                // MARK: - 指定の曜日にワープするボタン
                HStack{
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.99, green: 0.46, blue: 0.58))
                        
                            .frame(width: widht * 0.1, height: height * 0.06)
                        
                        Text("月")
                            .font(.title)
                            .onTapGesture {
                                print("月曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(0)
                                }
                            }
                        
                    }
                    .frame(width: widht * 0.1, height: height * 0.06)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.997, green: 0.745, blue: 0.451))
                        
                            .frame(width: widht * 0.1, height: height * 0.06)
                        
                        Text("火")
                            .font(.title)
                            .onTapGesture {
                                print("火曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(1)
                                }
                            }
                        
                    }
                    .frame(width: widht * 0.1, height: height * 0.06)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.901, green: 0.918, blue: 0.206))
                        
                            .frame(width: widht * 0.1, height: height * 0.06)
                        
                        Text("水")
                            .font(.title)
                            .onTapGesture {
                                print("水曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(2)
                                }
                            }
                        
                    }
                    .frame(width: widht * 0.1, height: height * 0.06)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.665, green: 0.879, blue: 0.631))
                        
                            .frame(width: widht * 0.1, height: height * 0.06)
                        
                        Text("木")
                            .font(.title)
                            .onTapGesture {
                                print("水曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(3)
                                }
                            }
                        
                    }
                    .frame(width: widht * 0.1, height: height * 0.06)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.631, green: 0.851, blue: 0.879))
                        
                            .frame(width: widht * 0.1, height: height * 0.06)
                        
                        Text("金")
                            .font(.title)
                            .onTapGesture {
                                print("金曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(4)
                                }
                            }
                        
                    }
                    .frame(width: widht * 0.1, height: height * 0.06)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.521, green: 0.627, blue: 0.999))
                        
                            .frame(width: widht * 0.1, height: height * 0.06)
                        
                        Text("土")
                            .font(.title)
                            .onTapGesture {
                                print("土曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(5)
                                }
                            }
                        
                    }
                    .frame(width: widht * 0.1, height: height * 0.06)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.916, green: 0.737, blue: 1.0))
                        
                            .frame(width: widht * 0.1, height: height * 0.06)
                        
                        Text("日")
                            .font(.title)
                            .onTapGesture {
                                print("日曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(6)
                                }
                            }
                        
                    }
                    .frame(width: widht * 0.1, height: height * 0.06)
                    
                    
                }
            }
        }
        
        
        
        
        
        
        
        
        
        
    }
}

struct TimeUIListView_Previews: PreviewProvider {
    static var previews: some View {
        TimeUIListView()
    }
}



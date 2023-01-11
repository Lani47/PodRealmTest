//
//  TopMenuViewModel.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/20.
//

import SwiftUI

class TopMenuViewModel: ObservableObject{
    func setup() {
        //UserDefaults.standard.set(false, forKey: "visit") //リセット用
        let visit = UserDefaults.standard.bool(forKey: "visit")
        if visit {
            //二回目以降
            print("二回目以降")
        } else {
            //初回アクセス
            print("初回起動")
            UserDefaults.standard.set(true, forKey: "visit")
        }
    }
}



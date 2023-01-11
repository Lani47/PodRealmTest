//
//  DatePickerView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/21.
//

import SwiftUI

struct DatePickerView: View {
    @State var date:Date = Date()
    var body: some View {
        VStack {
            DatePicker("時刻", selection: $date,displayedComponents: .hourAndMinute)
                
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}

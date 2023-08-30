//
//  DateScrollbarView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 25/08/2023.
//

import SwiftUI

struct DateScrollbarView: View {
    let dates: [Date]

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(dates, id: \.timeIntervalSince1970) { date in
                    Text(date.dayMonthShortened)
                }
            }
        }
        .background(Color("Blue"))
    }
}

struct DateScrollbarView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollbarView(dates: [])
    }
}

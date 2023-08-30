//
//  DateScrollbarItemView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 30/08/2023.
//

import SwiftUI

struct DateScrollbarItemView: View {
    let date: Date
    let isSelected: Bool

    var body: some View {
        VStack {
            Text(date.dayMonthShortened)
                .foregroundColor(Color("Yellow"))
        }
        .padding()
        .background(
            isSelected ? Color("Orange") : Color("Green")
        )
        .cornerRadius(10)
    }
}

struct DateScrollbarItemView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollbarItemView(date: Date(), isSelected: true)
    }
}

//
//  DateScrollbarView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 25/08/2023.
//

import SwiftUI

struct DateScrollbarView: View {
    let dates: [Date]
    @State private var selectedDate: Date?

    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(dates, id: \.timeIntervalSince1970) { date in
                        DateScrollbarItemView(date: date, isSelected: date == selectedDate ? true : false)
                            .id(date)
                            .onTapGesture {
                                withAnimation {
                                    self.selectedDate = date
                                    scrollView.scrollTo(date, anchor: .center)
                                }
                            }
                    }
                }
            }
        }
    }
}

struct DateScrollbarView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollbarView(dates: [Date(), Date(), Date()])
    }
}

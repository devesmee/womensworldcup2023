//
//  DateScrollbarView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 25/08/2023.
//

import SwiftUI

struct DateScrollbarView: View {
    let dates: [Date]
    @Binding var selectedDate: Date?

    var body: some View {
        ScrollViewReader { scrollReader in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(dates, id: \.timeIntervalSince1970) { date in
                        DateScrollbarItemView(date: date, isSelected: date == selectedDate ? true : false)
                            .id(date)
                            .onTapGesture {
                                withAnimation {
                                    self.selectedDate = date
                                    scrollReader.scrollTo(date, anchor: .center)
                                }
                            }
                    }
                }
            }
            .onChange(of: selectedDate) { _ in
                withAnimation {
                    scrollReader.scrollTo(selectedDate, anchor: .center)
                }
            }
        }
    }
}

#Preview {
    @State var selectedDate: Date? = Date()

    return DateScrollbarView(dates: [Date(), Date(), Date()], selectedDate: $selectedDate)
}

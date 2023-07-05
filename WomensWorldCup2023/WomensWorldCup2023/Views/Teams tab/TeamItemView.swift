//
//  TeamItemView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI

struct TeamItemView: View {
    let country: Country

    var body: some View {
        VStack(alignment: .center) {
            Image(country.rawValue)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(country.rawValue)
                .fontWeight(.semibold)
                .frame(width: 100)
                .multilineTextAlignment(.leading)
        }
    }
}

struct TeamItemView_Previews: PreviewProvider {
    static var previews: some View {
        TeamItemView(country: .australia)
    }
}

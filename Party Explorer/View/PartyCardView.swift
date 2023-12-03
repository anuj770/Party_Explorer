//
//  PartyCardView.swift
//  Party Explorer
//
//  Created by Anuj Goel on 02/12/2023.
//

import SwiftUI
import Foundation

struct PartyCardView: View {
  let party: PartyData
  
  var body: some View {
    VStack {
      AsyncImage(url: party.bannerImageURL) { image in
        image
          .resizable()
          .frame(height: 200)
      } placeholder: {
        Image(.imagePlaceholder)
          .resizable()
          .frame(height: 200)
      }
      .cornerRadius(6.0)
      HStack{
        VStack(alignment: .leading){
          HStack{
            Text(party.name)
              .font(.headline)
              .foregroundColor(.appTheme)
            Spacer()
            Text("$\(party.price, specifier: "%.2f")")
              .font(.headline)
              .fontWeight(.semibold)
              .foregroundColor(.appTheme)
          }
          Text("From: \(party.startDate.toString(with: "EEE, dd MMMM yyyy"))")
              .font(.subheadline)

            if let endDate = party.endDate {
            Text("To: \(endDate.toString(with: "EEE, dd MMMM yyyy"))")
              .font(.subheadline)
          }
        }
        Spacer()
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

#Preview {
  PartyCardView(
    party:
      PartyData(
        name: "abc",
        bannerImageURL: URL(string: "https://picsum.photos/200/300")!,
        price: 50.0,
        startDate: .now,
        endDate: nil)
  )
}


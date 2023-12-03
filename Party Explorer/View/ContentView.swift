//
//  ContentView.swift
//  Party Explorer
//
//  Created by Anuj Goel on 02/12/2023.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = PartyViewModel()
  @State private var searchTerm: String = ""

  var body: some View {
    
    VStack{
      HStack{
        Spacer()
        Spacer()
        Text("Party Explorer")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.appTheme)
        Spacer()
        Button(action: {
          viewModel.addParty()
        }) {
          HStack {
            Image("add")
              .aspectRatio(contentMode: .fit)
              .foregroundColor(Color("AppTheme"))
          }
        }
        .padding()
      }
      HStack {
          TextField("Search by party name", text: $searchTerm)
              .padding(.leading, 8)
              .padding(.vertical, 4)
              .background(Color.gray.opacity(0.2))
              .cornerRadius(10)
      }
      .padding([.leading, .trailing])
      List(viewModel.searchParties(searchTerm: searchTerm)) { party in
        PartyCardView(party: party)
      }
      .listStyle(.plain)
    }
//    .background(.white)
  }
}



#Preview {
  ContentView()
}

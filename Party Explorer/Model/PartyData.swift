//
//  PartyData.swift
//  Party Explorer
//
//  Created by Anuj Goel on 02/12/2023.
//

import Foundation

struct PartyData: Identifiable, Hashable {
  let id = UUID()
  let name: String
  let bannerImageURL: URL
  let price: Double
  let startDate: Date
  let endDate: Date?
}

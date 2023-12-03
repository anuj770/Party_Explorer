//
//  PartyViewModel.swift
//  Party Explorer
//
//  Created by Anuj Goel on 02/12/2023.
//

import Foundation

class PartyViewModel: ObservableObject {
  @Published var parties: [PartyData] = []
  
  private let partyNames = ["House Party", "Beach Bash", "Karaoke Night", "Pool Party", "Movie Night"]
  private let bannerImageURLs = [
    URL(string: "https://t3.ftcdn.net/jpg/02/87/35/70/240_F_287357045_Ib0oYOxhotdjOEHi0vkggpZTQCsz0r19.jpg")!,
    URL(string: "https://t4.ftcdn.net/jpg/01/20/28/25/240_F_120282530_gMCruc8XX2mwf5YtODLV2O1TGHzu4CAb.jpg")!,
    URL(string: "https://t4.ftcdn.net/jpg/01/99/21/01/240_F_199210113_PO4I2F3CAfEhCnVnWNveK9mlgWyxY8jn.jpg")!,
    URL(string: "https://t3.ftcdn.net/jpg/01/10/11/00/240_F_110110063_4kxHX5YKcqrKqFz9udsaqmjkTCoOhKHc.jpg")!,
    URL(string: "https://t4.ftcdn.net/jpg/02/78/70/43/240_F_278704303_qVq3X0GXPoVMOlCqEbDDap60EY0wMm93.jpg")!,
  ]
  
  init() {
    generateInitialParties()
  }
  
  func searchParties(searchTerm: String) -> [PartyData] {
    if searchTerm.isEmpty {
      return parties
    } else {
      return parties.filter { $0.name.contains(searchTerm) }
    }
  }
  
  func addParty() {
    let newParty = generateRandomParty()
    parties.append(newParty)
  }
  
  private func generateInitialParties() {
    for _ in 0...2 {
      let newParty = generateRandomParty()
      parties.append(newParty)
    }
  }
  
  private func generateRandomParty() -> PartyData {
    let name = partyNames.randomElement()!
    let bannerImageURL = bannerImageURLs.randomElement()!
    let price = Double.random(in: 10...100)
    let startDate = randomStartDate()
    let endDate = randomEndDate(after: startDate)
    
    return PartyData(name: name, bannerImageURL: bannerImageURL, price: price, startDate: startDate, endDate: endDate)
  }
  
  private func randomStartDate() -> Date {
      let currentDate = Date()
      
      let randomInterval = Double.random(in: 86400...604800)
      
      // Ensure that the generated start date is greater than the current date
      let startDate = currentDate.addingTimeInterval(randomInterval)
      return startDate > currentDate ? startDate : currentDate
  }


  private func randomEndDate(after startDate: Date) -> Date? {
      if Bool.random() {
          let randomInterval = Double.random(in: 86400...604800)
          let endDate = startDate.addingTimeInterval(randomInterval)
          return endDate > startDate ? endDate : nil
      } else {
          return nil
      }
  }

}

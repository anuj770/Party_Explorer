//
//  Date+Extension.swift
//  Party Explorer
//
//  Created by Anuj Goel on 03/12/2023.
//

import Foundation

extension Date {
     func toString(with format: String) -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let myString = formatter.string(from: self) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = format
        // again convert your date to string
        return formatter.string(from: yourDate!)
    }
}

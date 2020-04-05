//
//  HolidayCalendarModel.swift
//  workingWithAPI
//
//  Created by Nurbek on 2/11/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import Foundation

struct HolidayResponse: Decodable {
    var response: Holidays
}

struct Holidays: Decodable {
    var holidays: [HolidayDetail]
}

struct HolidayDetail: Decodable {
    var name: String
    var description: String
    var date: DateInfo
    var locations: String
}

struct DateInfo: Decodable {
    var iso: String
}

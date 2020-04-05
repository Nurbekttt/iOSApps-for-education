//
//  HolidayRequest.swift
//  workingWithAPI
//
//  Created by Nurbek on 2/11/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import Foundation
enum HolidayError: Error{
    case noDataAvailable
    case canNotProcessData
}
struct HolidayRequest {
    let resourceURL:URL
    let API_KEY = "d2cd39c229135f295a78a75b8627a891a8f7dbb33ffa510a24d46ecb244a9457"
    
    init(countryCode: String) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        print(countryCode)
        let resourceString = "https://calendarific.com/api/v2/holidays?api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
        print(resourceURL)
    }
    func getHoliday(completion: @escaping(Result<[HolidayDetail], HolidayError>)-> Void)  {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let holidaysResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                print(holidaysResponse)
                let holidayDetails = holidaysResponse.response
                completion(.success(holidayDetails.holidays))
                
            }
            catch {
                print(error)
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
}

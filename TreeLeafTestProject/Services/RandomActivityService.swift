//
//  RandomActivityService.swift
//  TreeLeafTestProject
//
//  Created by Ranjeet Sah on 13/05/2022.
//

import Foundation

enum RandomActivityDataError: Error {
    case invalidResponse
    case noData
    case failedRequest
    case invalidData
}

class RandomActivityService {
    
    typealias RandomActivityDataCompletion = (RandomActivityData?, RandomActivityDataError?) -> ()
    
    private static let host = "www.boredapi.com"
    private static let path = "/api/activity"
    
    static func randomActivityData(completion: @escaping RandomActivityDataCompletion) {
      var urlBuilder = URLComponents()
      urlBuilder.scheme = "https"
      urlBuilder.host = host
      urlBuilder.path = path
      
      let url = urlBuilder.url!
      
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        //execute completion handler on main thread
        DispatchQueue.main.async {
          guard error == nil else {
            print("Failed request from Boredapi: \(error!.localizedDescription)")
            completion(nil, .failedRequest)
            return
          }
          
          guard let data = data else {
            print("No data returned from Boredapi")
            completion(nil, .noData)
            return
          }
          
          guard let response = response as? HTTPURLResponse else {
            print("Unable to process Boredapi response")
            completion(nil, .invalidResponse)
            return
          }
          
          guard response.statusCode == 200 else {
            print("Failure response from Boredapi: \(response.statusCode)")
            completion(nil, .failedRequest)
            return
          }
          
          do {
            let decoder = JSONDecoder()
            let randomActivityData: RandomActivityData = try decoder.decode(RandomActivityData.self, from: data)
            completion(randomActivityData, nil)
          } catch {
            print("Unable to decode Boredapi response: \(error.localizedDescription)")
            completion(nil, .invalidData)
          }
        }
      }.resume()
    }
    
    
}

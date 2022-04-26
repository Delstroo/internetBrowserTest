//
//  SearchModelController.swift
//  test
//
//  Created by Delstun McCray on 4/26/22.
//

import Foundation
import UIKit

class SearchModelController {
    
    static let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://serpapi.com/search.json?q=&hl=en&gl=us&google_domain=google.com&api_key="
    static let apiKey = "b1c44c91c3963de478c7cc58b4bf8cd4fee1969d9f8049b14c5b199dae3e44fb"
    
    static func fetchSearchTerm(searchTerm: String, completion: @escaping (Result<[OrganicQuestions], SearchErrors>) -> Void) {
        
        guard let baseURl = URL(string: baseURL) else { return completion(.failure(.invalidURL)) }
        var components = URLComponents(url: baseURl, resolvingAgainstBaseURL: true)
        let apiQuerey = URLQueryItem(name: "api_key", value: apiKey)
        let searchQuerey = URLQueryItem(name: "q", value: searchTerm)
        components?.queryItems = [apiQuerey, searchQuerey]
        
        guard let finalURL = components?.url else { return completion(.failure(.invalidURL)) }
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                return completion(.failure(.throwError(error))) }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("Status code \(response.statusCode)")
                    
                }
                
                guard let data = data else { return completion(.failure(.noData)) }
                
                do {
                    let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                    
                    var arrayOfSearches: [OrganicQuestions] = []
                    for search in topLevelObject.organic_results {
                        arrayOfSearches.append(search)
                    }
                    completion(.success(arrayOfSearches))
                } catch {
                    print("Error in \(#function) : \(error.localizedDescription) \n--\n \(error)")
                }
            }
        }.resume()
    }

    static func fetchPhotosForResult(photoURL: String, completion: @escaping (Result<UIImage, SearchErrors>) -> Void) {
        
        guard let baseURL = URL(string: baseURL) else { return completion(.failure(.invalidURL)) }
        
        let finalURL = baseURL.appendingPathComponent(photoURL)
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error = error {
                return completion(.failure(.throwError(error)))
                
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            guard let poster = UIImage(data: data) else { return completion(.failure(.noData)) }
            self.cache.setObject(poster, forKey: NSString(string: photoURL))
            completion(.success(poster))
            
        }
        
    }
    
    
}

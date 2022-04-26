//
//  SearchErrors.swift
//  test
//
//  Created by Delstun McCray on 4/26/22.
//

import Foundation

enum SearchErrors: LocalizedError {
    
    case invalidURL
    case throwError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "There was a failure with the server."
        case .throwError(_):
            return "there was an error with our network call."
        case .noData:
            return "There was no data found."
        case .unableToDecode:
            return "there was no data found."
        }
    }
}//end of enum

//
//  SearchModels.swift
//  test
//
//  Created by Delstun McCray on 4/26/22.
//

import Foundation

struct TopLevelObject: Codable {
//    let search_parameters: SearchParameters
//    let search_informatino: SearchInformation
//    let knowledge_graph: KnowledgeGraph
//    let inline_videos: [InlineVideos]
//    let inline_people_also_searched_for: [PeopleAlsoSearchedFor]
    let organic_results: [OrganicQuestions]
}

//struct SearchParameters: Codable {
//    let engine: String
//    let q: String
//    let google_domain: String
//    let hl: String
//    let gl: String
//    let device: String
//    
//}
//
//struct SearchInformation: Codable {
//    let organic_results_state: String
//    let query_display: String
//    let total_results: Int
//    let time_taken_displayed: Double
//    
//}
//
//struct KnowledgeGraph: Codable {
//    let title: String
//    let cite_name: String
//    let cite_link: String
//    let header_images: [HeaderImages]
//    let description: String
//    let source: KnowledgeGraphSource
//    let born: String
//    let born_links: [BornLinks]
//    let full_name: String
//    let genre: String
//    let genre_links: [GenreLinks]
//    let songs: [Songs]
//    let albums: [Albums]
//    let profiles: [Profiles]
//    
//}
//
//struct HeaderImages: Codable {
//    let source: String
//    
//}
//
//struct KnowledgeGraphSource: Codable {
//    let name: String
//    let link: String
//    
//}
//
//struct BornLinks: Codable {
//    let text: String
//    let link: String
//    
//}
//
//struct GenreLinks: Codable {
//    let text: String
//    let link: String
//    
//}
//
//struct Songs: Codable {
//    let name: String
//    let extensions: String
//    let serpapi_links: String
//    let image: String
//
//}
//
//struct Albums: Codable {
//    let name: String
//    let extensions: [String]
//    let link: String
//    let serpapi_link: String
//    let image: String
//    
//}
//
//struct Profiles: Codable {
//    let name: String
//    let linke: String
//    let serpapi_link: String
//    let image: String
//    
//}
//
//struct InlineVideos: Codable {
//    let position: Int
//    let title: String
//    let link: String
//    let thumbnail: String
//    let channel: String
//    let duration: String
//    let platform: String
//    let date: String
//    
//}
//
//struct PeopleAlsoSearchedFor: Codable {
//    let title: String
//    let items: [Items]
//    
//}
//
//struct Items: Codable {
//    let name: String
//    let image: String
//    let link: String
//    let serpapi_link: String
//    
//}

struct OrganicQuestions: Codable {
    let position: Int?
    let title: String?
    let link: String?
    let displayed_link: String?
    let thumbnail: String?
    let snippet:String?
}

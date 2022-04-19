//
//  MovieEntity.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 19/04/22.
//

import Foundation

class MovieModel: Codable {
    
    let id: String?
    let title: String?
    let brief: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, brief
        case imageUrl = "image_url"
    }
    
}

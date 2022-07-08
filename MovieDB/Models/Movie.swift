//
//  Movie.swift
//  MovieDB
//
//  Created by 최기훈 on 2022/07/08.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}


struct Movie: Decodable {
    
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overView: String
    let voteAverage: Double
    let voteCount: Int
    let runTime: Int?
    
}

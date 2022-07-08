//
//  MovieService.swift
//  MovieDB
//
//  Created by 최기훈 on 2022/07/08.
//

import Foundation
import CoreData


protocol MovieService {
    
    func fetchMovies(from endpoint: MoviListEndpoint, completion: @escaping(Result<MovieResponse, MovieError>) -> ())
    func fetchMovie(id: Int, completion: @escaping(Result<Movie,MovieError>) -> () )
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> () )
}


enum MoviListEndpoint: String, CaseIterable {
    case nowPlaying = "now-playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    var description: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "UpComing"
        case .topRated: return "Top Rated"
        case.popular: return "Popular"
        }
    }
}

enum MovieError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invaldResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invaldResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}

//
//  Model.swift
//  Movies
//
//  Created by PTGHYD on 18/01/21.
//

import Foundation

// MARK: - ServicesAndProperties
struct ServicesAndProperties: Codable {
    let dates: Dates?
    let page: Int?
    let results: [Result]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case dates = "dates"
        case page = "page"
        case results = "results"
        case totalPages = "totalPages"
        case totalResults = "totalResults"
        
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dates = values.decodeSafely(.dates)
        page = values.decodeSafely(.page)
        results = values.decodeSafely(.results)
        totalPages = values.decodeSafely(.totalPages)
        totalResults = values.decodeSafely(.totalResults)
    }
    
}

// MARK: - Dates
struct Dates:Codable {
    let maximum, minimum: String?
    
    enum CodingKeys: String, CodingKey {
        case maximum = "maximum"
        case minimum = "minimum"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maximum = values.decodeSafely(.maximum)
        minimum = values.decodeSafely(.minimum)
    }

}

// MARK: - Result
struct Result: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?//OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdropPath"
        case genreIDS = "genreIDS"
        case id = "id"
        case originalLanguage = "originalLanguage"
        case originalTitle = "originalTitle"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "posterPath"
        case releaseDate = "releaseDate"
        case title = "title"
        case video = "video"
        case voteAverage = "voteAverage"
        case voteCount = "voteCount"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = values.decodeSafely(.adult)
        backdropPath = values.decodeSafely(.backdropPath)
        genreIDS = values.decodeSafely(.genreIDS)
        id = values.decodeSafely(.id)
        originalLanguage = values.decodeSafely(.originalLanguage)
        originalTitle = values.decodeSafely(.originalTitle)
        overview = values.decodeSafely(.overview)
        popularity = values.decodeSafely(.popularity)
        posterPath = values.decodeSafely(.posterPath)
        releaseDate = values.decodeSafely(.releaseDate)
        title = values.decodeSafely(.title)
        video = values.decodeSafely(.video)
        voteAverage = values.decodeSafely(.voteAverage)
        voteCount = values.decodeSafely(.voteCount)
    }
    
    
}

enum OriginalLanguage {
    case en
    case fr
    case ja
    case ru
}

extension KeyedDecodingContainer {
    
    public func decodeSafely<T: Decodable>(_ key: KeyedDecodingContainer.Key) -> T? {
        return self.decodeSafely(T.self, forKey: key)
    }
    
    public func decodeSafely<T: Decodable>(_ type: T.Type, forKey key: KeyedDecodingContainer.Key) -> T? {
        let decoded = try? decode(T.self, forKey: key)
        return decoded
    }
    
    public func decodeSafelyIfPresent<T: Decodable>(_ key: KeyedDecodingContainer.Key) -> T? {
        
        return self.decodeSafelyIfPresent(T.self, forKey: key)
    }
    
    public func decodeSafelyIfPresent<T: Decodable>(_ type: T.Type, forKey key: KeyedDecodingContainer.Key) -> T? {
        let decoded = try? decodeIfPresent(T.self, forKey: key)
        return decoded ?? nil
    }
}


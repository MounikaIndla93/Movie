




import Foundation

// MARK: - Top
struct TopRated :Codable{
    let page: Int?
    let results: [TopRatedResult]?
    let totalPages, totalResults: Int?
}

// MARK: - Result
struct TopRatedResult:Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
}

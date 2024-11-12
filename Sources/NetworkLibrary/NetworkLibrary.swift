import Foundation

public final class NetworkLibrary {
    private let apiKey = "5182db021a1a46309a0e1cdf3cb848f8"
    public init() {}
    

    public func fetchNews(page: Int, completion: @escaping @Sendable(Result<[NewsArticle], Error>) -> Void) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&page=\(page)&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(.success(newsResponse.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

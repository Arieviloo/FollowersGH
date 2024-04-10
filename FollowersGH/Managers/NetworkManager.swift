import Foundation

class NetworkManager {
	static let shared = NetworkManager()
	let baseURL = "https://api.github.com"

	private init() {}

	func getFollower(for username: String, page: Int, completed: @escaping([Follower]?, String?) -> Void) {
		let endpoint = "\(baseURL)/users/\(username)/followers?per_page=100&page=\(page)"

		guard let url = URL(string: endpoint) else {
			completed(nil, "This username created an invalid request. Please try again.")
			return
		}

		URLSession.shared.dataTask(with: url) {data, response, error in
			DispatchQueue.main.async {

				if let error {
					completed(nil, "Unable to complete your resquest. Please check your internet connection")
				}

				guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
					completed(nil, "Invalid response from the server. Please try again.")
					return
				}

				guard let data else {
					completed(nil, "The data received from the server was invalid. Please try again.")
					return
				}

				do {
					let decoder = JSONDecoder()
					decoder.keyDecodingStrategy = .convertFromSnakeCase
					let followers = try decoder.decode([Follower].self, from: data)
					completed(followers, nil)

				} catch {
					completed(nil, "The data received in the JSONDecoder was invalid. Please try again.")
				}
			}
		}.resume()
	}
}

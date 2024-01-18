

import UIKit

class ImageCache {
    static let shared = ImageCache()
    
    private var cache: [URL: UIImage] = [:]
    
    func getImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache[url] {
            completion(cachedImage)
        } else {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data, let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                self.cache[url] = image
                completion(image)
            }.resume()
        }
    }
}

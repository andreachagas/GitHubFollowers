//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Andrea Chagas on 20/6/21.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage: UIImage = UIImage(named: "avatar-placeholder")!
    let cache: NSCache = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true // so that image is also rounded
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return // if we have the cached image, don't run network call
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let strongSelf = self else { return }
            
            if error != nil {
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            strongSelf.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async {
                strongSelf.image = image
            }
        }
        task.resume() // run the network call
    }
}

//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Andrea Chagas on 20/6/21.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")! // not a good idea to force unwrap this...
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
}

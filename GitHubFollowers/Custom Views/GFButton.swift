//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Andrea Chagas on 20/6/21.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColour: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColour
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

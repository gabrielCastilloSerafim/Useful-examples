//
//  ImageProvider.swift
//  Image Cache example
//
//  Created by Gabriel Castillo Serafim on 16/12/22.
//

import UIKit

class ImageProvider {
    
    static let shared = ImageProvider()
    
    private init() {}
    
    private let cache = NSCache<NSString, UIImage>()
    
    public func fetchImage(completion: @escaping (UIImage) -> Void) {
        
        if let image = cache.object(forKey: "Image") {
            
            completion(image)
            print("Using Cache image")
            return
        }
        
        guard let url = URL(string: "https://source.unsplash.com/random/500X500") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            
            guard let data = data else { return }
            
            let image = UIImage(data: data)
            
            self?.cache.setObject(image!, forKey: "Image")
            
            completion(image!)
            print("Image Downloaded")
        }
        task.resume()
        
    }
    
}

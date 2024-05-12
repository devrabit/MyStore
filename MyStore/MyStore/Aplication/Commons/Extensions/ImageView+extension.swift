//
//  ImageView.swift
//  Beauty Cats
//
//  Created by Andrey Carreño on 20/02/24.
//

import Foundation
import UIKit
extension UIImageView{
    func downloadImage(from url: String) {
        print("Download Started")
        let urlParc=URL(string: url)
        print(urlParc!)
       
        URLSession.shared.dataTask(with: urlParc!) { (data, response, error) in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? urlParc!.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }
    }
    
    func load(strUrl: String) {
        let url=URL(string: strUrl)!
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
}

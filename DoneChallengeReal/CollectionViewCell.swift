//
//  CollectionViewCell.swift
//  DoneChallengeReal
//
//  Created by Test on 16.03.2022.
//

import UIKit

import SDWebImage

import Alamofire


class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageViewMine: UIImageView!
    
    @IBOutlet weak var textFirstViewMine: UILabel!
    
    @IBOutlet weak var textSecondViewMine: UILabel!
    
    var sampleURLArray = ["https://api.unsplash.com/search/photos?page=1&query=cat&client_id=869f6830c0c80b50e4fc96a8d07b4127fae9bb508440d95d378b4dd2edbefd54",
                          "https://api.unsplash.com/search/photos?page=1&query=dog&client_id=869f6830c0c80b50e4fc96a8d07b4127fae9bb508440d95d378b4dd2edbefd54",
                          "https://api.unsplash.com/search/photos?page=1&query=rabbit&client_id=869f6830c0c80b50e4fc96a8d07b4127fae9bb508440d95d378b4dd2edbefd54",
                          "https://api.unsplash.com/search/photos?page=1&query=bird&client_id=869f6830c0c80b50e4fc96a8d07b4127fae9bb508440d95d378b4dd2edbefd54"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func createCustomCollection(firstText: String, secondText: String){
        
        self.textFirstViewMine.text = firstText
        self.textSecondViewMine.text = secondText
    }
    
    func photoAssigner(animalID : Int , photoID: Int){
        
        fetchURL(animalID: animalID, photoID: photoID)
        
    }
    
    
    var animalList = ["https://api.unsplash.com/search/photos?page=1&query=cat&client_id=869f6830c0c80b50e4fc96a8d07b4127fae9bb508440d95d378b4dd2edbefd54",
                      "https://api.unsplash.com/search/photos?page=1&query=dog&client_id=869f6830c0c80b50e4fc96a8d07b4127fae9bb508440d95d378b4dd2edbefd54",
                      "https://api.unsplash.com/search/photos?page=1&query=rabbit&client_id=869f6830c0c80b50e4fc96a8d07b4127fae9bb508440d95d378b4dd2edbefd54",
                      "https://api.unsplash.com/search/photos?page=1&query=bird&client_id=869f6830c0c80b50e4fc96a8d07b4127fae9bb508440d95d378b4dd2edbefd54"]
    
    func fetchURL(animalID: Int, photoID: Int) -> String? {
        
        let urlString = self.animalList[animalID]
        
        guard let url = URL(string: urlString) else{
            return "NULL"
        }
        
        var returnString = "trial"
        
        let getDataTask = URLSession.shared.dataTask(with: url, completionHandler: {data ,_ ,error in
            
            guard let urlData = data, error == nil else{
                return
            }
            print("olmuyor")
            do {

                let jsonResult = try JSONDecoder().decode(MyImages.self, from: urlData)
                                
                if let imageRawUrl = jsonResult.results[photoID].urls["thumb"]{
           
                    DispatchQueue.main.async {
                        self.imageViewMine.sd_setImage(with: URL(string: imageRawUrl), placeholderImage: UIImage(named: "githubImage.jpeg"))
                    }
                }
            }catch {
            }
        })
        getDataTask.resume()
        return returnString
    }

    
}

struct MyImages : Codable{
    
    let total : Int
    let results: [Results]
}

struct Results: Codable{
    let urls : [String: String]
}


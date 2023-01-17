//
//  TableViewCell.swift
//  DoneChallengeReal
//
//  Created by Test on 16.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate {

    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    var animalIDTableCell : Int? // Bu variable'i TableViewController'dan CollectionViewCell'e integer tasimak icin kullandim
    
    let animalsNameList = ["Cat","Dog","Rabbit","Bird"]

    
    override func awakeFromNib() {
        super.awakeFromNib()
  
        let collectionNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.myCollectionView.register(collectionNib, forCellWithReuseIdentifier: "CollectionViewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }

    
    func createCustomTableCell(animalNameID : Int){
        
        self.headerLabel.text = animalsNameList[animalNameID]
    }
    
    
}

extension TableViewCell : UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

        cell.createCustomCollection(firstText: "Default", secondText: "by username")
        cell.photoAssigner(animalID: self.animalIDTableCell!, photoID: indexPath.row)
        return cell
    }


}

extension TableViewCell : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 250)
    }
    
}




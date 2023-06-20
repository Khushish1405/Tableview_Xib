//
//  CVTableViewCell.swift
//  Tableview_Xib
//
//  Created by APPLE on 22/02/23.
//

import UIKit

class CVTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "CustomCellCV")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func register(){
      //  self.collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCellCV")
    }
}

extension CVTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellCV", for: indexPath) as! CustomCollectionViewCell
        
        cell.holaLabel.text = "All is Well"
        
        return cell
    }
    
}

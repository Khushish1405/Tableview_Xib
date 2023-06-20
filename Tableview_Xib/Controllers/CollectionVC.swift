//
//  CollectionVC.swift
//  Tableview_Xib
//
//  Created by APPLE on 22/02/23.
//

import UIKit

class CollectionVC: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    let collectionViewHeaderFooterReuseIdentifier = "MyHeaderFooterClass"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCellCV")
        
        
        self.collectionView.register(CollectionVC.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collectionViewHeaderFooterReuseIdentifier)

    }


}





//MARK: - DataSource and Delegate for CollectionView

extension CollectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Number of Section in CollectionView...
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    //Number of Items in CollcetionView...
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    // CollectionView Cell's Configuration
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellCV", for: indexPath) as! CustomCollectionViewCell
        
        cell.holaLabel.text = "sgdfhhgj"
        
        
        return cell
    }
    
    
    // For Setting Header and Footer of CollectionView...
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
     
        switch kind {

        case UICollectionView.elementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionViewHeaderFooterReuseIdentifier, for: indexPath)

                headerView.backgroundColor = UIColor.blue
                return headerView

        case UICollectionView.elementKindSectionFooter:
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionViewHeaderFooterReuseIdentifier, for: indexPath)

                footerView.backgroundColor = UIColor.green
                return footerView

            default:
                assert(false, "Unexpected element kind")
            }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 180.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width: 60.0, height: 30.0)
    }
    
    
}

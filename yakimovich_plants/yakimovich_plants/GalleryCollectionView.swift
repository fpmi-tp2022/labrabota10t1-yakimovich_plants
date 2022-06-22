//
//  GalleryCollectionViewViewController.swift
//  yakimovich_plants
//
//  Created by Depravo on 22.06.2022.
//

import UIKit



class GalleryCollectionView:   UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var cells = [PlantModel]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as! GalleryCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        cell.nameLabel.text = cells[indexPath.row].plantName
        return cell
        
    }
    func collectionView(_ collectionView : UICollectionView, layout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 400, height: 100)
    }
     
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("hello")
        myPlants.insert(cells[indexPath.row].plantName)
        NotificationCenter.default.post(name: NSNotification.Name("loadNew"), object: nil)
      
   }
   
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 5
        contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 5)

    }
    
    func set(cells: [PlantModel]){
        self.cells = cells
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

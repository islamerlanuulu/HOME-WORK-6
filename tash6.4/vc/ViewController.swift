//
//  ViewController.swift
//  tash6.4
//
//  Created by Islam Erlan Uulu on 2/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewforTab: UIView!
    
    @IBOutlet weak var delivery: UIView!
    
    
    @IBOutlet weak var milk: UIView!
    
    
    @IBOutlet weak var bell: UIView!
    
    
    @IBOutlet weak var car: UIView!
    
    
    @IBOutlet weak var CV1: UICollectionView!
    @IBOutlet weak var sale: UIView!
    
    @IBOutlet weak var uiviewpaul: UIView!
    
    var menu:Menu = Menu()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 30.05)
        //        layout.minimumLineSpacing = 1
        //        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .horizontal
        //        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = true
        cv.showsHorizontalScrollIndicator = false
        return cv
        
    }()
    
    private var data: [Product] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getShadow()
        updateFoodCollections()
        
        ApiManager.shared.getRequest { result in
                    switch result {
                    case .success(let data):
                        DispatchQueue.main.async {
                            self.data = data.products
                            self.CV1.reloadData()
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        
        
    }
    
  
    
    private func updateFoodCollections() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 236)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 21
        layout.sectionInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
        layout.scrollDirection = .horizontal
        CV1.collectionViewLayout = layout
        CV1.backgroundColor = .clear
        CV1.showsHorizontalScrollIndicator = false
        CV1.delegate = self
        CV1.dataSource = self
        CV1.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func  getShadow(){
        
        viewforTab.layer.cornerRadius = viewforTab.frame.size.height / 2
        viewforTab.clipsToBounds = true
        
        milk.layer.shadowColor = UIColor.black.cgColor
        milk.layer.shadowOpacity = 0.5
        milk.layer.shadowOffset = CGSize(width: 4, height: 1)
        milk.layer.shadowRadius = 4
        
        
        delivery.layer.shadowColor = UIColor.black.cgColor
        delivery.layer.shadowOpacity = 0.5
        delivery.layer.shadowOffset = CGSize(width: 4, height: 1)
        delivery.layer.shadowRadius = 4
        
        bell.layer.shadowColor = UIColor.black.cgColor
        bell.layer.shadowOpacity = 0.5
        bell.layer.shadowOffset = CGSize(width: 4, height: 1)
        bell.layer.shadowRadius = 4
        
        car.layer.shadowColor = UIColor.black.cgColor
        car.layer.shadowOpacity = 0.5
        car.layer.shadowOffset = CGSize(width: 4, height: 1)
        car.layer.shadowRadius = 4
        
        sale.layer.shadowColor = UIColor.black.cgColor
        sale.layer.shadowOpacity = 0.5
        sale.layer.shadowOffset = CGSize(width: 4, height: 1)
        sale.layer.shadowRadius = 4
        
        
        uiviewpaul.layer.shadowColor = UIColor.black.cgColor
        uiviewpaul.layer.shadowOpacity = 2
        uiviewpaul.layer.shadowOffset = CGSize(width: 6, height: 7)
        uiviewpaul.layer.shadowRadius = 6
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.updateData(food: data[indexPath.row])
        return cell
    }
}

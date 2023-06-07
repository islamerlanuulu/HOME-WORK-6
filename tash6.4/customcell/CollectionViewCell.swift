//
//  CollectionViewCell.swift
//  tash6.4
//
//  Created by Islam Erlan Uulu on 5/6/23.
//

import UIKit
import SnapKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    private let bgView: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 30
            
            return view
        }()
        
        private var image: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "romaFoodImage")
            view.contentMode = .scaleToFill
            view.layer.cornerRadius = 50
            view.layer.masksToBounds = true
            view.clipsToBounds = true
            return view
        }()
        
        private var nameLabel: UILabel = {
            let view = UILabel()
            view.text = "Tony Roma’s"
            view.numberOfLines = 0
            view.font = UIFont(name: "Poppins-Bold", size: 14)
            return view
        }()
        
        private var typeLabel: UILabel = {
            let view = UILabel()
            view.text = "Ribs & Steaks"
            view.numberOfLines = 0
            view.font = UIFont(name: "Poppins-Light", size: 10)
            return view
        }()
        private var detailLabel: UILabel = {
            let view = UILabel()
            view.text = "Delivery: FREE • Minimum: $20"
            view.font = UIFont(name: "Poppins-Light", size: 10)
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(bgView)
            bgView.addSubview(image)
            bgView.addSubview(nameLabel)
            bgView.addSubview(typeLabel)
            bgView.addSubview(detailLabel)
            addConstraint()
            //contentView.backgroundColor = .black
        }
        
        private func addConstraint() {
            bgView.snp.makeConstraints { make in
                make.leading.trailing.bottom.equalToSuperview()
                make.height.equalTo(180)
            }
            
            image.snp.makeConstraints { make in
                make.height.width.equalTo(150)
                make.top.equalToSuperview().offset(-55)
                make.centerX.equalToSuperview()
            }
            
            nameLabel.snp.makeConstraints { make in
                make.top.equalTo(image.snp.bottom).offset(-5)
                make.leading.trailing.equalToSuperview().inset(17)
            }
            typeLabel.snp.makeConstraints { make in
                make.top.equalTo(nameLabel.snp.bottom)
                make.leading.trailing.equalToSuperview().inset(17)
            }
            detailLabel.snp.makeConstraints { make in
                make.top.equalTo(typeLabel.snp.bottom)
                make.leading.equalToSuperview().offset(17)
            }
            
        }
        
        func updateData(food: Product) {
            image.kf.setImage(with: URL(string: food.thumbnail!))
            nameLabel.text = food.title
            typeLabel.text = food.brand
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
}

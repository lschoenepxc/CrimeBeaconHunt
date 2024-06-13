//
//  TileCollectionViewCell.swift
//  CrimeBeaconHunt
//
//  Created by Laura Schöne on 13.06.24.
//

import UIKit

class TileCollectionViewCell: UICollectionViewCell {

    static let identifier = "TileCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue  
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}

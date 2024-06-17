//
//  IndizTableViewCell.swift
//  CrimeBeaconHunt
//
//  Created by Laura Schöne on 17.06.24.
//

import UIKit

class IndizTableViewCell: UITableViewCell {
    
    // MARK: UI Properties
    
    @IBOutlet weak var indizText: UILabel!
    
    @IBOutlet weak var checkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

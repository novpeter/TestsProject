//
//  SearchResultCell.swift
//  UnitTestsProject
//
//  Created by Петр on 30/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    /// Avatar
    @IBOutlet weak var avatarImageView: UIImageView!
    
    /// Name - title
    @IBOutlet weak var nameLabel: UILabel!
    
    /// Author
    @IBOutlet weak var authorLabel: UILabel!
    
    /// Kind
    @IBOutlet weak var kindLabel: UILabel!
    
    /// Description
    @IBOutlet weak var descriptionLabel: UILabel!
    
    /// Price
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(result: ResponseResult) {
        
        nameLabel.text = result.trackName
        authorLabel.text = result.artistName
        descriptionLabel.text = result.shortDescription
        kindLabel.text = result.kind
        
        if let price = result.trackPrice, let currency = result.currency {
             priceLabel.text = "\(price) \(currency)"
        }
        else {
            priceLabel.text = ""
        }
    }

}

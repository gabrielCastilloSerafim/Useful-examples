//
//  MyTableViewCell.swift
//  Skeleton View Example
//
//  Created by Gabriel Castillo Serafim on 12/12/22.
//

import UIKit
import SkeletonView

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        isSkeletonable = true
        
        profilePicture.isSkeletonable = true
        profilePicture.skeletonCornerRadius = Float(profilePicture.frame.width / 2)
        nameLabel.isSkeletonable = true
        nameLabel.linesCornerRadius = 8
        emailLabel.isSkeletonable = true
        emailLabel.linesCornerRadius = 8
        
    }

    

}

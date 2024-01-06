//
//  StoryCell.swift
//  instagram
//
//  Created by Heba Omar94 on 14/12/2023.
//

import UIKit
import IBAnimatable


class StoryCell: UICollectionViewCell {

    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileImageView: AnimatableImageView!
    
    @IBOutlet weak var plusView: UIView!

    
    func configure (with entity: Story) {
        //load imageviewurl
        if entity.isMyStory {
            profileNameLabel.text = "your story"
            plusView.isHidden = false

        }else {
            profileNameLabel.text = entity.username
            plusView.isHidden = true

        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

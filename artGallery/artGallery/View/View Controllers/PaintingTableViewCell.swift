//
//  PaintingTableViewCell.swift
//  artGallery
//
//  Created by Michael Flowers on 1/14/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

//implement protocol
protocol PaintingTableViewCellDelegate: class {
    func tappedLikeButton(on cell: PaintingTableViewCell)
}

class PaintingTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var portratiView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    var painting: Painting? { //this is the painting that was selected in the cell for at row on the table view
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Properties
    weak var delegate: PaintingTableViewCellDelegate?
    
    //MARK: - IBActions
    @IBAction func toggledAppreciation(_ sender: Any) {
        delegate?.tappedLikeButton(on: self)
        print("button pressed")
    }
    
    func updateViews(){
        //grab the painting that was pulled from the cell for at row on the table view
        guard let painting = painting else { return }
        //condition statement for the painting isLiked property for the button title
        let likeButtonTitle = painting.isLiked ? "Unlike" : "Like"
        likeButton.setTitle(likeButtonTitle, for: .normal)
        
        portratiView.image = painting.image //set the image view
    }
    

}

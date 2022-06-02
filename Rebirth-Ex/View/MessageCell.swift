//
//  MessageCell.swift
//  Rebirth-Ex
//
//  Created by Bahadır Kılınç on 1.06.2022.
//

import UIKit

class MessageCell: UITableViewCell {

    
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

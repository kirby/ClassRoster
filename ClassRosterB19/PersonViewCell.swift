//
//  PersonViewCell.swift
//  ClassRosterB19
//
//  Created by Kirby Shabaga on 7/22/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit

class PersonViewCell: UITableViewCell {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}

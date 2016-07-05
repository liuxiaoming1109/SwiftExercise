//
//  AutoLayoutTableTableViewCell.swift
//  SwiftExercise
//
//  Created by liuxm on 15/10/30.
//  Copyright © 2015年 evan. All rights reserved.
//

import UIKit

class AutoLayoutTableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, assd:String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

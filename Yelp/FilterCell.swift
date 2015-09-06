//
//  FilterCell.swift
//  Yelp
//
//  Created by Shawn Zhu on 9/5/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol FilterCellDelegate {
    optional func filterCell(filterCell: FilterCell, didChangeValue value: Bool)
}

class FilterCell: UITableViewCell {

    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var filterSwitch: UISwitch!
    
    weak var delegate : FilterCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        filterSwitch.addTarget(self, action: "onFilterValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func onFilterValueChanged() {
        delegate?.filterCell?(self, didChangeValue: filterSwitch.on)
    }

}

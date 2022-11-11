//
//  CalenderTableViewCell.swift
//  DogScheduler
//
//  Created by Samuel Tse on 11/10/22.
//

import UIKit

class CalenderTableViewCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(time: Int, color: Int) {
        timeLabel.text = String(time)
        
        switch color {
        case 1:
            self.contentView.backgroundColor = .blue
        case 2:
            self.contentView.backgroundColor = .green
        case 3:
            self.contentView.backgroundColor = .red
        case 4:
            self.contentView.backgroundColor = .purple
        default:
            break;
        }
    }
    
    override func prepareForReuse() {
        self.contentView.backgroundColor = .white
    }
}

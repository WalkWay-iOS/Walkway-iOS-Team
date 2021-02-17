//
//  LocationInfoAllowTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/06.
//

import UIKit

class LocationInfoAllowTVC: UITableViewCell {
    static let identifier = "LocationInfoAllowTVC"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var allowLabel: UILabel!
    @IBOutlet var disallowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setText()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setText() {
        titleLabel.text = "위치 정보 활용 여부"
        allowLabel.text = "동의"
        disallowLabel.text = "비동의"
    }
}

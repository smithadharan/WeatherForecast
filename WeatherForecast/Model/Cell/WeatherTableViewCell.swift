//
//  WeatherTableViewCell.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setData(model: WeatherTableCellModel) {
        lblTitle.text = model.title
        lblSubTitle.text = model.description
        imgView.loadImageWith(urlString: model.imageUrl)
    }
}

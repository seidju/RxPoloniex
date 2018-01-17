//
//  QuotationTableViewCell.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import UIKit

class QuotationTableViewCell: UITableViewCell {
  
  private var nameLabel: UILabel!
  private var lastLabel: UILabel!
  private var highestBidLabel: UILabel!
  private var percentChangeLabel: UILabel!
  
  
  //last,  highestBid  и  percentChange.
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier )
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.commonInit()
  }
  

 
  private func commonInit() {
    nameLabel = UILabel()
    nameLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(nameLabel)
    
    lastLabel = UILabel()
    lastLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(lastLabel)
    
    highestBidLabel = UILabel()
    highestBidLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(highestBidLabel)
    
    percentChangeLabel = UILabel()
    percentChangeLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(percentChangeLabel)
    
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
      nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0)

    ])
    
    NSLayoutConstraint.activate([
      lastLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
      lastLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4.0),
      lastLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
    ])
    
   
    NSLayoutConstraint.activate([
      highestBidLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
      highestBidLabel.topAnchor.constraint(equalTo: lastLabel.bottomAnchor, constant: 4.0),
      highestBidLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
    ])
  
    NSLayoutConstraint.activate([
      percentChangeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
      percentChangeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
      percentChangeLabel.topAnchor.constraint(equalTo: highestBidLabel.bottomAnchor, constant: 4.0),
      percentChangeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0)
    ])
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    nameLabel.text = nil
    percentChangeLabel.text = nil
    lastLabel.text = nil
    highestBidLabel.text = nil
    //self.image = nil
  }
  
  func configure(quotation: Quotation) {
    nameLabel.text = quotation.name
    percentChangeLabel.text = "Percent change: \(quotation.percentChange)"
    lastLabel.text = "Last: \(quotation.last)"
    highestBidLabel.text = "Highest Bid: \(quotation.highestBid)"
  }
  
 
}

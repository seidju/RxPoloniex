//
//  Quotation.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import RxDataSources

struct Quotation {
  let id: Int
  let name: String
  let last: String
  let highestBid: String
  let percentChange: String
}

extension Quotation: IdentifiableType, Equatable {
  static func ==(lhs: Quotation, rhs: Quotation) -> Bool {
    return lhs.id == rhs.id && lhs.name == rhs.name
  }
  
  var identity: String {
    return "\(id)"
  }
  

}
typealias QuotationSection = AnimatableSectionModel<String, Quotation>

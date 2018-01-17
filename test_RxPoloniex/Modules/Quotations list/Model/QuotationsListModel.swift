//
//  QuotationsListModel.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import Alamofire
import SwiftyJSON
protocol QuotationsListModelProtocol {
  func startTicker()
  func startTicker(completion: (([Quotation]) -> ())?)
  func stopTicker()
}

class QuotationsListModel: QuotationsListModelProtocol {
  
  private var quotationsTimer: Timer?
  private var updateTicker: (([Quotation]) -> ())?
  
  func startTicker(completion: (([Quotation]) -> ())?) {
    guard quotationsTimer == nil else { return }
    returnTicker(completion: completion) 
    quotationsTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerTick(timer:)), userInfo: nil, repeats: true)
    updateTicker = { quotations in
      completion?(quotations)
    }
  }
  
  func startTicker() {
    startTicker(completion: updateTicker)
  }
  
  func stopTicker() {
    quotationsTimer?.invalidate()
    quotationsTimer = nil
    updateTicker = nil
  }
  
  @objc private func timerTick(timer: Timer) {
    returnTicker(completion: updateTicker)
  }
  
  private func returnTicker(completion: (([Quotation]) -> ())?) {
    print("§§§ Fetch tickers")
    Alamofire.request("https://poloniex.com/public?command=returnTicker").responseJSON { response in
      switch response.result {
        case .success(let value):
          guard let jsons = JSON(value).dictionary else { return }
          var quotations = [Quotation]()
          for name in jsons.keys {
            guard let dict = jsons[name]?.dictionary else { continue }
            guard let id = dict["id"]?.int else { continue }
            guard let percentChange = dict["percentChange"]?.string else { continue }
            guard let highestBid = dict["highestBid"]?.string else { continue }
            guard let last = dict["last"]?.string else { continue }
            let newQuot = Quotation(id: id, name: name, last: last, highestBid: highestBid, percentChange: percentChange)
            quotations.append(newQuot)
          }
          completion?(quotations)
        case .failure(let error):
          print(error)
      }
    }
  }
}

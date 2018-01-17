//
//  QuotationsViewModel.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import RxSwift

protocol QuotationsListViewModelProtocol {
  func populateQuotations() -> Observable<[QuotationSection]>
  func stopTickerUpdate() 
  func startTickerUpdate() 

}

class QuotationsListViewModel: QuotationsListViewModelProtocol {
  
  private let quotationsListModel: QuotationsListModelProtocol
  init(quotationsListModel: QuotationsListModelProtocol) {
    self.quotationsListModel = quotationsListModel
  }
  
  func populateQuotations() -> Observable<[QuotationSection]> {
    return Observable.create { [weak self] observable -> Disposable in
      self?.quotationsListModel.startTicker { quotations in
        let quotationsSection = QuotationSection(model: "", items: quotations)
        observable.onNext([quotationsSection])
      }
      return Disposables.create()
    }
  }
  
  func startTickerUpdate() {
    quotationsListModel.startTicker()
  }
  
  func stopTickerUpdate() {
    quotationsListModel.stopTicker()
  }
  
}

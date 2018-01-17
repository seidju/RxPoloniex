//
//  QuotationsViewModel.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import RxSwift

protocol QuotationsViewModelProtocol {
  func populateQuotations() -> Observable<[QuotationSection]>
}

class QuotationsViewModel: QuotationsViewModelProtocol {
  
  var quotationsListModel: QuotationsListModelProtocol!
  var reverse: Bool = true
  func populateQuotations() -> Observable<[QuotationSection]> {
    return Observable.create { [weak self] observable -> Disposable in
      self?.quotationsLitModel.startTicker { quotations in
        let quotationsSection = QuotationSection(model: "", items: quotations)
        observable.onNext([quotationsSection])
      }
      return Disposables.create()
    }
  }
  
  func stopTickerUpdate() {
    quotationsListModel.stopTicker()
  }
  
}

//
//  QuotationsViewController.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class QuotationsListViewController: UIViewController, QuotationsView {
  

  private var tableView: UITableView!
  private var dataSource: RxTableViewSectionedAnimatedDataSource<QuotationSection>!
  private let reuseIdentifier = "QuotationTableViewCell"
  let viewModel: QuotationsListViewModelProtocol
  private let disposeBag = DisposeBag()
  
  init(viewModel: QuotationsListViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    commonInit()
    setupRx()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    viewModel.startTickerUpdate()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    stopTickerUpdate()
  }
  
  private func commonInit() {
    setupTableView()
  }
  
  
  private func stopTickerUpdate() {
    viewModel.stopTickerUpdate()
  }
  private func setupRx() {
    let dataSource = RxTableViewSectionedAnimatedDataSource<QuotationSection>(
      configureCell: { [weak self] ds, tv, ip, item in
        guard let sSelf = self else { return UITableViewCell() }
        guard let cell = tv.dequeueReusableCell(withIdentifier: sSelf.reuseIdentifier) as? QuotationTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configure(quotation: item)
        return cell
    })
  
    viewModel.populateQuotations()
      .bind(to: tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
    
    self.dataSource = dataSource
    tableView.rx.setDelegate(self).disposed(by: disposeBag)
  }
  
  
  private func setupTableView() {
    title = "Quotations"
    tableView = UITableView(frame: CGRect.zero)
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(QuotationTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    tableView.setContentInsetAdjustment(enabled: !SharedSettings.shared.firstStart, in: self)
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
    ])
    let footerView = UIView()
    footerView.backgroundColor = .white
    tableView.tableFooterView = footerView
  }
  
}
extension QuotationsListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120.0
  }
}



//
//  ViewController.swift
//  Tenki
//
//  Created by Spiros Gerokostas on 10/03/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import RxSwift
import RxCocoa

class WeatherViewController: NSViewController {

    let disposeBag: DisposeBag = DisposeBag()
    var viewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("WeatherViewController")
        if let viewModel = self.viewModel { self.setupBindings(forViewModel: viewModel) }
    }

    override var representedObject: Any? {
        didSet {
        }
    }
    
    fileprivate func setupBindings(forViewModel viewModel: WeatherViewModel) {
        viewModel.forecast
            .subscribe(onNext: { [weak self] (forecast) in
                print("!!!!!!!!!!!!!!")
                print(forecast.icon)
            }).disposed(by: self.disposeBag)
    }
}


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

    @IBOutlet weak private var dateTextField: NSTextField!
    @IBOutlet weak private var temperatureTextField: NSTextField!
    
    let disposeBag: DisposeBag = DisposeBag()
    var viewModel: WeatherViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewModel = self.viewModel { self.setupBindings(forViewModel: viewModel) }
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        self.view.layer?.backgroundColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    fileprivate func setupBindings(forViewModel viewModel: WeatherViewModel) {
        viewModel.forecast
            .subscribe(onNext: { [weak self] (forecast) in
                print(forecast.icon)
                self?.dateTextField.stringValue = forecast.dateString
                self?.temperatureTextField.stringValue = "\(forecast.celsius)°"
            }).disposed(by: self.disposeBag)
    }
}

//
//  AppDelegateViewModel.swift
//  Tenki
//
//  Created by Spiros Gerokostas on 13/03/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import RxSwift
import RxCocoa

final class WeatherViewModel: NSObject {

    let forecast: Observable<Forecast>

    init(withLatitude latitude: Double, longitude: Double) {

        self.forecast = Observable
            .just(())
            .flatMapLatest { _ in
                return DarkSkyAPI.instance.forecast(latitude, longitude: longitude)
            }

        super.init()
    }
}

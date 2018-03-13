//
//  DarkSkyAPI.swift
//  Tenki
//
//  Created by Spiros Gerokostas on 13/03/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import Alamofire
import RxSwift
import SwiftyJSON

public final class DarkSkyAPI {
    static let instance: DarkSkyAPI = DarkSkyAPI()
    
    fileprivate let disposeBag: DisposeBag = DisposeBag()
    
    fileprivate init() {}
    
    public func start(_ latitude: Double, longitude: Double) {
        Observable<Int>
            .timer(0, period:60, scheduler: MainScheduler.instance)
            .flatMap { (_) -> Observable<Forecast> in
                return self.forecast(latitude, longitude: longitude)
            }.subscribe(onNext: { forecast in
                print(forecast.latitude)
            }).disposed(by: self.disposeBag)
    }
    
    fileprivate func forecast(_ latitude: Double, longitude: Double) -> Observable<Forecast> {
        return Observable.create { (observer) -> Disposable in
            let request = Alamofire
                .request(Router.forecast(lat: latitude, lon: longitude))
                .validate()
                .responseJSON { (response) in
                        switch response.result {
                        case .success(let data):
                            print(data)
                            let forecast = Forecast(json: JSON(data))
                            observer.onNext(forecast)
                            observer.onCompleted()
                        case .failure(let error):
                            print(error)
                            observer.onError(error)
                        }
                    }
            return Disposables.create { request.cancel() }
        }
    }
}

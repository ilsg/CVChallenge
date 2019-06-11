//
//  ExperienceDetailInteractor.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation

class ExperienceDetailInteractor: ExperienceDetailInteractorProtocol {
    //MARK: Properties
    weak var presenter: ExperienceDetailPresenterProtocol?
    lazy var serviceClient: ImageServiceProtocol = ImageService()
    
    /// Downloads the image for the given url
    ///
    /// - Parameter url: String of the url hosted image
    func downloadImage(with url: String){
        serviceClient.downloadImageWith(url: url) { [unowned self] result in
            switch result {
            case .success(let data):
                self.presenter?.downloadImageSucceded(with: data)
            case .error(let error):
                self.presenter?.downloadImageError(with: error)
            }
        }
    }
}

//
//  ExperienceDetailProtocols.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation

protocol ExperienceDetailViewProtocol: class {
    var presenter: ExperienceDetailPresenterProtocol? {get set}
    func refreshView()
    func showError(with message: String?, then callback: (() -> Void)?) 
}

protocol ExperienceDetailRouterProtocol {
    static func createModule(with model: Experience) -> ExperienceDetailView
}

protocol ExperienceDetailPresenterProtocol: class  {
    var rowsCount: Int {get}
    var view: ExperienceDetailViewProtocol? {get set}
    func getCell(at index: Int)-> DrawableCellProtocol?
    func loadDetail()
    func downloadImageSucceded(with data: Data)
    func downloadImageError(with error: ServiceError)
}

protocol ExperienceDetailInteractorProtocol: class {
    var presenter: ExperienceDetailPresenterProtocol? {get set}
    func downloadImage(with url: String)
}

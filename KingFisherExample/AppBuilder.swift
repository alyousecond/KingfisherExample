//
//  Builder.swift
//  KingFisherExample
//
//  Created by Yuji Sugaya on 2018/06/13.
//  Copyright © 2018年 Yuji Sugaya. All rights reserved.
//

import UIKit

class AppBuilder {
    public static let shared = AppBuilder()
    func buildBlurViewController() -> BlurViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: type(of: BlurViewController()))) as! BlurViewController
        return viewController
    }
}

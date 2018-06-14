//
//  CategoryViewController.swift
//  KingFisherExample
//
//  Created by Yuji Sugaya on 2018/06/13.
//  Copyright © 2018年 Yuji Sugaya. All rights reserved.
//

import UIKit

class ImageProcessorsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    enum ImageProcessor: CustomStringConvertible {
        case blur
        var description: String {
            switch self {
            case .blur: return "BlurImage Processor"
            }
        }
    }

    private let processors = [
        ImageProcessor.blur
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
}

extension ImageProcessorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AppBuilder.shared.buildBlurViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ImageProcessorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return processors.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = processors[indexPath.row].description
        return cell
    }
}

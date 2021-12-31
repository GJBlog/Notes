//
//  ViewController.swift
//  SwiftAdvancedErrorDemo
//
//  Created by Guo on 2021/12/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func test1() {
        let result = contents(ofFile: "http://..")
        switch result {
        case let .success(v1):
            print(v1)
            break
        case .failure(let error):
            print(error)
            break
        }
    }
    
    private func checkFile(filename: String) throws -> Bool {
        return false
    }

    private func checkallFiles(filenames: [String]) throws -> Bool {
        for filename in filenames {
            guard try checkFile(filename: filename) else { return false }
        }
        return true
    }
    
    private func contents(ofFile filename: String) -> Result<String, FileError> {
        return .failure(.noPermission)
    }

    private func parse(text: String) -> Result<String, ParseError> {
        return .success(text)
    }
    
    private func parse(text: String) -> Result<[String], ParseError> {
        .success(["123"])
    }
}

enum FileError: Error {
    case fileDoesNotExist
    case noPermission
}

enum ParseError: Error {
    case wrongError
    case warning(line: Int, message: String)
}

enum Result<A, ErrorType: Error> {
    case failure(ErrorType)
    case success(A)
}

extension Sequence {
    func all(matching predicate: (Element) -> Bool) -> Bool {
        for element in self {
            guard predicate(element) else { return false }
        }
        return true
    }
}

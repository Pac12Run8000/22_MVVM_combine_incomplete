//
//  ViewModel.swift
//  MVVMAPICallCombine
//
//  Created by Norbert Grover on 11/8/22.
//

import Foundation
import Combine


final class ViewModel {
    
    @Published var data:Data?
    @Published var acronymObject:AcronymObject?
    @Published var list:[String] = []
    
    var cancellables:Set<AnyCancellable> = []
    
    public func populateTableViewWithList(input:String?) {
        var localList = [String]()
        guard let input = input, let url = URLComponentConstants.createURLWithComponents(queryParameters: [URLQueryName.sf.rawValue:input])?.url else {
            print(ResponseError.invalidUrl.description)
            return
        }
        
        let promise = NetworkingService.shared.fetchAPIResponse(url: url)
        let acronym = promise.decode(type: AcronymObject.self, decoder: JSONDecoder())
        acronym.sink { (completion) in
            if case let .failure(error) = completion {
                print("ViewModel Error: \(error.localizedDescription)")
            }
        } receiveValue: { [weak self] acronym in
            guard let strongself = self else {return}
            strongself.acronymObject = acronym
            for item in acronym[0].lfs {
                localList.append(item.lf)
            }
            strongself.list = localList
            print("localList: \(localList)")
        }.store(in: &cancellables)

    }
    
}

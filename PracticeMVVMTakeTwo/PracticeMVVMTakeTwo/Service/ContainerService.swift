
//
//  ContainerService.swift
//  PracticeMVVMTakeTwo
//
//  Created by Christopher Pung on 10/19/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import Foundation

// We are going to make an API request to parse JSON data from the API
// Final class will not let another class inherit

final class ContainerService{
    // static shared will allow everyone to use this to access the class
    static let shared = ContainerService()
    // we have private init in order to prevent anyone from initiating another instance of the object
    private init(){
        
    }
    // function getContainer will download information from the API and convert that information into an array of type: Container
    func getContainer(completion: @escaping ([Container]) -> Void){
        guard let url = ContainerAPI().getURL else{
            // if we don't get the URL, we return an empty array.
            completion([])
            return
        }
        do{
            let data = try Data(contentsOf: url)
            // We download data from API and save it as an array of dictionaries
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
            var containers = [Container]()
            for dict in jsonResponse{
                if let item = Container(dict: dict){
                    containers.append(item)
                }
            }
            print("Successfully downloaded data!")
            completion(containers)
        }
        catch{
            print("Couldn't download JSON data!")
            completion([])
            return
        }
    }
}


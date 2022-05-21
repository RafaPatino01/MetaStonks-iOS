//
//  api.swift
//  DemoCola
//
//  Created by Rafael Patino on 05/05/22.
//

import Foundation
import CryptoKit

extension Digest {
    var bytes: [UInt8] { Array(makeIterator()) }
    var data: Data { Data(bytes) }

    var hexStr: String {
        bytes.map { String(format: "%02X", $0) }.joined()
    }
}

struct DataStruct: Codable, Identifiable {
    var id: Int
    var award: Float
    var metascore: Float
    var ocurrences: Int
    var score: Float
    var title_sentiment: Float
    var token: String
    var upvote_ratio: Float
}

struct NFT: Codable, Identifiable{
    var id: Int
    var rarity: Float
    var url: String
}

class Api : ObservableObject{
    @Published var results = [DataStruct]()
    
    func loadData(completion:@escaping ([DataStruct]) -> ()) {
        guard let url = URL(string: "http://146.190.1.241/crypto_data") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let results = try! JSONDecoder().decode([DataStruct].self, from: data!)
            print(results)
            DispatchQueue.main.async {
                completion(results)
            }
        }.resume()
    }
    
    func login(pUser: String, pPass: String, completion:@escaping ([String]) -> ()) {
        
        guard let data = pPass.data(using: .utf8) else { return }
        let digest = SHA256.hash(data: data)

        guard let url = URL(string: "http://146.190.1.241/login/"+pUser+"/"+digest.hexStr.lowercased()+"/") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let result = try! JSONDecoder().decode([String].self, from: data!)
            print(result)
            DispatchQueue.main.async {
                completion(result)
            }
        }.resume()
    }
    
    func register(pUser: String, pPass: String, pEmail: String, completion:@escaping ([String]) -> ()) {
        
        guard let data = pPass.data(using: .utf8) else { return }
        let digest = SHA256.hash(data: data)

        guard let url = URL(string: "http://146.190.1.241/register/"+pEmail+"/"+pUser+"/"+digest.hexStr.lowercased()+"/") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let result = try! JSONDecoder().decode([String].self, from: data!)
            print(result)
            DispatchQueue.main.async {
                completion(result)
            }
        }.resume()
    }
    
    func searchNFT(pAddress: String, completion:@escaping ([NFT]) -> ()) {
        guard let url = URL(string: "http://146.190.1.241/rarityIOS/" + pAddress) else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let results = try! JSONDecoder().decode([NFT].self, from: data!)
            print(results)
            DispatchQueue.main.async {
                completion(results)
            }
        }.resume()
    }
    
}

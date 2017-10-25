//
//  Configuration.swift
//  SKY
//
//  Created by 开心粮票 on 2017/10/25.
//  Copyright © 2017年 eeee. All rights reserved.
//

import UIKit

struct API {
    static let key = "af7aa5cfc14d558e720caff21791f148"
    static let baseURL = URL(string: "https://api.darksky.net/forecast/")!
    static let authenticatedURL = baseURL.appendingPathComponent(key)
}

class Configuration: NSObject {
    
}






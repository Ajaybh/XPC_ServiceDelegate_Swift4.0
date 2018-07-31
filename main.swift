//
//  main.swift
//
//  Created by Ajay kumar on 7/30/18.
//

import Foundation

protocol ServiceProtocol {
    
}

class ServiceComm : ServiceProtocol {
    
}

class ServiceDelegate : NSObject, NSXPCListenerDelegate {
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        newConnection.exportedInterface = NSXPCInterface.init(with: ServiceProtocol.self)
        let exportedObject = ServiceComm.init()
        newConnection.exportedObject = exportedObject
        newConnection.resume()
        return true
    }
}


// Create the listener and resume it:
//
let delegate = ServiceDelegate()
let listener = NSXPCListener.service()
listener.delegate = delegate;
listener.resume()

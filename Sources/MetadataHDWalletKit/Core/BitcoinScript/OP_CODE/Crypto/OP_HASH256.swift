//
//  OP_HASH256.swift
//  BitcoinKit
//
//  Created by Shun Usami on 2018/08/09.
//  Copyright © 2018 BitcoinKit developers. All rights reserved.
//

import Foundation

// The input is hashed two times with SHA-256.
public struct OpHash256: OpCodeProtocol {
    public var value: UInt8 { 0xaa }
    public var name: String { "OP_HASH256" }

    // input : in
    // output : hash
    public func mainProcess(_ context: ScriptExecutionContext) throws {
        try context.assertStackHeightGreaterThanOrEqual(1)

        let data: Data = context.stack.removeLast()
        let hash: Data = data.doubleSHA256
        context.stack.append(hash)
    }
}

//
//  OP_IF.swift
//  BitcoinKit
//
//  Created by Shun Usami on 2018/08/08.
//  Copyright © 2018 BitcoinKit developers. All rights reserved.
//

import Foundation

public struct OpIf: OpCodeProtocol {
    public var value: UInt8 { 0x63 }
    public var name: String { "OP_IF" }

    public func mainProcess(_ context: ScriptExecutionContext) throws {
        var value: Bool = false
        if context.shouldExecute {
            try context.assertStackHeightGreaterThanOrEqual(1)
            value = context.bool(at: -1)
            context.stack.removeLast()
        }
        context.conditionStack.append(value)
    }
}

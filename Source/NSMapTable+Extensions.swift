//
//  NSMapTable+Extensions.swift
//  SwiftUtilities
//
//  Created by Jonathan Wight on 12/9/15.
//
//  Copyright © 2016, Jonathan Wight
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


import Foundation

extension NSMapTable: SequenceType {

    public typealias Generator = NSMapTableGenerator

    public func generate() -> NSMapTableGenerator {
        return NSMapTableGenerator(mapTable: self)
    }
}

public struct NSMapTableGenerator: GeneratorType {
    public typealias Element =  (AnyObject, AnyObject)

    let keyEnumerator: NSEnumerator
    let objectEnumerator: NSEnumerator

    init(mapTable: NSMapTable) {
        keyEnumerator = mapTable.keyEnumerator()
        objectEnumerator = mapTable.objectEnumerator()!
    }

    public mutating func next() -> Element? {
        guard let nextKey = keyEnumerator.nextObject(), let nextObject = objectEnumerator.nextObject() else {
            return nil
        }
        return (nextKey, nextObject)
    }
}

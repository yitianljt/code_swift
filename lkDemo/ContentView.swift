//
//  ContentView.swift
//  lkDemo
//
//  Created by jintao on 2025/11/15.
//

import SwiftUI


import UIKit

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var sumNode: ListNode? = nil
        var current: ListNode? = nil
        var carry = 0
        var node1 = l1
        var node2 = l2
        
        while(node1 != nil || node2 != nil){
            let num1 = node1?.val ?? 0
            let num2 = node2?.val ?? 0
            var sum = num1 + num2 + carry
            if sum >= 10 {
                carry = 1
                sum = sum % 10
            } else {
                carry = 0
            }
            
            let newNode = ListNode(sum)
            if current == nil {
                sumNode = newNode
                current = sumNode
            } else {
                current!.next = newNode
                current = current!.next
            }
            
            node1 = node1?.next
            node2 = node2?.next
        }
        
        if carry > 0 {
            let newNode = ListNode(carry)
            current!.next = newNode
        }
        
        return sumNode
    }
}


struct ContentView: View {
    
    var body: some View {
        VStack {
            Text(testText())
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world66889789!")
        }
        .padding()
    }
    
    func testText() -> String {
//        let l1 = ListNode(2, ListNode(4, ListNode(3)))
//        let l2 = ListNode(5, ListNode(6, ListNode(4)))
//        let solution = Solution()
//        var result = solution.addTwoNumbers(l1, l2)
//        print(result ?? 0)
//        
//        while result != nil {
//            print(result!.val)
//            result = result!.next
//        }
        
        let l1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
        let l2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))
        let solution = Solution()
        var result = solution.addTwoNumbers(l1, l2)
        print(result ?? 0)
        while result != nil {
            print(result!.val)
            result = result!.next
        }
        
        return "test"
    }
}

#Preview {
    ContentView()
}

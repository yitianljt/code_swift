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
       var sumNode: ListNode?
       var currentNode: ListNode?
       var carry = 0
       var num1 = l1
       var num2 = l2
       

       while num1 != nil || num1 != nil || carry != 0 {
           var sum = carry + (num1?.val ?? 0)  + (num2?.val ?? 0)
           if sum >= 10 {
               carry = 1
               sum = sum % 10
           } else {
               carry = 0
           }

           if sumNode == nil {
               sumNode = ListNode(sum)
               currentNode = sumNode
           } else {
               currentNode?.next = ListNode(sum)
               currentNode = currentNode?.next
           }
           num1 = num1?.next
           num2 = num2?.next
       }
       
       return sumNode
   }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        var currentSet = Set<Character>()
        let chars = Array(s)
        var left = 0
        
        for right in 0..<chars.count {
            while currentSet.contains(chars[right]) {
                currentSet.remove(chars[left])
                left += 1
            }
            
            currentSet.insert(chars[right])
            
            maxLength = max(currentSet.count, maxLength)
        }
        
        return maxLength
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
        let solution = Solution()

        let maxLength = solution.lengthOfLongestSubstring("abcabcbb")
        print(maxLength)
        
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
        var result = solution.addTwoNumbers(l1, l2)
        print(result ?? 0)
        while result != nil {
//            print(result!.val)
            result = result!.next
        }
        
        return "test"
    }
}

#Preview {
    ContentView()
}

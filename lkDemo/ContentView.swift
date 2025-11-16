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
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count = nums1.count + nums2.count
        if count == 0 {
            return 0
        } else if (count == 1) {
            return (nums1.count == 1) ? Double(nums1.first!) : Double(nums2.first!)
        }

        var results = [Int]()
        var index1 = 0
        var index2 = 0

        for _ in 0..<(nums1.count + nums2.count) {
            if index1 >= nums1.count {
                results.append(nums2[index2])
                index2 += 1
            } else if (index2 >= nums2.count) {
                results.append(nums1[index1])
                index1 += 1
            } else {
                if (nums1[index1] < nums2[index2]) {
                    results.append(nums1[index1])
                    index1 += 1
                } else {
                    results.append(nums2[index2])
                    index2 += 1
                }
            }
        }
        
        if (results.count % 2 == 0) {
            let index = results.count/2 - 1
            return Double(results[index] + results[index + 1])/2.0
        } else {
            let index = (results.count - 1)/2
            return Double(results[index])
        }
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
        
        let result = solution.findMedianSortedArrays([100000],[100001])
        print(result)

//        let maxLength = solution.lengthOfLongestSubstring("abcabcbb")
//        print(maxLength)
        
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
        
//        let l1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
//        let l2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))
//        var result = solution.addTwoNumbers(l1, l2)
//        print(result ?? 0)
//        while result != nil {
//            print(result!.val)
//            result = result!.next
//        }
        
        return "test"
    }
}

#Preview {
    ContentView()
}

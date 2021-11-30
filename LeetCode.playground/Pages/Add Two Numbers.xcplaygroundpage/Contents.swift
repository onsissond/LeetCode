/*
 https://leetcode.com/problems/add-two-numbers/
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 */

public final class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        var headNode: ListNode?
        var tailNode: ListNode?
        var buffer = 0
        while node1 != nil && node2 != nil {
            let sum = node1!.val + node2!.val + buffer
            buffer = sum / 10
    
            let newNode = ListNode(sum % 10)
            if headNode == nil && tailNode == nil {
                headNode = newNode
                tailNode = newNode
            } else {
                tailNode?.next = newNode
                tailNode = newNode
            }
            
            node1 = node1!.next ?? (node2!.next != nil ? ListNode() : nil)
            node2 = node2!.next ?? (node1 != nil ? ListNode() : nil)
        }
        if buffer != 0 {
            let newNode = ListNode(buffer)
            tailNode?.next = newNode
        }
        return headNode
    }
}

/*
 https://leetcode.com/problems/merge-two-sorted-lists/
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.
 */

public final class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(
        _ list1: ListNode?,
        _ list2: ListNode?
    ) -> ListNode? {
        var l1 = list1
        var l2 = list2
        
        let head = ListNode()
        var tail: ListNode? = head
        
        while l1 != nil || l2 != nil {
            var node: ListNode?
            
            if (l1 != nil && l2 != nil && l1!.val < l2!.val) || l2 == nil {
                node = l1.map(\.val).map(ListNode.init)
                l1 = l1?.next
            } else if (l1 != nil && l2 != nil && l1!.val >= l2!.val) || l1 == nil {
                node = l2.map(\.val).map(ListNode.init)
                l2 = l2?.next
            }

            tail?.next = node
            tail = node
        }
        
        return head.next
    }
}

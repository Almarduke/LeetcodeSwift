// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution002 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var L1 = l1
        var L2 = l2
        var head: ListNode? = nil
        var node = ListNode()
        var carry = 0
        
        while (L1 != nil || L2 != nil || carry != 0) {
            let addition = (L1?.val ?? 0) + (L2?.val ?? 0) + carry
            node.next = ListNode(addition % 10)
            node = node.next!
            head = (head == nil) ? node : head
            carry = addition / 10
            L1 = L1?.next
            L2 = L2?.next
        }
        return head
    }
}


// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
// Example:
//
// Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
// Output: 7 -> 0 -> 8
// Explanation: 342 + 465 = 807.

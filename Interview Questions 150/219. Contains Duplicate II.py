class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        imap = {}
        for i, num in enumerate(nums):
            if num in imap and i - imap[num] <= k:
                return True
            imap[num] = i
        return False

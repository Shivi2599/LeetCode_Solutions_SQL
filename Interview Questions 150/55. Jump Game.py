class Solution:
    def canJump(self, nums: List[int]) -> bool:
        index = 0
        n = len(nums)
        for i in range(len(nums)-1):
            if i > index:
                return False
            index = index + nums[index]
            if index == n:
                return True


      

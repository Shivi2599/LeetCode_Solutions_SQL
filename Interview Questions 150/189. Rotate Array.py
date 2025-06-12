class Solution:
    def rotate(self, nums: List[int], k: int) -> None:

        """
        Do not return anything, modify nums in-place instead.
        """
        n = len(nums)
        k = k% n
        for _ in range(k):
            end = nums.pop()
            nums.insert(0,end)
        return nums


## OR
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:

        """
        Do not return anything, modify nums in-place instead.
        """
        n = len(nums)
        k = k% n
        nums[:] = nums[-k:] + nums[:-k]
      
      

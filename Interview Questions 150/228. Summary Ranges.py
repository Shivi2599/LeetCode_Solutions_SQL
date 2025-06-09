class Solution:
    def summaryRanges(self, nums: List[int]) -> List[str]:
        interval = []
        if not nums:
            return interval
       
        start = nums[0]
        
        for i in range(1, len(nums)):
            if nums[i] != nums[i-1] +1:
                end = nums[i-1]
                if start == end:
                    interval.append(str(start))
                else:
                    interval.append(f"{start}->{end}")
                start = nums[i]
        
        ## last element 
        end = nums[-1] 
        if start == end:
            interval.append(str(start))
        else:
             interval.append(f"{start}->{end}")

        return interval

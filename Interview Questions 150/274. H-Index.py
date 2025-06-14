class Solution:
    def hIndex(self, citations: List[int]) -> int:
        h_index = 0
        citations.sort()

        n = len(citations)
        for i in range(n):
            if citations[i] >= n-i:
                h_index = n-i
                break 
        return h_index

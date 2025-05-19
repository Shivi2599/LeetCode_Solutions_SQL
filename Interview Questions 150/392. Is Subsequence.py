class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        if len(s) == 0: return True
        if len(s) > len(t): return False
        subsequence = 0
        for char in t:
            if char == s[subsequence]:
                subsequence+=1
                if subsequence == len(s):
                    return True
        return subsequence == len(s)

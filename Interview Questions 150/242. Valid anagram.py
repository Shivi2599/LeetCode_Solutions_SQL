class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t): return False
        d = {}
        for i in range(len(s)):
            if s[i] in d:
                d[s[i]] +=1
            else:
                d[s[i]] = 1
        
        p={}
        for j in range(len(t)):
            if t[j] in p:
                p[t[j]] +=1
            else:
                p[t[j]] = 1
        
        return p == d

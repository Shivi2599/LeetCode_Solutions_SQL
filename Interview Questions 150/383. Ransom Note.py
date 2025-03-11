from collections import Counter
class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        
        rn = Counter(ransomNote)
        m =Counter(magazine)

        result=  all(rn[c] <= m[c] for c in ransomNote)     
        return result

## OR ## 

from collections import Counter
class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        
        m =  Counter(magazine)

        for c in ransomNote:
            if c not in m:
                return False
            elif m[c] == 1:
                del m[c]
            else:
                m[c] -= 1
        
        return True

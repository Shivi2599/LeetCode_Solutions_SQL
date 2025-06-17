from collections import defaultdict
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        d = defaultdict(list)
        
        for char in strs:
            key = ''.join(sorted(char))
            d[key].append(char)

        return list(d.values())

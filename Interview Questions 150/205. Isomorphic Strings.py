class Solution:
    def isIsomorphic(self, s: str, t: str) -> bool:
        if len(s) != len(t): return False
        s_to_t = {}
        t_to_s = {}

        for char1, char2 in zip(s,t):
            if char1 in s_to_t:
                if s_to_t[char1] != char2:
                    return False
            else:
                s_to_t[char1] = char2

            if char2 in t_to_s:
                if t_to_s[char2] != char1:
                    return False
            else:
                t_to_s[char2] = char1

        return True

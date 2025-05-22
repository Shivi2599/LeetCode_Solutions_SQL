class Solution:
    def wordPattern(self, pattern: str, s: str) -> bool:
        if len(pattern) != len(s.split()): return False
        p_to_s = {}
        s_to_p = {}

        for char1, char2 in zip(pattern, s.split()):
            if char1 in p_to_s:
                if p_to_s[char1] != char2:
                    return False
            else:
                p_to_s[char1] = char2

            if char2 in s_to_p:
                if s_to_p[char2] != char1:
                    return False
            else:
                s_to_p[char2] = char1

        return True

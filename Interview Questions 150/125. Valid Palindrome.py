import re
class Solution:
    def isPalindrome(self, s: str) -> bool:
        s = s.lower()
        res = re.sub(r'[^a-z0-9]', '', s)
        return res == res[::-1]

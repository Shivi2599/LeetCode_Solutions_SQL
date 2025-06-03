class Solution:
    def isHappy(self, n: int) -> bool:
        met = set()

        while n!=1:
            if n in met:
                return False
            met.add(n)
            n = sum(int(digit) **2 for digit in str(n))

        return True

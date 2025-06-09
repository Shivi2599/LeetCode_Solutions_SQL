class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        mapped = {')': '(', '}': '{', ']': '['}

        for ch in s:
            if ch in mapped.values():
                stack.append(ch)
            elif ch in mapped:
                if not stack or stack[-1] != mapped[ch]:
                    return False
                stack.pop()

            else:
                return False
        
        return not stack

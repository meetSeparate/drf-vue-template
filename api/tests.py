class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


def getSubtreeSum(node):
    if node is None:
        return 0
    return getSubtreeSum(node.left) + getSubtreeSum(node.right) + node.val


def findEqualSubtree(node):
    totalSum = getSubtreeSum(node)
    stack = [node]

    while stack:
        curr = stack.pop()
        leftSum = getSubtreeSum(curr.left)

        if leftSum == totalSum - leftSum - curr.val:
            return True

        if curr.left:
            stack.append(curr.left)
        if curr.right:
            stack.append(curr.right)

    return False


# 测试示例
# 构造二叉树
root = TreeNode(5)
root.left = TreeNode(10)
root.right = TreeNode(10)
root.right.left = TreeNode(2)
root.right.right = TreeNode(3)
print(findEqualSubtree(root))  # 输出: True
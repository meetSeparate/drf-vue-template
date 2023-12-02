lis = [0, 1, 2, 1, 2, 0, 2]


"""
0 -> 石头

1- > 剪刀

2 -》 布
"""

# for i in lis:
#     print(i)

# for i in range(len(lis)):
#     print(lis[i])

string = 'hello,world!'

# for i in string:
#     print(i)

# for item in range(len(string)):
#     print(string[item])


dic = {
    'a': 1,
    'b': 2,
    'c': 3
}

"""
遍历字典分三种方法

1. 遍历字典的键
2. 遍历字典的值
3. 遍历字典的键值对

"""

# for key in dic.keys():
#     print(dic[key])

#
# for value in dic.values():
#     print(value)

#
# for key, value in dic.items():
#     print(key, value)

# 一家商店有5件衣服， 其中的价格不同， 价格对应字典如下， 请通过循环和分支语句找到衬衫的价格并打印输出


price_dict = {
    '体恤': 200,
    '外套': 300,
    '羽绒服': 700,
    '衬衫': 350,
    '鞋子': 500
}


# for key in price_dict.keys():
#     if key == '衬衫':
#         print(price_dict[key])

#
# for key, value in price_dict.items():
#     if key == '衬衫':
#         print(value)

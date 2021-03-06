# 我是怎么解决 magic 5-gon ring 的

> 题目参见 [Project Euler - Magic 5-gon ring](http://projecteuler.net/problem=68)

首先本题可以扩展到求 n-gon ring 的所有解，不仅仅是 5 边型的，也不仅仅是最大的那个解。

目前的解法是：

1. 首先选择一组中的 3 个数，确定不变数 total。
2. 然后选择下一组数，因为下一组中的三个数已经有一个在上一组中确定了，而且另外两个数的和也确定了，那么只需要再选一个数，判断另一个数是否也在可选数集中。
3. 如果在，那么继续往下选择下一组。
4. 如果不在，那么这条路径就无效，重新选择上一组数。
5. 直到，可选集中只有3个元素，这个时候判断剩下的两组和是否等于不变数total，如果不，那么这条路径无效。重头开始选择第一组数。如果在，那么这就是一个解，将这个解加入解集中。


这种解法其实是一种暴力搜索，计算复杂度为n!。
n = 5 时，可以瞬间完成，n = 8 时，就要等上半首歌的时间了。

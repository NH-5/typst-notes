#import "../template/conf.typ": conf
#import "../template/components.typ": *
#import "@preview/cetz:0.3.4"

#show: conf.with(
  title: [
    控制工程 习题
  ],
  authors: (
    (
      name: [Gang.],
      affiliation: [Hangzhou Dianzi University],
      email: "jerry050512@outlook.com",
    ),
  )
)

#set figure(
  numbering: none
)

= 去年试卷

== 计算题

1. 试用结构图化简或梅森公式, 求出从$nu$到$y$的传递函数. <simplfy>

#figure(
  cetz.canvas({
    import cetz.draw: *
    set-style(mark: (end: ">", fill: black))
    content((0, 0), $nu$, anchor: "south", padding: 5pt)
    line((), (rel: (1.5, 0)))
    content((), $+$, anchor: "south-east", padding: 5pt)
    junction()
    line((rel: (0.3, 0)), (rel: (1, 0)))
    rect((rel: (0, 0.5)), (rel: (2, -1)), name: "g1")
    line((rel: (0, 0.5)), (rel: (1, 0)))
    content((), $+$, anchor: "south-east", padding: 5pt)
    junction()
    line((rel: (.3, 0)), (rel: (1, 0)))
    rect((rel: (0, 0.5)), (rel: (2, -1)), name: "g2")
    line((rel: (0, .5)), (rel: (1, 0)))
    content((), $+$, anchor: "south-east", padding: 5pt)
    junction()
    line((rel: (.3, 0)), (rel: (1, 0)))
    rect((rel: (0, 0.5)), (rel: (2, -1)), name: "g3")
    line((rel: (0, .5)), (rel: (1, 0)))
    rect((rel: (0, 0.5)), (rel: (2, -1)), name: "g4")
    line((rel: (0, .5)), (rel: (1.5, 0)))
    content((), $y$, anchor: "south", padding: 5pt)
    line((rel: (-1, 0)), (rel: (0, 1.5)), (rel: (-3.5, 0)))
    rect((rel: (0, 0.5)), (rel: (-2, -1)), name: "g5")
    line((rel: (0, 0.5)), (rel: (-1.3, 0)), (rel: (0, -1.5+.3)))
    line((rel: (3.5 +.3, -.3)), (rel: (0, -1.5)), (rel: (-4.5 -.6, 0)))
    rect((rel: (0, 0.5)), (rel: (-2, -1)), name: "g6")
    line((rel: (0, .5)), (rel: (-1-.3, 0)), (rel: (0, 1.5-.3)))
    content((), $-$, anchor: "north-west", padding: 5pt)
    line((rel: (10.5+.3*3, .3)), (rel: (0, -3.5)), (rel: (-11.5-1.2, 0)))
    rect((rel: (0, 0.5)), (rel: (-2, -1)), name: "g7")
    line((rel: (0, .5)), (rel: (-1-.3, 0)), (rel: (0, 3.5-.3)))
    content((), $-$, anchor: "north-west", padding: 5pt)

    content("g1", $ G_1(s) $)
    content("g2", $ G_2(s) $)
    content("g3", $ G_3(s) $)
    content("g4", $ G_4(s) $)
    content("g5", $ G_5(s) $)
    content("g6", $ G_6(s) $)
    content("g7", $ G_7(s) $)
  }), 
  caption: [题1 图]
)

*结构图化简*

首先, $G_6(s)$的引出点要向后移动到$y$节点, 变为$(G_6(s)) / (G_4(s))$

逐层应用反馈系统的化简, 此时有三个反馈系统: 

最内层变为$ A(s) = (G_3(s) G_4(s)) / (1 - G_3(s) G_4(s) G_5(s)) $

中层变为$ B(s) = (G_2(s) A(s)) / (1 + G_2(s) A(s) (G_6(s)) / (G_4(s))) = (G_2(s) G_3(s) G_4(s)) / (1 - G_3(s) G_4(s) G_5(s) + G_2(s) G_3(s) G_6(s)) $

最外层变为$ G(s) = (G_1(s) B(s)) / (1 + G_1(s) B(s) G_7(s)) $

逐层代入, 展开可以得到$ G(s) = (G_1(s) G_2(s) G_3(s) G_4(s)) / (1 - G_3(s) G_4(s) G_5(s) + G_2(s) G_3(s) G_6(s) + G_1(s) G_2(s) G_3(s) G_4(s) G_7(s)) $

2. 设单位反馈系统的开环传递函数为$G(s) = K (s + 2) / (s (s + 1))$, 试绘制根轨迹, 并计算分离点. 

$ D(s) = s^2 + (K + 1)s + 2K = 0 $

极点$p_1 = 0, p_2 = -1$, 零点$z_1 = -2$

$ n = 2, m = 1 $

$ (K + 1)^2 - 8K = 0 => K = 3 plus.minus 2 sqrt(2) $

分离点为 $ -(K + 1) / 2 = sqrt(2) - 2 $
汇合点为 $ -2 - sqrt(2) $

3. 某单位负反馈系统框图如图(a), 其中环节1是最小相位系统. 其对数幅频特性的渐近线如图(b). \
  i. 求环节1的传递函数; \
  ii. 绘制Nyquist曲线, 判断稳定性; \
  iii. 若系统在$r(t) = 2t + 3 / 2 t^2$时的稳态误差为0.3, 求K; 

#figure(
  cetz.canvas({
    import cetz.draw: *
    set-style(mark: (end: ">", fill: black))
    content((), $R(s)$, anchor: "south", padding: 5pt)
    line((), (rel: (2, 0)))
    junction()
    line((rel: (.3, 0)), (rel: (2, 0)))
    rect((rel: (0, 0.5)), (rel: (2, -1)), name: "g1")
    line((rel: (0, .5)), (rel: (1, 0)))
    rect((rel: (0, 0.5)), (rel: (2, -1)), name: "g2")
    line((rel: (0, .5)), (rel: (2, 0)))
    content((), $C(s)$, anchor: "south", padding: 5pt)
    line((rel: (-1.5, 0)), (rel: (0, -1.5)), (rel: (-7.5-.3, 0)), (rel: (0, 1.5-.3)))
    content((), $-$, anchor: "north-west", padding: 5pt)
    content("g1", [环节1])
    content("g2", $ K / s^2 $)
  }), 
  caption: [题3 图(a) 系统框图]
)

#figure(
  cetz.canvas({
    import cetz.draw: *

    line((0, 0), (0, 4), mark: (end: ">", fill: black))
    content((), $L"/dB"$, anchor: "west", padding: 5pt)
    line((0, 0), (8, 0), mark: (end: ">", fill: black))
    content((), $omega$, anchor: "west", padding: 5pt)

    line((0, 1), (2, 1))
    line((), (5, 3), name: "slope")
    line((), (8, 3))
    line((6, 0), (6, 3), mark: (symbol: ">"), name: "anno")
    content((0, 0), $0$, anchor: "east", padding: 5pt)
    content((2, 0), $2$, anchor: "north", padding: 5pt)
    content((5, 0), $8$, anchor: "north", padding: 5pt)
    content("anno", $20"dB"$, anchor: "west", padding: 5pt)
    content("slope", $20"dB/dec"$, anchor: "south-east", padding: 5pt)
  }), 
  caption: [题3 图(b) Bode Graph]
)

4. 判断系统稳定性, 并求系统在单位阶跃响应$r(t) = 1(t)$作用下的稳态误差. 其中,

#figure(
  cetz.canvas({
    import cetz.draw: *
    set-style(mark: (end: ">", fill: black))
    content((), $R(s)$, anchor: "south", padding: 5pt)
    line((), (rel: (2, 0)))
    junction()
    line((rel: (.3, 0)), (rel: (2, 0)), (rel: (1, .5)), mark: (end: none), name: "g1")
    line((rel: (0, -.5)), (rel: (1, 0)))
    rect((rel: (0, 0.5)), (rel: (2, -1)), name: "g2")
    line((rel: (0, .5)), (rel: (2, 0)))
    content((), $C(s)$, anchor: "south", padding: 5pt)
    line((rel: (-1.5, 0)), (rel: (0, -1.5)), (rel: (-6.5-.3, 0)), (rel: (0, 1.5-.3)))
    content((), $-$, anchor: "north-west", padding: 5pt)
    content("g1", $ T = 1 $, anchor: "north", padding: 10pt)
    content("g2", $ 4 / (s (s + 1)) $)
  }), 
  caption: [题4 图]
)

5. 非线性系统如图. 线性环节传递函数和非线性环节描述函数分别为$G(s) = (20K) / (s(T s + 1)(0.1 s + 1))$ 和 $N = (4 sqrt(3)) / pi$, 已知$T = 0.1s, K = pi / (40 sqrt(3))$ \
  i. 判断是否存在自振振荡; \
  ii. 若存在, 求其自振振幅和频率; \

图待绘制

== 选择题

1. 判断下列为非线性系统: \
  a. $c(t) = 7 + r^2(t) + t dot r(t)$ \
  b. $c'''(t) + 3 c''(t) + 6c'(t) + 8c(t) = r(t)$ \
  c. $t dot c'(t) + c(t) = r(t) + 3r'(t)$ \
  d. $c(t) = cases(0 "if" t < 3, r(t) "if" t >= 3)$

2. 特征方程$s^3 + 2s^2 + 5s + 24 = 0$, 特征根位于右半平面的个数为: \
  a. 0 \
  b. 1 \
  c. 2 \
  d. 3

3. 

= 分类例题

为便于减少绘图内容, 下列题目将尽量不绘制系统框图, 而改为直接给出系统的传递函数. 

== 系统框图化简

参考#link(<simplfy>)[去年试卷题 1]. 

== 劳斯判据

#rect(width: 100%, inset: 8pt)[#emoji.book 设系统的特征方程如下, 判断系统稳定性
$ s^5 + 2s^4 + 3s^3 + 2s^2 + 6s + 4 = 0 $]

由特征方程构造 Routh Table: 
#{
show "0": text("0", fill: blue)
align(
  center, 
  block(
    width: 80%, 
    grid(
      columns: (auto, 1fr, 1fr, 1fr), 
      inset: 8pt, 
      fill: (x, y) => if x == 0 {luma(80%)}, 
      stroke: (x, y) => if x == 0 {(right: black)}, 
      align: center+horizon, 
      $s^5$, $1$, $3$, $6$, 
      $s^4$, $2$, $2$, $4$, 
      $s^3$, $ (2 times 3 - 1 times 2) / 2 = 2 $, $ (2 times 6 - 1 times 4) / 2 = 4 $, $0$, 
      $s^2$, $-2$, $4$, $0$, 
      $s^1$, $8$, $0$, $0$, 
      $s^0$, $4$, $0$, $0$, 
    )
  )
)}

*系统稳定充要条件*: Routh Table中第一列符号均为正, 且不为0. 

故该系统不稳定. 

此外, \
#sym.because Routh Table第一列变号两次 \
#sym.therefore 该系统在复平面右半部分有两个根. 

== Bode Graph

#rect(width: 100%, inset: 8pt)[#emoji.book 绘制开环传递函数的Bode Graph: $ G(s) = 50 dot (s + 10) / (s(s+5)) $]

首先化为标准形式: $ G(s) = 100 dot (0.1s + 1) / (s^1(0.2s + 1)) $
该系统有一个比例环节, 积分环节, 微分环节, 和惯性环节. 

比例系数$K = 100$, 为I型系统知 $v = 1$.

接下来可计算系统在低频内斜率为$-20 "dB/dec" dot v = -20 "dB/dec"$且过点$(1, 20 lg K) = (1, 40)$. 

再接下来计算系统的频率特性 $ G(j omega) = ... ("即代入" s = j omega) $
从而计算微分环节和惯性环节的转折频率 
$ 
  cases(
    "微分环节 " j 0.1 omega+1", " omega_2 = 1 / 0.1 = 10 s^(-1), 
    "惯性环节 " j 0.2 omega+1", " omega+1 = 1 / 0.2 = 5 s^(-1)
  ) 
$
*结论* \
从$omega_2$开始斜率上升20 dB/dec. \
从$omega_1$开始斜率下降20 dB/dec. \
(惯性(分母)下降, 微分(分子)上升)

== 根轨迹绘制

#rect(width: 100%, inset: 8pt)[
  #emoji.book 设单位反馈系统的开环传递函数为$ G(s) = K / (s^2 (s + 2)) $
  （1）试概略地绘制系统根轨迹，并分析系统的稳定性； \
  （2）若增加一个零点$z = -1$，即开环传递函数为$ G(s) = (K (s + 1)) / (s^2 (s + 2)) $
试问此时系统根轨迹有何变化？对系统的稳定性有何影响？\
注：根轨迹渐近线与实轴的夹角和交点计算公式分别为： 
$ phi_a = ((2 k + 1) pi) / (n - m), sigma_a = (sum p_i - sum z_i) / (n - m) $
其中, $n$, $m$为极点个数, 零点个数. $p$, $z$为极点和零点. 
]

i. 

$ D(s) = s^3 + 2s^2 + K = 0 $
极点$p_(1, 2) = 0, p_3 = -2$
$ n = 3, m = 0 $
从而
$ phi_a = plus.minus pi / 3, sigma_a = - 2 / 3 $

...

== Nyquist Graph 绘制

#rect(width: 100%, inset: 8pt)[
  系统的开环传递函数为$ G(s) = (5 (3s + 5)) / (s^2 (2s + 4)) $
  (1)概略地绘制奈奎斯特曲线，给出必要的计算； \
  (2)由奈奎斯特稳定判据判断闭环系统稳定性 \
]

$ A(omega) = (5 sqrt(9omega^2 + 5)) / (omega^2 sqrt(4 omega^2 + 4)) $
$ phi(omega) = - pi + arctan (3 omega) / 5 - arctan omega / 2 $

== 相角裕度

#rect(width: 100%, inset: 8pt)[
  设单位反馈系统的开环传递函数为$ G_o (s) = 20 / (s (s + 1)) $
  采用串联超前校正装置的传递函数为$ G_k (s) = (0.4 s + 1) / (0.04s + 1) $
（1）试绘制校正装置、系统校正前后的对数幅频渐近特性；\
（2）计算校正前后系统的相角裕度。\
]

== 系统稳态误差

#rect(width: 100%, inset: 8pt)[
  设单位负反馈的开环传递函数为$ G(s) = (K (tau s + 1)) / (s^2 (T s + 1)) $
  输入$r(t) = t^2$, 试求稳态误差$e_(s s) <= epsilon_0$时, 各参数需满足的条件. 
]

系统需保持稳定, 则根据闭环特征方程, 利用劳斯判据判定
$ D(s) = T s^3 + s^2 + K tau s + K = 0 $
得#align(center, rect[$ tau > T $])

为II型系统, 且为加速度输入 
$ e_(s s) = 2 / K_a = 2 / K <= epsilon_0 $
得#align(center, rect[$ K >= 2 / epsilon_0 $])
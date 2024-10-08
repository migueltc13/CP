# CP - Ficha 3

## Exercício 1

> Considere o diagrama
>
> <div align="center">
>   <img src=".assets/e-1.jpg" width="50%" alt="Diagrama 1">
> </div>
>
> onde $\text{assocl} = \langle id \times \pi_1, \pi_2 \cdot \pi_2 \rangle$.
Apresente justificações para o cálculo que se segue em
que se resolve em ordem a $\text{assocr}$ a equação
$\text{assocl} \cdot \text{assocr} = id$:

### Resolução 1

$$
\begin{align*}
&\text{assocl} \cdot \text{assocr} = id \\
&\equiv \tag{Def. assocl, 9: Fusão-×, 6: Universal-×, 1: Natural-id} \\
&\left\{
\begin{aligned}
(id \times \pi_1) \cdot \text{assocr} = \pi_1 \\
\pi_2 \cdot \pi_2 \cdot \text{assocr} = \pi_2
\end{aligned}
\right. \\
&\equiv \tag{10: Def-×, 1: Natural-id, 9: Fusão-×, 6: Universal-×} \\
&\left\{
\begin{aligned}
\left\{
\begin{aligned}
\pi_1 \cdot \text{assocr} = \pi_1 \cdot \pi_1             \\
\pi_1 \cdot \pi_2 \cdot \text{assocr} = \pi_2 \cdot \pi_1
\end{aligned}
\right. \\
\pi_2 \cdot \pi_2 \cdot \text{assocr} = \pi_2
\end{aligned}
\right. \\
&\equiv \tag{6: Universal-× } \\
&\left\{
\begin{aligned}
\pi_1 \cdot \text{assocr} = \pi_1 \cdot \pi_1             \\
\left\{
\begin{aligned}
\pi_1 \cdot \pi_2 \cdot \text{assocr} = \pi_2 \cdot \pi_1 \\
\pi_2 \cdot \pi_2 \cdot \text{assocr} = \pi_2
\end{aligned}
\right. \\
\end{aligned}
\right. \\
&\equiv \tag{6: Universal-× } \\
&\left\{
\begin{aligned}
\pi_1 \cdot \text{assocr} = \pi_1 \cdot \pi_1             \\
\pi_2 \cdot \text{assocr} = \langle \pi_2 \cdot \pi_1, \pi_2 \rangle
\end{aligned}
\right. \\
&\equiv \tag{6: Universal-×, 1: Natural-id, 10: Def-×} \\
&\text{assocr} = \langle \pi_1 \cdot \pi_1, \pi_2 \times id \rangle \tag{F1}
\end{align*}
$$

## Exercício 2

> a) Codifique (F1) diretamente em Haskell e verifique
o comportamento dessa função no GHCi.
>
> b) De seguida, converta — por igualdade extensional —
(F1) para notação Haskell pointwise que não recorra a
nenhum combinador nem projecção e verifique no GHCi que as
duas versões dão os mesmos resultados.

### Resolução 2

#### a)

```haskell
ghci> assocr = split (p1 . p1) (p2 >< id)
ghci> assocr ((1,2),3)
(1,(2,3))
ghci> assocr (("Hi",True),3.14)
("Hi",(True,3.14))
```

#### b)

$$
\begin{align*}
&assocr = \langle \pi_1 \cdot \pi_1, \pi_2 \times id \rangle \\
&\equiv \tag{72: Ig. Ext.} \\
&assocr \; ((a,b),c) = \langle \pi_1 \cdot \pi_1, \pi_2 \times id \rangle \; ((a,b),c) \\
&\equiv \tag{77: Def-split} \\
&assocr \; ((a,b),c) = (\pi_1 \cdot \pi_1 \; ((a,b),c), \pi_2 \times id \; ((a,b),c)) \\
&\equiv \tag{78: Def-×, 74: Def-id} \\
&assocr \; ((a,b),c) = (\pi_1 \cdot \pi_1 \; ((a,b),c), (\pi_2 \cdot (a,b), c)) \\
&\equiv \tag{79: Def-proj, 73: Def-comp} \\
&assocr \; ((a,b),c) = (a,(b,c)) \\
\end{align*}
$$

```haskell
ghci> assocr ((a,b),c) = (a,(b,c))
ghci> assocr ((1,2),3)
(1,(2,3))
ghci> assocr (("Hi",True),3.14)
("Hi",(True,3.14))
```

#### Extra - Chegue ao tipo mais geral de $\text{assocl}$ através da sua definição, e de $\text{assocl}$

**TODO**

## Exercício 3

> Recorde a propriedade universal do combinador $[f,g]$,
>
> $$
> \begin{align*}
> k = [f,g] \equiv \left\{
> \begin{aligned}
> &k \cdot i_1 = f \\
> &k \cdot i_2 = g
> \end{aligned}
> \right.
> \end{align*}
> $$
>
> Demonstre a igualdade
>
> $$
> [\underline{k}, \underline{k}] = \underline{k}
> $$
>
> recorrendo à propriedade universal acima e a uma lei que qualquer
função constante $\underline{k}$ satisfaz.
(Ver no [formulário](https://haslab.github.io/CP/Material/cpCalFun.pdf).)

### Resolução 3

$$
\begin{align*}
&[\underline{k}, \underline{k}] = \underline{k} \\
&\equiv \tag{17: Universal-+} \\
&\left\{
\begin{aligned}
\underline{k} \cdot i_1 = \underline{k} \\
\underline{k} \cdot i_2 = \underline{k}
\end{aligned}
\right. \\
&\equiv \tag{3: Fusão-const} \\
&\left\{
\begin{aligned}
\underline{k} = \underline{k} \\
\underline{k} = \underline{k}
\end{aligned}
\right.
\quad \text{c.q.d.}
\end{align*}
$$

#### Extra - Chegue ao tipo mais geral de $[\underline{k}, \underline{k}] = \underline{k}$

**TODO**

## Exercício 4

> Os isomorfismos
>
> <div align="center">
>   <img src=".assets/e-2.jpg" width="50%" alt="Diagrama 2">
> </div>
>
> estudados na aula teórica estão codificados na biblioteca $Cp.hs$. \
> Supondo $A = String$, $B = \mathbb{B}$ e $C = \mathbb{Z}$, \
> a) aplique no GHCi $\text{undistr}$, alternativamente, aos pares
> $\text{("CP", True)}$ ou $\text{("LEI", 1)}$; \
> b) verifique que $(\text{distr} \cdot \text{undistr}) \; x = x$
para essas (e quaisquer outras) situações que possa testar.

### Resolução 4

#### a)

**TODO**

```haskell
ghci> f = undistr . either (const (Left ("CP", True))) (const (Right ("LEI", 1)))
ghci> f (Left ())
("CP", Left True)
ghci> f (Right ())
("LEI", Right 1)
```

#### b)

**TODO**

## Exercício 5

> Recorde a função
>
> $$
> \alpha = [\langle \text{\underline{False}}, id \rangle, \langle \text{\underline{True}}, id \rangle]
> $$
>
> da ficha anterior. Mostre, usando a propriedade $\text{Universal-+} \; (17)$,
que $\alpha$ se pode escrever em Haskell da forma seguinte:
>
> $$
> \begin{align*}
> &\alpha \; (i_1 \; a) = (\text{False}, a) \\
> &\alpha \; (i_2 \; a) = (\text{True},  a)
> \end{align*}
> $$
>
> Codifique $\alpha$ e teste-a no GHCi,
onde $i_1$ (resp. $i_2$) se escreve `Left` (resp. `Right`).

### Resolução 5

$$
\begin{align*}
&[\langle \text{\underline{False}}, id \rangle, \langle \text{\underline{True}}, id \rangle] \\
&= \tag{17: Universal-+} \\
&\left\{
\begin{aligned}
&\alpha \cdot i_1 = \langle \text{\underline{False}}, id \rangle \\
&\alpha \cdot i_2 = \langle \text{\underline{True}},  id \rangle
\end{aligned}
\right. \\
&\equiv \tag{72: Ig. Ext.} \\
&\left\{
\begin{aligned}
&(\alpha \cdot i_1) \; a = \langle \text{\underline{False}}, id \rangle \; a \\
&(\alpha \cdot i_2) \; a = \langle \text{\underline{True}},  id \rangle \; a
\end{aligned}
\right. \\
&\equiv \tag{73: Def-comp, 77: Def-split} \\
&\left\{
\begin{aligned}
&\alpha \; (i_1 \; a) = (\text{\underline{False}} \; a, id \; a) \\
&\alpha \; (i_2 \; a) = (\text{\underline{True}}  \; a, id \; a)
\end{aligned}
\right. \\
&\equiv \tag{75: Def-const, 74: Def-id} \\
&\left\{
\begin{aligned}
&\alpha \; (i_1 \; a) = (\text{False}, a) \\
&\alpha \; (i_2 \; a) = (\text{True} , a)
\end{aligned}
\right.
\quad \text{c.q.m.}
\end{align*}
$$

```haskell
ghci> alpha = either (split (const False) id) (split (const True) id)
ghci> alpha (Left 42)
(False,42)
ghci> alpha (Right 42)
(True,42)
```

## Exercício 6

> Recorra às leis dos coprodutos para mostrar
que a definição que conhece da função factorial,
>
> $$
> \begin{align*}
> &fac \; 0 = 1 \\
> &fac \; (n + 1) = (n + 1) * fac \; n
> \end{align*}
> $$
>
> é equivalente à equação seguinte
>
> $$
> fac \cdot [\underline{0}, \text{succ}] = [\underline{1}, \text{mul} \cdot \langle \text{succ}, fac \rangle]
> $$
>
> onde
>
> $$
> \begin{align*}
> &\text{succ} \; n = n + 1 \\
> &\text{mul} \; (a,b) = a * b
> \end{align*}
> $$

### Resolução 6

$$
\begin{align*}
&fac \cdot [\underline{0}, \text{succ}] = [\underline{1}, \text{mul} \cdot \langle \text{succ}, fac \rangle] \\
&\equiv \tag{20: Fusão-+} \\
&[fac \cdot \underline{0}, fac \cdot \text{succ}] = [\underline{1}, \text{mul} \cdot \langle \text{succ}, fac \rangle] \\
&\equiv \tag{27: Eq-+} \\
&\left\{
\begin{aligned}
&fac \cdot \underline{0} = \underline{1} \\
&fac \cdot \text{succ} = \text{mul} \cdot \langle \text{succ}, fac \rangle
\end{aligned}
\right. \\
&\equiv \tag{TODO} \\
\end{align*}
$$

## Exercício 7

> **TODO**

### Resolução 7

**TODO**

## Exercício 8

> **TODO**

### Resolução 8

**TODO**

## Exercício 9

> **TODO**

### Resolução 9

**TODO**

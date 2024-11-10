# CP - Ficha 9

## Exercício 1

> Considere o seguinte inventário de quatro tipos de árvores:
>
> $$
> \begin{align*}
>    &\text{a) Árvores com informação de tipo } A \text{ nas folhas:} \\
>    &\hspace{2cm} \text{T} = \text{LTree} \; A
>    \hspace{4.1em}
>    \begin{cases}
>        \text{F} \; X = A + X^2 \\
>        \text{F} \; f = id + f^2
>    \end{cases}
>    \hspace{6.25em} \text{in} = [\text{Leaf} , \text{Fork}] \\
>    &\text{Haskell:} \quad \texttt{data LTree a = Leaf a | Fork (LTree a, LTree a)} \\[1.2em]
>    &\text{b) Árvores com informação de tipo } A \text{ nos nós:} \\
>    &\hspace{2cm} \text{T} = \text{BTree} \; A
>    \hspace{4.1em}
>    \begin{cases}
>        \text{F} \; X = 1 + A \times X^2 \\
>        \text{F} \; f = id + id \times f^2
>    \end{cases}
>    \hspace{4.45em} \text{in} = [\text{Empty} , \text{Node}] \\
>    &\text{Haskell:} \quad \texttt{data BTree a = Empty | Node (a, (BTree a, BTree a))} \\[1.2em]
>    &\text{c) Árvores com informação nos nós e nas folhas:} \\
>    &\hspace{2cm} \text{T} = \text{FTree} \; B \; A
>    \hspace{3.1em}
>    \begin{cases}
>        \text{F} \; X = B + A \times X^2 \\
>        \text{F} \; f = id + id \times f^2
>    \end{cases}
>    \hspace{4.1em} \text{in} = [\text{Unit} , \text{Comp}] \\
>    &\text{Haskell:} \quad \texttt{data FTree b a = Unit b | Comp (a, (FTree b a, FTree b a))} \\[1.2em]
>    &\text{d) Árvores de expressão:} \\
>    &\hspace{2cm} \text{T} = \text{Expr} \; V \; O
>    \hspace{3.6em}
>    \begin{cases}
>        \text{F} \; X = V + O \times X^* \\
>        \text{F} \; f = id + id \times \text{map} \; f
>    \end{cases}
>    \hspace{2.7em} \text{in} = [\text{Var} , \text{Term}] \\
>    &\text{Haskell:} \quad \texttt{data Expr v o = Var v | Term (o, [Expr v o])} \\[1.2em]
>\end{align*}
>$$
>
> Defina o gene $g$ para cada um dos catamorfismos seguintes desenhando,
para cada caso, o diagrama correspondente:
>
> - $maximum = \lb g \rb$ — devolve a maior folha de uma árvore de tipo a).
> - $inorder = \lb g \rb$ — faz a travessia inorder de uma árvore de tipo b).
> - $mirror = \lb g \rb$ — espelha uma árvore de tipo b), i.e., roda-a de $180^\circ$.
> - $rep \; a = \lb g \rb$ — substitui todas as folhas de uma árvore de tipo a) por um mesmo valor $a \in A$.
> - $convert = \lb g \rb$ — converte árvores de tipo c) em árvores de tipo b) eliminando os $B$s que estão na primeira.
> - $vars = \lb g \rb$ — lista as variáveis de uma árvore expressão de tipo d).

## Exercício 2

> Derive a versão *pointwise* do seguinte catamorfismo de $\text{BTree}$s,
>
> $$
> \begin{align*}
> &\text{tar} = \lb [\text{singl} \cdot \text{nil}, g] \rb \; \textbf{where} \\
> &\quad g = \text{map} \; \text{cons} \cdot lstr \cdot (id \times \text{conc}) \\
> &\quad \text{lstr} \; (b, x) = [(b, a) \mid a \leftarrow x]
> \end{align*}
> $$
>
> entregando no final uma versão da função em que não ocorrem os nomes das funções
$\text{map}$, $\text{cons}$, $\text{singl}$, $\text{nil}$, $\text{conc}$ e $lstr$.
Pode usar $\text{map} \; f \; x = [f \; a \mid a \leftarrow x]$
como definição *pointwise* de $\text{map}$ em listas.

## Exercício 3

> Converta o catamorfismo $vars$ do exercício 1 numa função em Haskell
sem quaisquer combinadores *pointfree*.

## Exercício 4

> Um *anamorfismo* é um *“catamorfismo ao contrário”*, i.e., uma função $k : A \to \text{T}$ tal que
>
> $$
> k = \text{in} \cdot \text{F} \; k \cdot g \tag{F1}
> $$
>
> escrevendo-se $k = \la g \ra$. Mostre que o anamorfismo de listas
>
> $$
> k = \la (id + \langle f , id \rangle) \cdot \text{out}_{\N_0} \ra \tag{F2}
> $$
>
> descrito pelo diagrama
>
> <div align="center">
>     <img src=".assets/e-4.png" width="60%" alt="Anamorphism diagram">
> </div>
>
> é a função
>
> $$
> \begin{cases}
> k \; 0 = [ \; ] \\
> k \; (n + 1) = (2 \; n + 1) : k \; n
> \end{cases}
> $$
>
> para $f \; n = 2 \; n + 1$. (Que faz esta função?)

## Exercício 5

> Mostre que o anamorfismo que calcula os sufixos de uma lista
>
> $$suffixes = \la g \ra \; \textbf{where} \; g = (id + \langle \text{cons}, \pi_2 \rangle) \cdot \text{out}$$
>
> é a função:
>
> $$\begin{cases}
> suffixes \; [ \; ] = [ \; ] \\
> suffixes \; (h : t) = (h : t) : suffixes \; t
> \end{cases}$$

## Exercício 6

> Mostre que o catamorfismo de listas
$\text{length} = \lb [\text{zero} , \text{succ} \cdot \pi_2] \rb$
é a mesma função que o anamorfismo de naturais
$\la (id + \pi_2) \cdot \text{out}_{\text{List}} \ra$.

## Exercício 7

> **Questão prática**
>
> ***Problem requirements***:
>
> *The figure below*
>
> <div align="center">
>    <img src=".assets/quad_tree_bitmap.png" width="60%" alt="QTree diagram">
> </div>
>
> *(Source: [Wikipedia](https://en.wikipedia.org/wiki/Quadtree#Image_processing_using_quadtrees))
shows how an image (in this case in black and white) is represented
in the form of a quaternary tree (vulg. quadtree) by successive divisions
of the 2D space into four regions, until reaching the resolution of one pixel.*
>
> *Let the following Haskell definition of a quadtree be given,
for a given type $Pixel$ predefined:*
>
> ```haskell
> data QTree = Pixel | Blocks (QTree) (QTree) (QTree) (QTree)
> ```
>
> *Having chosen for this type the base functor*
>
> $$\text{F} \; Y = Pixel + Y^2 \times Y^2 \tag{F3}$$
>
> *where $Y^2$ abbreviates $Y \times Y$, as usual,
define the usual construction and decomposition functions of this type, cf.:*
>
> <div align="center">
>     <img src=".assets/diagram-qtree.png" width="75%" alt="QTree diagram">
> </div>
> <!-- TODO: Add diagram -->
>
> *Then, write the Haskell code of $\text{Quad.hs}$,
a Haskell library similar to others already available, e.g.,
[$\text{LTree.hs}$](https://haslab.github.io/CP/Material/).
Finally, implement as a $\text{QTree}$ catamorphism the
operation that rotates an image $90^\circ$ clockwise.*

$\square$

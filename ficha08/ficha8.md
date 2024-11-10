# CP - Ficha 8

## Exercício 1

> A igualdade que se segue
>
> $$
> f \cdot \text{length} = \lb [\text{zero} , (2+) \cdot \pi_2] \rb
> $$
>
> verifica-se para $f = (2\ast)$ ou $f = (2+)$? Use a lei de fusão-cata para justificar, por cálculo, a sua resposta.

## Exercício 2

> As seguintes funções mutuamente recursivas testam a paridade de um número natural:
>
> $$\begin{cases}
> impar \; 0 = \text{FALSE} \\
> impar \; (n + 1) = par \; n
> \end{cases}
> \qquad
> \begin{cases}
> par \; 0 = \text{TRUE} \\
> par \; (n + 1) = impar \; n
> \end{cases}
> $$
>
> Assumindo o functor $\text{F} \; f = id + f$, mostre que esse par de definições é equivalente ao sistema de equações
>
> $$\begin{cases}
> impar \cdot \text{in} = h \cdot \text{F} \; \langle impar, par \rangle \\
> par \cdot \text{in} = k \cdot \text{F} \; \langle impar, par \rangle
> \end{cases}$$
>
> para um dado $h$ e $k$ (deduza-os). De seguida, recorra às leis da recursividade mútua e da troca para mostrar que
>
> $$imparpar = \langle impar, par \rangle = \text{for} \; \text{swap} \; (\text{FALSE}, \text{TRUE})$$

## Exercício 3

> A seguinte função em Haskell lista os primeiros $n$ números naturais por ordem inversa:
>
> $$
> \left\{
> \begin{aligned}
> &insg \; 0 = [ \; ] \\
> &insg \; (n + 1) = (n + 1) : insg \; n
> \end{aligned}
> \right.
> $$
>
> Mostre que $insg$ pode ser definida por recursividade mútua tal como se segue:
>
> $$
> \begin{align*}
>
> &\left\{
> \begin{aligned}
> &insg \; 0 = [ ] \\
> &insg \; (n + 1) = (fsuc \; n) : insg \; n
> \end{aligned}
> \right. \\[1.25em]
> &\left\{
> \begin{aligned}
> &fsuc \; 0 = 1 \\
> &fsuc \; (n + 1) = fsuc \; n + 1
> \end{aligned}
> \right.
> \end{align*}
> $$
>
> A seguir, usando a lei de recursividade mútua, derive:
>
> $$
> \begin{align*}
> &insg = \pi_2 \cdot insgfor \\
> &insgfor = \text{for} \; \langle (1+) \cdot \pi_1, \text{cons} \rangle \; (1, [ \; ])
> \end{align*}
> $$

## Exercício 4

> Considere o par de funções mutuamente recursivas
>
> $$
> \begin{align*}
> &\begin{cases}
> f_1 \; [ \; ] = [ \; ] \\
> f_1 \; (h : t) = h : (f_2 \; t)
> \end{cases}
> \qquad
> &\begin{cases}
> f_2 \; [ \; ] = [ \; ] \\
> f_2 \; (h : t) = f_1 \; t
> \end{cases}
> \end{align*}
> $$
>
> Mostre por recursividade mútua que $\langle f_1, f_2 \rangle$
é um catamorfismo de listas (onde $\text{F} \; f = id + id \times f$)
e desenhe o respectivo diagrama.
Que faz cada uma destas funções $f_1$ e $f_2$?

## Exercício 5

> Sejam dados os functores elementares seguintes:
>
> $$
> \begin{cases}
> \text{F} \; X = \mathbb{Z} \\
> \text{F} \; f = id
> \end{cases}
> \qquad
> \begin{cases}
> \text{G} \; X = X \\
> \text{G} \; f = f
> \end{cases}
> $$
>
> Mostre que $\text{H}$ e $\text{K}$ definidos por
>
> $$\text{H} \; X = \text{F} \; X + \text{G} \; X$$
> $$\text{K} \; X = \text{G} \; X \times \text{F} \; X$$
>
> são functores.

## Exercício 6

> Mostre que, sempre que $\text{F}$ e $\text{G}$ são functores,
então a sua composição $\text{H} = \text{F} \cdot \text{G}$ é também um functor.

## Exercício 7

> **Questão prática**
>
> ***Problem definition:** Page [UNZIP IN ONE PASS?](https://stackoverflow.com/questions/18287848/unzip-in-one-pass)
of* Stack Overflow *addresses the question as to whether*
>
> $$\text{unzip} \; xs = (\text{map} \; \pi_1 \; xs, \text{map} \; \pi_2 \; xs)$$
>
> *can do one traversal only. The answer is affirmative:*
>
> $$
> \begin{align*}
> &\text{unzip} \; [ \; ] = ([ \; ], [ \; ]) \\
> &\text{unzip} \; ((a, b) : xs) = (a : as, b : bs) \; \textbf{where} \; (as, bs) = \text{unzip} \; xs
> \end{align*}
> $$
>
> *What is missing from* Stack Overflow *is the explanation of how the two steps
of $\text{unzip}$ merge into one.
Show that the* banana-split *law is what needs to be known
for the one traversal version to be derived from the two traversal one.*

$\square$

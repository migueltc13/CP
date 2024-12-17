# CP - Ficha 8

## Exercício 1

> A igualdade que se segue
>
> $$
> f \cdot \text{length} = \lb [\text{zero}, (2+) \cdot \pi_2] \rb
> $$
>
> verifica-se para $f = (2\ast)$ ou $f = (2+)$? Use a lei de fusão-cata para justificar, por cálculo, a sua resposta.

<div style="page-break-after: always;"></div>

### Resolução 1

$$
\text{length} = \lb [\text{zero}, \text{succ} \cdot \pi_2] \rb
\\[2em]
$$

$$
\begin{align*}
&f \cdot \text{length} =  \lb [\text{zero} , (2+) \cdot \pi_2] \rb \\
&\equiv \tag{\small{Def. length, Def. zero (2×)}} \\
&f \cdot \lb [\underline{0}, \text{succ} \cdot \pi_2] \rb = \lb [\underline{0}, (2+) \cdot \pi_2] \rb \\
&\Leftarrow \tag{\small{49: Fusão-cata, $\text{F}_{\text{List}} \; f = id + id \times f$}} \\
&f \cdot [\underline{0}, \text{succ} \cdot \pi_2] = [\underline{0}, (2+) \cdot \pi_2] \cdot (id + id \times f) \\
&\equiv \tag{\small{20: Fusão-+, 22: Absorção-+, 1: Natural-id}} \\
&[f \cdot \underline{0}, f \cdot \text{succ} \cdot \pi_2] = [\underline{0}, (2+) \cdot \pi_2 \cdot (id \times f)] \\
&\equiv \tag{\small{13: Natural-$\pi_2$, 27: Eq-+}} \\
&\begin{cases}
f \cdot \underline{0} = \underline{0} \\
f \cdot \text{succ} \cdot \pi_2 = (2+) \cdot f \cdot \pi_2
\end{cases} \\
&\equiv \tag{\small{72: Ig. Ext., 73: Def-comp, 75: Def-const}} \\
&\begin{cases}
f \; 0 = 0 \\
f \; (\text{succ} \; (\pi_2 \; (\_,n))) = 2 + f \; (\pi_2 \; (\_,n))
\end{cases} \\
&\equiv \tag{\small{79: Def-proj, Def. succ}} \\
&\begin{cases}
f \; 0 = 0 \\
f \; (n+1) = 2 + f \; n
\end{cases} \\
\end{align*}
$$

$$
\\[3em]
\begin{align*}
&\text{Hipótese 1:} \quad f = (2+) \\
&\begin{cases}
2 + 0 = 2 \\
2 + (n + 1) = 2 + (2 + n)
\end{cases} \\
&\equiv \\
&\text{False}
\end{align*}
\hspace{4em}
\begin{align*}
&\text{Hipótese 2:} \quad f = (2*) \\
&\begin{cases}
2 * 0 = 2 \\
2 * (n + 1) = 2 + (2 * n)
\end{cases} \\
&\equiv \\
&\text{True}
\end{align*}
$$

<div style="page-break-after: always;"></div>

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
> Assumindo o functor $\textbf{F} \; f = id + f$, mostre que esse par de definições é equivalente ao sistema de equações
>
> $$\begin{cases}
> impar \cdot \text{in} = h \cdot \text{F} \; \langle impar, par \rangle \\
> par \cdot \text{in} = k \cdot \text{F} \; \langle impar, par \rangle
> \end{cases}$$
>
> para um dado $h$ e $k$ (deduza-os). De seguida, recorra às leis da recursividade mútua e da troca para mostrar que
>
> $$imparpar = \langle impar, par \rangle = \text{for} \; \text{swap} \; (\text{FALSE}, \text{TRUE})$$

### Resolução 2

$$
\begin{align*}
&\begin{cases}
impar \; 0 = \text{FALSE} \\
impar \; (n + 1) = par \; n
\end{cases} \\
&\equiv \tag{\small{73: Def-comp, 75: Def-const, Def. succ, 72: Ig. Ext.}} \\
&\begin{cases}
impar \cdot \underline{0} = \underline{\text{false}} \\
impar \cdot \text{succ} = par
\end{cases} \\
&\equiv \tag{\small{27: Eq-+, 20 Fusão-+}} \\
&impar \cdot [\underline{0}, \text{succ}] = [\underline{\text{false}}, par] \\
&\equiv \tag{\small{Def. $\text{in}_\mathbb{N_0}$, 7: Cancelamento-×, 3: Fusão-const}} \\
&impar \cdot \text{in}_\mathbb{N_0} = [\underline{\text{false}}, \pi_2 \cdot \langle impar, par \rangle] \\
&\equiv \tag{\small{1: Natural-id, 22: Absorção-+}} \\
&impar \cdot \text{in}_\mathbb{N_0} = [\underline{\text{false}}, \pi_2] \cdot (id + \langle impar, par \rangle) \\
&\equiv \tag{\small{$\textbf{F} \; f = id + f$}} \\
&impar \cdot \text{in}_\mathbb{N_0} = [\underline{\text{false}}, \pi_2] \cdot \textbf{F} \; \langle impar, par \rangle \\
&\Leftarrow \\
&h = [\underline{\text{false}}, \pi_2]
\end{align*}
$$

$$\\[2em]$$

$$
\begin{align*}
&\begin{cases}
par \; 0 = \text{TRUE} \\
par \; (n + 1) = impar \; n
\end{cases} \\
&\equiv \tag{\small{...}} \\
&par \cdot \text{in}_\mathbb{N_0} = [\underline{\text{true}}, \pi_1] \cdot \textbf{F} \; \langle impar, par \rangle \\
&\Leftarrow \\
&k = [\underline{\text{true}}, \pi_1]
\end{align*}
$$

$$\\[2em]$$

$$
\begin{align*}
&\begin{cases}
impar \cdot \text{in} = h \cdot \textbf{F} \; \langle impar, par \rangle \\
par \cdot \text{in} = k \cdot \textbf{F} \; \langle impar, par \rangle
\end{cases} \\
&\equiv \tag{\small{53: Fokkinga}} \\
&\langle impar, par \rangle = \lb \langle h, k \rangle \rb \\
&\equiv \tag{\small{Def. h, Def. k}} \\
&\langle impar, par \rangle = \lb \langle [\underline{\text{false}}, \pi_2], [\underline{\text{true}}, \pi_1] \rangle \rb \\
&\equiv \tag{\small{28: Lei da troca}} \\
&\langle impar, par \rangle = \lb [\langle \underline{\text{false}}, \underline{\text{true}} \rangle, \langle \pi_2, \pi_1 \rangle] \rb \\
&\equiv \tag{\small{Def. swap, $\langle \underline{a}, \underline{b} \rangle = \underline{(a, b)}$}} \\
&\langle impar, par \rangle = \lb [\underline{(\text{false}, \text{true})}, \text{swap}] \rb \\
&\equiv \tag{\small{$\text{for} \; b \; i = \lb [\underline{i}, b] \rb$}} \\
&\langle impar, par \rangle = \text{for} \; \text{swap} \; (\text{FALSE}, \text{TRUE})
\end{align*}
$$

<div style="page-break-after: always;"></div>

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

### Resolução 3

$$
\begin{align*}
&\begin{cases}
insg \; 0 = [ \; ] \\
insg \; (n + 1) = (n + 1) : insg \; n
\end{cases} \\
&\equiv \tag{\small{73, 75, Def. succ, Def. cons, Def. nil, 77, 72}} \\
&\begin{cases}
insg \cdot \underline{0} = \text{nil} \\
insg \cdot \text{succ} = \text{cons} \cdot \langle \text{succ}, insg \rangle
\end{cases} \\
&\equiv \tag{\small{27: Eq-+, 20: Fusão-+}} \\
&insg \cdot [\underline{0}, \text{succ}] = [\text{nil}, \text{cons} \cdot \langle \text{succ}, insg \rangle] \\
&\equiv \tag{\small{Def. $\text{in}_\mathbb{N_0}$, 1: Natural-id, 22: Absorção-+}} \\
&insg \cdot \text{in}_\mathbb{N_0} = [\text{nil}, \text{cons}] \cdot (id + \langle \text{succ}, insg \rangle]) \\
&\equiv \tag{\small{$\textbf{F} \; f = id + f$}} \\
&insg \cdot \text{in}_\mathbb{N_0} = [\text{nil}, \text{cons}] \cdot \textbf{F} \; \langle \text{succ}, insg \rangle \\
&\Leftarrow \\
&k = [\text{nil}, \text{cons}]
\end{align*}
$$

$$
\\[2em]
$$

$$
\begin{align*}
&\begin{cases}
fsuc \; 0 = 1 \\
fsuc \; (n + 1) = fsuc \; n + 1
\end{cases} \\
&\equiv \tag{\small{...}} \\
&fsuc \cdot \text{in}_\mathbb{N_0} = [\underline{1}, \text{succ} \cdot \pi_1] \cdot \textbf{F} \; \langle \text{succ}, insg \rangle \\
&\Leftarrow \\
&h = [\underline{1}, \text{succ} \cdot \pi_1]
\end{align*}
$$

$$
\\[2em]
$$

$$
\begin{align*}
&\begin{cases}
fsuc \cdot \text{in} = h \cdot \textbf{F} \; \langle \text{succ}, insg \rangle \\
insg \cdot \text{in} = k \cdot \textbf{F} \; \langle \text{succ}, insg \rangle
\end{cases} \\
&\equiv \tag{\small{53: Fokkinga}} \\
&\langle insg, fsuc \rangle = \lb \langle h, k \rangle \rb \\
&\equiv \tag{\small{Def. k, Def. h}} \\
&\langle insg, fsuc \rangle = \lb \langle [\underline{1}, \text{succ} \cdot \pi_1], [\text{nil}, \text{cons}] \rb \\
&\equiv \tag{\small{28: Lei da troca, Def. nil}} \\
&\langle insg, fsuc \rangle = \lb [\langle \underline{1}, \underline{[\;]} \rangle, \langle \text{succ} \cdot \pi_1, \text{cons} \rangle] \rb \\
&\equiv \tag{\small{$\langle \underline{a}, \underline{b} \rangle = \underline{(a, b)}$, Def. for}} \\
&\langle insg, fsuc \rangle = \text{for} \; \langle \text{succ} \cdot \pi_1, \text{cons} \rangle \; (1, [ \; ]) \\
&\equiv \tag{\small{Def. succ}} \\
&\langle insg, fsuc \rangle = \text{for} \; \langle (1+) \cdot \pi_1, \text{cons} \rangle \; (1, [ \; ])
\end{align*}
$$

<div style="page-break-after: always;"></div>

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

### Resolução 4

**TODO**

<div style="page-break-after: always;"></div>

## Exercício 5

> Sejam dados os functores elementares seguintes:
>
> $$
> \begin{cases}
> \textbf{F} \; X = \mathbb{Z} \\
> \textbf{F} \; f = id
> \end{cases}
> \qquad
> \begin{cases}
> \textbf{G} \; X = X \\
> \textbf{G} \; f = f
> \end{cases}
> $$
>
> Mostre que $\textbf{H}$ e $\textbf{K}$ definidos por
>
> $$\textbf{H} \; X = \textbf{F} \; X + \textbf{G} \; X$$
> $$\textbf{K} \; X = \textbf{G} \; X \times \textbf{F} \; X$$
>
> são functores.

### Resolução 5

$$
\begin{align*}
&\begin{cases}
\textbf{H} \; X = \textbf{F} \; X + \textbf{G} \; X \\
\textbf{H} \; f = \textbf{F} \; f + \textbf{G} \; f
\end{cases} \\
&\equiv \tag{\small{Def. $\textbf{F}$ e $\textbf{G}$}} \\
&\begin{cases}
\textbf{H} \; X = \mathbb{Z} + X \\
\textbf{H} \; f = id + f
\end{cases}
\end{align*}
$$

$$
\text{Para } \textbf{H} \text{ ser functor, tem de se verificar: }
\begin{align*}
&\begin{cases}
\textbf{H} \; (g \cdot f) = \textbf{H} \; g \cdot \textbf{H} \; f \\
\textbf{H} \; id = id
\end{cases}
\end{align*}
$$

$$
\begin{align*}
(\textbf{H} \; g) \cdot (\textbf{H} \; h) &= (id + g) \cdot (id + h) \tag{\small{Def. $\textbf{H} \; f = id + f$}} \\
                                          &= id + g \cdot h \tag{\small{25: Functor-+, 1: Natural-id}} \\
                                          &= \textbf{H} \; (g \cdot h)
\\[1em]
\textbf{H} \; id &= id + id \tag{\small{Def. $\textbf{H} \; f = id + f$}} \\
                 &= id \tag{\small{1: Natural-id}}
\end{align*}
$$

<div style="page-break-after: always;"></div>

$$
\\[2em]
\begin{align*}
&\begin{cases}
\textbf{K} \; X = \textbf{G} \; X \times \textbf{F} \; X \\
\textbf{K} \; f = \textbf{G} \; f \times \textbf{F} \; f
\end{cases} \\
&\equiv \tag{\small{Def. $\textbf{F}$ e $\textbf{G}$}} \\
&\begin{cases}
\textbf{K} \; X = X \times \mathbb{Z} \\
\textbf{K} \; f = f \times id
\end{cases}
\end{align*}
$$

$$
\text{Para } \textbf{K} \text{ ser functor, tem de se verificar: }
\begin{align*}
&\begin{cases}
\textbf{K} \; (g \cdot f) = \textbf{K} \; g \cdot \textbf{K} \; f \\
\textbf{K} \; id = id
\end{cases}
\end{align*}
$$

$$
\begin{align*}
(\textbf{K} \; g) \cdot (\textbf{K} \; h) &= (g \times id) \cdot (h \times id) \tag{\small{Def. $\textbf{K} \; f = f \times id$}} \\
                                          &= g \cdot h \times id \tag{\small{25: Functor-×, 1: Natural-id}} \\
                                          &= \textbf{K} \; (g \cdot h)
\\[1em]
\textbf{K} \; id &= id \times id \tag{\small{Def. $\textbf{K} \; f = f \times id$}} \\
                 &= id \tag{\small{1: Natural-id}}
\end{align*}
$$

<div style="page-break-after: always;"></div>

## Exercício 6

> Mostre que, sempre que $\textbf{F}$ e $\textbf{G}$ são functores,
então a sua composição $\textbf{H} = \textbf{F} \cdot \textbf{G}$ é também um functor.

### Resolução 6

$$
\text{Se } \textbf{F} \text{ e } \textbf{G} \text{ são functores, então:}
\\[0.5em]
\begin{align*}
&\begin{cases}
\textbf{F} \; (g \cdot f) = \textbf{F} \; g \cdot \textbf{F} \; f \\
\textbf{F} \; id = id
\end{cases}
\quad \text{e} \quad
\begin{cases}
\textbf{G} \; (g \cdot f) = \textbf{G} \; g \cdot \textbf{G} \; f \\
\textbf{G} \; id = id
\end{cases}
\end{align*}
$$

$$
\text{Para } \textbf{H} = \textbf{F} \cdot \textbf{G} \text{ ser functor, tem de se verificar:}
\\[0.5em]
\begin{align*}
&\begin{cases}
\textbf{H} \; (g \cdot f) = \textbf{H} \; g \cdot \textbf{H} \; f \\
\textbf{H} \; id = id
\end{cases}
\end{align*}
$$

$$
\begin{align*}
\textbf{H} \; (g \cdot h) &= \textbf{F} \cdot \textbf{G} \; (g \cdot h) \tag{\small{Def. $\textbf{H} = \textbf{F} \cdot \textbf{G}$}} \\
                          &= \textbf{F} \; (\textbf{G} \; g \cdot \textbf{G} \; h) \tag{\small{$\textbf{G} \; (g \cdot f) = \textbf{G} \; g \cdot \textbf{G} \; f \\$}} \\
                          &= (\textbf{F} \cdot \textbf{G} \; g) \cdot (\textbf{F} \cdot \textbf{G} \; h) \tag{\small{$\textbf{F} \; (g \cdot f) = \textbf{F} \; g \cdot \textbf{F} \; f$}} \\
                          &= (\textbf{H} \; g) \cdot (\textbf{H} \; h) \tag{\small{Def. $\textbf{H} = \textbf{F} \cdot \textbf{G}$}}
\\[1em]
\textbf{H} \; id &= (\textbf{F} \cdot \textbf{G}) \; id \tag{\small{Def. $\textbf{H} = \textbf{F} \cdot \textbf{G}$}} \\
                 &= \textbf{F} \; (\textbf{G} \; id) \tag{\small{Def. comp}} \\
                 &= \textbf{F} \; id \tag{\small{$\textbf{G} \; id = id$}} \\
                 &= id \tag{\small{$\textbf{F} \; id = id$}}
\end{align*}
$$


<div style="page-break-after: always;"></div>

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

### Resolução 7

**TODO**

$\square$

Seja $f = \hat{(++)} \circ \langle \text{head}, (\text{++} \; \text{" "}) \circ \text{last} \rangle$

Então, $\text{short} = f \circ \text{words}$

Simplificando a expressão de $f$:

$$
\begin{align*}
&\hat{(++)} \circ \langle \text{head}, (\text{++} \; \text{" "}) \circ \text{last} \rangle \\
&= \tag{Ig. Ext., Def-Comp, Def-Split, Uncurry} \\
&(++) \; (\text{head} \; x) \; ((\text{++} \; \text{" "}) \circ \text{last} \; x) \\
&= \tag{?} \\
&((++) \circ (\text{++} \; \text{" "})) \; (\text{head} \; x) \; (\text{last} \; x) \\
&= \tag{Uncurry, Def-Split, Def-Comp, Ig. Ext.} \\
&\text{uncurry } ((++) \circ (\text{++} \; \text{" "})) \circ \langle \text{head}, \text{last} \rangle \\
\end{align*}
$$

Logo, $\text{short} = \text{uncurry } ((++) \circ (\text{++} \; \text{" "})) \circ \langle \text{head}, \text{last} \rangle \circ \text{words}$

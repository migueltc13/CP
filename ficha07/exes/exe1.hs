{-# LANGUAGE NPlusKPatterns #-}

import Cp (i1, i2, (-|-), nil)

inN = either (const 0) succ
out 0 = i1 () ; out (n + 1) = i2 n
fF f = id -|- f
cata g = g . fF (cata g) . out
rep a = cata (either nil (a:))

-- for b i = cata (either (const i) b)
-- mul a = for (a+) 0

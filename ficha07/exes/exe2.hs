{-# LANGUAGE NPlusKPatterns #-}

import Cp (nil, singl, swap, (><), cond, p1)
import List (outList, recList, cataList)

-- a)
mulList = cataList (either (const 1) (uncurry (*)))

-- b)
reverse' = cataList (either nil g2)
    where
        g2 = uncurry (++) . (id >< singl) . swap
        -- g2 (a, b) = b ++ [a]  -- equivalent

-- c)
concat' = cataList (either nil (uncurry (++)))

-- d)
map' f = cataList (either nil (uncurry ((:) . f)))

-- e)
maxList = cataList (either (const 0) (uncurry max))

-- f)
filter' p = cataList (either nil (uncurry (++) . (cond p singl nil >< id)))

{-# LANGUAGE NPlusKPatterns #-}

import Cp (nil, singl, swap, (><), p2)
import List (outList, recList, cataList, myfoldr)

k = myfoldr (curry p2)

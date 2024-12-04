
{-# OPTIONS_GHC -XNPlusKPatterns #-}

-- (c) MP-I (1998/9-2006/7) and CP (2005/6-2023/24)

module Rose where

import Cp
import BTree
import Exp  
import Data.List
import Data.Monoid

-- (1) Datatype definition -----------------------------------------------------

data Rose a = Rose a [Rose a] deriving Show

inRose = uncurry Rose

outRose (Rose a x) = (a,x)

baseRose f g = f >< map g


-- (2) Ana + cata + hylo -------------------------------------------------------

recRose g = baseRose id g

cataRose g = g . (recRose (cataRose g)) . outRose

anaRose g = inRose . (recRose (anaRose g) ) . g

hyloRose h g = cataRose h . anaRose g

-- (3) Map ---------------------------------------------------------------------

instance Functor Rose
         where fmap f = cataRose ( inRose . baseRose f id )

-- (4) Examples ----------------------------------------------------------------

-- count 

count = cataRose (succ.sum.p2)

-- sum

sumRose = cataRose (add.(id><sum))

-- mirror

mirrorRose = cataRose (inRose.(id><reverse))

-- guess what

gg = cataBTree (either (const Nothing) (Just . inRose . (id><f))) where
  f(Nothing,Nothing)=[]
  f(Nothing,Just a)=[a]
  f(Just a,Nothing)=[a]
  f(Just a,Just b)=[a,b]

---

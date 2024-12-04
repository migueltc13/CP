-- (c) MP-I (1998/9-2006/7) and CP (2005/6-2024/5)

module SList where

import Cp 

-- (1) Datatype definition -----------------------------------------------------

data SList a b = Stl b | Cons a (SList a b) deriving Show

inSList = either Stl (uncurry Cons)

outSList (Stl b)    = i1 b
outSList (Cons a s) = i2 (a,s)

baseSList z x y = z -|- x >< y

-- (2) Ana + cata + hylo -------------------------------------------------------

recSList f = baseSList id id f

cataSList g = g . recSList (cataSList g) . outSList   

anaSList g = inSList . (recSList (anaSList g) ) . g

hyloSList h g = cataSList h . anaSList g

-- (3) Map ---------------------------------------------------------------------

instance BiFunctor SList
         where bmap f g = cataSList ( inSList . baseSList g f id )

-- (3) Examples ----------------------------------------------------------------

-- uncurried conc
uconc :: ([a], [a]) -> [a]
uconc = hyloSList conquer divide
   where divide ([],ys) = i1 ys
         divide (x:xs,ys) = i2(x,(xs,ys))
         conquer = either id cons

-- ordered insert
insert :: (Ord a) => (a, [a]) -> SList a [a]
insert = anaSList f
         where f(x,[])              = i1 [x]
               f(x,a:l) | x < a     = i1 (x:(a:l))
                        | otherwise = i2(a,(x,l))
-- insert(x,[])              = [x]
-- insert(x,a:l) | x < a     = [x,a]++l
--               | otherwise = a:(insert(x,l))

--------------------------------------------------------------------------------

import Cp (i1, i2, (-|-), (><), nil, cons)                -- point-wise aux
-- import Cp (i1, i2, p1, p2, split, (-|-), (><), nil, cons) -- point-free aux

-- Point-wise aux
aux :: Eq a => [a] -> Either () (a, [a])
aux [] = i1 ()
aux (h:t) = i2 (h, filter (h /=) t)

-- Point-free aux
-- aux :: Eq a => [a] -> Either () (a, [a])
-- aux = either (const (i1 ())) (i2 . split p1 (uncurry filter')) . unconsToEither
--   where
--     unconsToEither [] = Left ()
--     unconsToEither (h:t) = Right (h, t)
--     filter' h = filter (h /=)

nub :: Eq a => [a] -> [a]
nub = either nil cons . (id -|- (id >< nub)) . aux

-- Tests
test = null (nub ([] :: [Int])) && -- equivalent: nub ([] :: [Int]) == []
       nub [1,2,3,4,1,2,3,4,1,2,3,4] == [1,2,3,4]

store c = take 10 . nub . (c:)

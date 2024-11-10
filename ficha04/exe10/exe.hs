import Cp (split, p1, p2, i1, i2, (><), singl, nil, distl)

glue :: ([(k, v)], [(k, v)]) -> [(Either k k, v)]
glue = uncurry (++) . (gluer >< gluel)
  where
    gluer = map (i1 >< id)
    gluel = map (i2 >< id)

unglue :: [(Either k k, v)] -> ([(k, v)], [(k, v)])
unglue = split (concatMap p1) (concatMap p2)
         . map (either (split singl nil) (split nil singl) . distl)

-- test
glued = ([(1, "one"), (3, "three")], [(2, "two"), (4, "four")])
unglued = [(Left 1, "one"), (Left 3, "three"), (Right 2, "two"), (Right 4, "four")]
test = print $ unglue unglued == glued && glue glued == unglued

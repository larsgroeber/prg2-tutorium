sumEven :: Int -> Int
sumEven n = sumEven' n 0 0 

sumEven' :: Int -> Int -> Int -> Int
sumEven' n current acc = if n < current then acc else 
  if current `mod` 2 == 0 
    then sumEven' n (current + 1) (acc + current) 
    else sumEven' n (current + 1) acc


f x = \y -> if y `mod` 3 == 0 then "" else x
import CaseBi.Arr
import GHC.Arr

main :: IO ()
main = do
  text <- readFile "text.txt"
  let str = map ((\x -> x `rem` 1000) . toInteger . length) . lines . filter (\x -> x == '\n' || (x >= 'A' && x <= 'z')) $ text
      r = (0,(listArray (0,1000) . zip [0..1000] $ [6000,5998..0])::Array Int (Integer,Integer))
  print . sum . map (getBFst' r) $ str

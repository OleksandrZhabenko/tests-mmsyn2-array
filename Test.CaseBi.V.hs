import CaseBi (getBFst')
import qualified Data.Vector as V

main :: IO ()
main = do
  text <- readFile "text.txt"
  let str = map ((\x -> x `rem` 1000) . toInteger . length) . lines . filter (\x -> x == '\n' || (x >= 'A' && x <= 'z')) $ text
      r = (0,V.fromList . zip [0..10000] $ [6000,5998..0])
  print . sum . map (getBFst' r) $ str

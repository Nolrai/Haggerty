{-# LANGUAGE RebindableSyntax, PartialTypeSignatures #-}
module Main where

import Copilot.Arduino
import Copilot.Arduino.Uno
import GHC.Bits

instance (Bounded t, Typed t) => Bounded (Stream t) where
  minBound = constant minBound
  maxBound = constant maxBound

main :: IO ()
main = arduino $ do
  time <- input millis :: Sketch (Behavior Word32)
  let time16 = time .&. 0x0000FFFF
  let value = unsafeCast time16 / 10000
  led =: blinking
  delay =: if blinking then 

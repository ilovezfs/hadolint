module Hadolint.Formatter (formatCheck) where

import Control.Monad
import Hadolint.Rules
import Hadolint.Syntax

formatCheck :: Check -> String
formatCheck (Check metadata source linenumber _) = formatPos source linenumber ++ code metadata ++ " " ++ message metadata

formatPos :: Filename -> Linenumber -> String
formatPos source linenumber = if linenumber >= 0
                              then source ++ ":" ++ show linenumber ++ " "
                              else source ++ " "

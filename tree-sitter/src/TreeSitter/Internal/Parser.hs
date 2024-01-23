module TreeSitter.Internal.Parser (Parser(..)) where

import Foreign.ForeignPtr
import TreeSitter.Raw.Parser

newtype Parser = Parser (ForeignPtr TSParser)

module TreeSitter.Internal.Language (Language (..)) where

import Foreign

import TreeSitter.Raw.Types

newtype Language = Language ({- Not owned by Haskell -} Ptr TSLanguage)

module TreeSitter.Raw.Types (
  TSTreeCursor
, TSLanguage
, TSSymbolType
, TSNode
, TSInputEdit
, TSPoint
, TSFieldId
, TSParser
, TSRange
, TSQuery
, TSQueryCursor
, TSQueryMatch
, TSTree
, TSLogger
, TSQuantifier
, TSSymbol
, malloc_node
, malloc_point
, malloc_range
, new_range
, new_point
) where

import Foreign

data TSTreeCursor
data TSLanguage
type TSSymbolType = Int
data TSNode
data TSInputEdit
data TSPoint
type TSFieldId = Word16
data TSParser
data TSRange
data TSQuery
data TSQueryCursor
data TSQueryMatch
data TSTree
data TSLogger
data TSQuantifier
type TSSymbol = Word16

foreign import ccall safe "malloc_node" malloc_node :: IO (Ptr TSNode)
foreign import ccall safe "malloc_point" malloc_point :: IO (Ptr TSPoint)
foreign import ccall safe "malloc_range" malloc_range :: IO (Ptr TSRange)

foreign import ccall safe "new_range" new_range :: Ptr TSPoint -> Ptr TSPoint -> Word32 -> Word32 -> Ptr TSRange
foreign import ccall safe "new_point" new_point :: Word32 -> Word32 -> Ptr TSPoint

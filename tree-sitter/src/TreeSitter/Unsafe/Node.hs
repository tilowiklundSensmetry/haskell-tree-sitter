module TreeSitter.Unsafe.Node
( Node
, childCount
, endByte
, equal
, hasChanges
, hasError
, isExtra
, isMissing
, isNamed
, isNull
, namedChildCount
, startByte
, string
, nodeType
, symbol
, childByFieldId
, childByFieldName
, child
, firstChild
, descendantForByteRange
, descendantForPointRange
, endPoint
, firstChildForByte
, firstNamedChildForByte
, namedChild
, firstNamedChild
, namedDescendantForByteRange
, namedDescendantForPointRange
, nextNamedSibling
, nextSibling
, parent
, prevNamedSibling
, prevSibling
, startPoint
) where

import Foreign
import Foreign.C
--import Foreign.ForeignPtr

import TreeSitter.Symbol

import TreeSitter.Raw.Types
import TreeSitter.Raw.Allocation
import TreeSitter.Raw.Node
import TreeSitter.Internal.Node
-- import TreeSitter.Raw.Node

newtype Point = Point (ForeignPtr TSPoint)
newtype FieldId = FieldId TSFieldId

liftUnaryNodeFunctionP :: (Ptr TSNode -> Ptr TSNode -> IO a) -> Node -> IO (Maybe Node)
liftUnaryNodeFunctionP op (Node nodeForeignPtr) = do
    outPtr <- malloc_node
    withForeignPtr nodeForeignPtr $ \nodePtr -> do
        _ <- op nodePtr outPtr
        childIsNull <- ts_node_is_null_p outPtr
        outForeignPtr <- newForeignPtr p_ts_free outPtr
        return $ if childIsNull then Nothing else (Just (Node outForeignPtr))

liftUnaryNodeFunction :: (Ptr TSNode -> IO a) -> Node -> IO a
liftUnaryNodeFunction f (Node nodeForeignPtr) = withForeignPtr nodeForeignPtr f

liftBinaryNodeFunction :: (Ptr TSNode -> Ptr TSNode -> IO a) -> Node -> Node -> IO a
liftBinaryNodeFunction f (Node nodeForeignPtr) (Node nodeForeignPtr') = 
    withForeignPtr nodeForeignPtr $ \nodePtr ->
        withForeignPtr nodeForeignPtr' $ \nodePtr' -> 
            f nodePtr nodePtr'

childCount :: Node -> IO Word32
childCount = liftUnaryNodeFunction ts_node_child_count_p

endByte :: Node -> IO Word32
endByte = liftUnaryNodeFunction ts_node_end_byte_p

equal :: Node -> Node -> IO Bool
equal = liftBinaryNodeFunction ts_node_eq_p

hasChanges :: Node -> IO Bool
hasChanges = liftUnaryNodeFunction ts_node_has_changes_p

hasError :: Node -> IO Bool
hasError = liftUnaryNodeFunction ts_node_has_error_p

isExtra :: Node -> IO Bool
isExtra = liftUnaryNodeFunction ts_node_is_extra_p

isMissing :: Node -> IO Bool
isMissing = liftUnaryNodeFunction ts_node_is_missing_p

isNamed :: Node -> IO Bool
isNamed = liftUnaryNodeFunction ts_node_is_named_p

isNull :: Node -> IO Bool
isNull = liftUnaryNodeFunction ts_node_is_null_p

namedChildCount :: Node -> IO Word32
namedChildCount = liftUnaryNodeFunction ts_node_named_child_count_p

startByte :: Node -> IO Word32
startByte = liftUnaryNodeFunction ts_node_start_byte_p

string :: Node -> IO String
string node = do
    cstr <- liftUnaryNodeFunction ts_node_string_p node
    str <- peekCString cstr
    ts_free cstr
    return str

nodeType :: Node -> IO String
nodeType node = do
    cstr <- liftUnaryNodeFunction ts_node_type_p node
    str <- peekCString cstr
    ts_free cstr
    return str

symbol :: Node -> IO TSSymbol
symbol = liftUnaryNodeFunction ts_node_symbol_pr

{- Moved _self argument last -}
childByFieldId :: FieldId -> {- Call by value -} Node -> IO (Maybe Node)
childByFieldId (FieldId fieldId) = liftUnaryNodeFunctionP (\nodePtr outPtr -> ts_node_child_by_field_id_pr nodePtr fieldId outPtr)

{- Moved _self argument last -}
childByFieldName :: String -> Word32 -> {- Call by value -} Node -> IO (Maybe Node)
childByFieldName fn nth node = 
    withCString fn $ \cstr -> 
        liftUnaryNodeFunctionP (\nodePtr outPtr -> ts_node_child_by_field_name_pr nodePtr cstr nth outPtr) node

{- Moved _self argument last -}
child :: Word32 -> {- Call by value -} Node -> IO (Maybe Node)
child nth = liftUnaryNodeFunctionP (\nodePtr outPtr -> ts_node_child_pr nodePtr nth outPtr)

firstChild :: Node -> IO (Maybe Node)
firstChild = child 0

{- Moved _self argument last -}
descendantForByteRange :: Word32 -> Word32 -> {- Call by value -} Node -> IO (Maybe Node)
descendantForByteRange x y = liftUnaryNodeFunctionP (\nodePtr outPtr -> ts_node_descendant_for_byte_range_pr nodePtr x y outPtr)

{- Moved _self argument last -}
descendantForPointRange :: {- Call by value -} Point -> {- Call by value -} Point -> {- Call by value -} Node -> IO (Maybe Node)
descendantForPointRange (Point pointForeignPtr1) (Point pointForeignPtr2) node = 
    withForeignPtr pointForeignPtr1 $ \pointPtr1 ->
        withForeignPtr pointForeignPtr2 $ \pointPtr2 ->
            liftUnaryNodeFunctionP (\nodePtr outPtr -> ts_node_descendant_for_point_range_pr nodePtr pointPtr1 pointPtr2 outPtr) node

endPoint :: {- Call by value -} Node -> IO Point
endPoint node = do
    pointPtr <- malloc_point
    _ <- liftUnaryNodeFunction (\nodePtr -> ts_node_end_point_pr nodePtr pointPtr) node
    Point <$> newForeignPtr p_ts_free pointPtr

{- Moved _self argument last -}
firstChildForByte :: Word32 -> {- Call by value -} Node -> IO (Maybe Node)
firstChildForByte x = liftUnaryNodeFunctionP (\nodePtr outPtr -> ts_node_first_child_for_byte_pr nodePtr x outPtr)

{- Moved _self argument last -}
firstNamedChildForByte :: Word32 -> {- Call by value -} Node -> IO (Maybe Node)
firstNamedChildForByte x = liftUnaryNodeFunctionP (\nodePtr outPtr -> ts_node_first_named_child_for_byte_pr nodePtr x outPtr)

{- Moved _self argument last -}
namedChild :: Word32 -> {- Call by value -} Node -> IO (Maybe Node)
namedChild nth = liftUnaryNodeFunctionP (\nodePtr outPtr -> ts_node_named_child_pr nodePtr nth outPtr)

firstNamedChild :: Node -> IO (Maybe Node)
firstNamedChild = namedChild 0

{- Moved _self argument last -}
namedDescendantForByteRange :: Word32 -> Word32 -> {- Call by value -} Node -> IO (Maybe Node)
namedDescendantForByteRange x y = liftUnaryNodeFunctionP (\nodePtr outPtr -> ts_node_named_descendant_for_byte_range_pr nodePtr x y outPtr)

namedDescendantForPointRange :: {- Call by value -} Point -> {- Call by value -} Point -> {- Call by value -} Node -> IO (Maybe Node)
namedDescendantForPointRange (Point pointForeignPtr1) (Point pointForeignPtr2) node =
    withForeignPtr pointForeignPtr1 $ \pointPtr1 -> 
        withForeignPtr pointForeignPtr2 $ \pointPtr2 -> 
            liftUnaryNodeFunctionP (\nodePtr outPtr -> ts_node_named_descendant_for_point_range_pr nodePtr pointPtr1 pointPtr2 outPtr) node

nextNamedSibling :: {- Call by value -} Node -> IO (Maybe Node)
nextNamedSibling = liftUnaryNodeFunctionP ts_node_next_named_sibling_pr

nextSibling :: {- Call by value -} Node -> IO (Maybe Node)
nextSibling = liftUnaryNodeFunctionP ts_node_next_sibling_pr

parent :: {- Call by value -} Node -> IO (Maybe Node)
parent = liftUnaryNodeFunctionP ts_node_parent_pr

prevNamedSibling :: {- Call by value -} Node -> IO (Maybe Node)
prevNamedSibling = liftUnaryNodeFunctionP ts_node_prev_named_sibling_pr

prevSibling :: {- Call by value -} Node -> IO (Maybe Node)
prevSibling = liftUnaryNodeFunctionP ts_node_prev_sibling_pr

startPoint :: {- Call by value -} Node -> IO Point
startPoint node = do
    pointPtr <- malloc_point
    _ <- liftUnaryNodeFunction (\nodePtr -> ts_node_start_point_pr nodePtr pointPtr) node
    Point <$> newForeignPtr p_ts_free pointPtr

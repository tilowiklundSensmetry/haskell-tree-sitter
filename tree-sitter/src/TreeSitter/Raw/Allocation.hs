module TreeSitter.Raw.Allocation (
  ts_malloc
, ts_calloc
, ts_realloc
, ts_free
, p_ts_malloc
, p_ts_calloc
, p_ts_realloc
, p_ts_free
) where

import Foreign
import Foreign.C

foreign import ccall safe "the_ts_malloc" ts_malloc :: CSize -> IO (Ptr a)
foreign import ccall safe "the_ts_calloc" ts_calloc :: Word32 -> CSize -> IO (Ptr a)
foreign import ccall safe "the_ts_realloc" ts_realloc :: Ptr a -> CSize -> IO (Ptr a)
foreign import ccall safe "the_ts_free" ts_free :: Ptr a -> IO ()

foreign import ccall safe "&the_ts_malloc" p_ts_malloc :: FunPtr (CSize -> IO (Ptr a))
foreign import ccall safe "&the_ts_calloc" p_ts_calloc :: FunPtr (Word32 -> CSize -> IO (Ptr a))
foreign import ccall safe "&the_ts_realloc" p_ts_realloc :: FunPtr (Ptr a -> CSize -> IO (Ptr a))
foreign import ccall safe "&the_ts_free" p_ts_free :: FunPtr (Ptr a -> IO ())
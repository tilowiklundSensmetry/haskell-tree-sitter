{-# LANGUAGE TemplateHaskell #-}
module TreeSitter.Raw.Language
( module TreeSitter.Symbol
, ts_language_symbol_name
, ts_language_symbol_for_name
, ts_language_field_count
, ts_language_symbol_count
, ts_language_version
, ts_language_symbol_type
, ts_language_field_id_for_name_pr
, ts_language_symbol_for_name_pr
) where

-- import           Data.Ix (Ix)
-- import           Data.List (mapAccumL)
-- import qualified Data.Set as Set
-- import           Data.Traversable (for)
import           Data.Word
import           Foreign.C.String
import           Foreign.Ptr
-- import           Language.Haskell.TH
-- import           Language.Haskell.TH.Syntax
-- import           System.Directory
-- import           System.FilePath.Posix
import           TreeSitter.Symbol

import TreeSitter.Raw.Types

foreign import ccall safe "ts_language_symbol_name" ts_language_symbol_name :: Ptr TSLanguage -> TSSymbol -> IO CString
foreign import ccall safe "ts_language_symbol_for_name" ts_language_symbol_for_name :: Ptr TSLanguage -> CString -> Int -> Bool -> IO TSSymbol

-- Plain

foreign import ccall safe "ts_language_field_count" ts_language_field_count :: Ptr TSLanguage -> IO Word32
foreign import ccall safe "ts_language_symbol_count" ts_language_symbol_count :: Ptr TSLanguage -> IO Word32
foreign import ccall safe "ts_language_version" ts_language_version :: Ptr TSLanguage -> IO Word32

-- Call by value and return by value wrap

foreign import ccall safe "ts_language_symbol_type" ts_language_symbol_type :: Ptr TSLanguage -> TSSymbol -> IO TSSymbolType

-- Return by value wrap

foreign import ccall safe "ts_language_field_id_for_name_pr" ts_language_field_id_for_name_pr :: Ptr TSLanguage -> CString -> Word32 -> {- Out -} Ptr TSFieldId -> IO ()
foreign import ccall safe "ts_language_symbol_for_name_pr" ts_language_symbol_for_name_pr :: Ptr TSLanguage -> CString -> Word32 -> Bool -> {- Out -} Ptr TSSymbol -> IO ()

{-
-- | TemplateHaskell construction of a datatype for the referenced Language.
mkSymbolDatatype :: Name -> Ptr TSLanguage -> Q [Dec]
mkSymbolDatatype name language = do
  symbols <- renameDups . map ((,) . fst <*> uncurry symbolToName) . (++ [(Regular, "ParseError")]) <$> runIO (languageSymbols language)
  Module _ modName <- thisModule
  let mkMatch symbolType str = match (conP (Name (OccName str) (NameQ modName)) []) (normalB [e|symbolType|]) []
  datatype <- dataD (pure []) name [] Nothing (flip normalC [] . mkName . snd <$> symbols)
    [ derivClause Nothing (map conT [ ''Bounded, ''Enum, ''Eq, ''Ix, ''Ord, ''Show ]) ]
  symbolInstance <- [d|
    instance Symbol $(conT name) where
      symbolType = $(lamCaseE (uncurry mkMatch <$> symbols)) |]
  pure (datatype : symbolInstance)

renameDups :: [(a, String)] -> [(a, String)]
renameDups = snd . mapAccumL go mempty
  where go done (ty, name) = let name' = rename name in (Set.insert name' done, (ty, name'))
          where rename name | name `Set.member` done = rename (name ++ "'")
                            | otherwise              = name

-- https://stackoverflow.com/questions/16163948/how-do-i-use-templatehaskells-adddependentfile-on-a-file-relative-to-the-file-b
addDependentFileRelative :: FilePath -> Q [Dec]
addDependentFileRelative relativeFile = do
    currentFilename <- loc_filename <$> location
    pwd             <- runIO getCurrentDirectory

    let invocationRelativePath = takeDirectory (pwd </> currentFilename) </> relativeFile

    addDependentFile invocationRelativePath

    return []


languageSymbols :: Ptr TSLanguage -> IO [(SymbolType, String)]
languageSymbols language = ts_language_symbol_count language >>= \ count -> for [0..fromIntegral (pred count)] $ \ symbol -> do
  cname <- ts_language_symbol_name language symbol
  name <- peekCString cname
  ty <- toEnum <$> ts_language_symbol_type language symbol
  pure (ty, name)
-}

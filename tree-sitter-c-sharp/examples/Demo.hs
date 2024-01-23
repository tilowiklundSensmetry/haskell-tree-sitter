{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
module Main (main) where

import           TreeSitter.Parser
import           TreeSitter.Language
import           TreeSitter.Tree
import           TreeSitter.CSharp
import           TreeSitter.Node
import           Foreign.C.String
import           Foreign.Ptr                    ( Ptr
                                                , nullPtr
                                                 )
import           Foreign.Marshal.Alloc          ( malloc
                                                )
import           Foreign.Marshal.Array          ( mallocArray )
import           Foreign.Storable               ( peek
                                                , peekElemOff
                                                , poke
                                                )
-- import           Foreign.Marshal.Utils          ( new )
import           Control.Monad
-- 

main :: IO ()
main = do
  parser <- ts_parser_new

  print =<< ts_language_version tree_sitter_c_sharp 
  print =<< ts_parser_set_language parser tree_sitter_c_sharp

  let source =
        "using System;\n\nnamespace ConsoleApplication1\n{\n    class Program\n    {\n        static void Main(string[] args)\n        {\n            Console.WriteLine(\"Hello world!\");\n        }\n    }\n}"

  (str, len) <- newCStringLen source
  tree       <- ts_parser_parse_string parser nullPtr str len

  print tree

  n          <- malloc
  ts_tree_root_node_p tree n

  putStrLn "module (root) ------------"
  Node {..} <- peek n
  let childCount = fromIntegral nodeChildCount

  children <- mallocArray childCount
  tsNode   <- malloc
  poke tsNode nodeTSNode
  ts_node_copy_child_nodes tsNode children

  printChildren children childCount

  putStrLn "where ------------"
  Node {..} <- peekElemOff children 3
  let nextChildCount = fromIntegral nodeChildCount

  nextChildren <- mallocArray nextChildCount
  nextTsNode   <- malloc
  poke nextTsNode nodeTSNode
  ts_node_copy_child_nodes nextTsNode nextChildren

  printChildren nextChildren nextChildCount

  putStrLn "END"

printChildren :: Ptr Node -> Int -> IO ()
printChildren children count = forM_
  [0 .. count - 1]
  (\n -> do
    child <- peekElemOff children n
    printNode child
  )

printNode :: Node -> IO ()
printNode n@(Node {..}) = do
  theType <- peekCString nodeType
  let TSPoint {..} = nodeStartPoint n
      start        = "(" ++ show pointRow ++ "," ++ show pointColumn ++ ")"
  let TSPoint {..} = nodeEndPoint
      end          = "(" ++ show pointRow ++ "," ++ show pointColumn ++ ")"
  print $ theType ++ start ++ "-" ++ end

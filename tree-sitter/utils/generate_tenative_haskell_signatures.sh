jq -r '{F:.F, P:.P | join(" -> "), R:.R} | "\(.F) :: \(.P) -> IO \(.R)"' tree_sitter_functions.json | sed -e 's|const ||g' | sed -e 's|char \* *|CString |g' | sed -e 's|uint32_t|Word32|g' | sed -e 's|void|()|g' | sed -e 's|bool|Bool|g' | sed -e 's|\(\w*\) *\* *|Ptr \1 |g' | sed -e 's|uint64_t|Word64|g' | sed -e 's|int64_t|Int64|g' | sed -e 's#\(::\|->\) *\(Ptr \+\)\?\(IO \+\)\?\(\w\+ \+\) *[a-z_]* *#\1 \2\3\4#g' | sort -u > tmp_tentative.hs

grep -e '\(-> IO TS\w*$\)' tmp_tentative.hs > tmp_require_wrap_out.hs
grep -e '\(\(::\|->\) TS\w* ->\)' tmp_tentative.hs > tmp_require_wrap_in.hs

cat tmp_require_wrap_*.hs | sort -u > tmp_require_wrap.hs

comm -23 tmp_require_wrap_in.hs tmp_require_wrap_out.hs > require_wrap_in.hs
comm -13 tmp_require_wrap_in.hs tmp_require_wrap_out.hs > require_wrap_out.hs
comm -12 tmp_require_wrap_in.hs tmp_require_wrap_out.hs > require_wrap_inout.hs

comm -23 tmp_tentative.hs tmp_require_wrap.hs > require_no_wrap.hs

grep -Fe '_delete ::' tmp_tentative.hs | sed -e 's|^\(.*\) :: \(.*\)$|p_\1 :: FunPtr (\2)|' > require_pointer.hs

rm tmp_*.hs

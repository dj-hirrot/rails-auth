# rails-auth
`devise` や `sorcery` 等の認証用のGemを使用せずに, なるべく素の `Rails` で認証ロジックを実装しました.
追加したGems
- bootstrap-sass
    - CSSのFW, Bootstrapを使用するため
- bcrypt
    - ハッシュ化関数を使用するため (`has_secure_password` を使用する際に必要)

# TODO
- [x] `signup`
- [x] `login`
- [x] `use vue`
- [ ] `confirmation`


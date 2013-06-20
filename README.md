SubscriptExtension
==================

Objective-Cの添字の指定を拡張するライブラリ。

* Rubyの添字記述のような拡張。
* Cocoa Frameworkのクラスを使った拡張。

今後の予定
------------------

* プロジェクトファイルの整理。
* 便利そうな書き方があれば随時追加。

Examples
------------------
### NSArray
    NSArray * items = @[@"a", @"b", @"c"]
#### 負の値の指定
    items[-1]; -> @"c"
#### NSNumberでの指定
    items[@0]; -> @"a"
#### Rubyのような開始位置と長さの指定
    items[@"1,1"]; -> @[@"b"]
    items[@"1,"]; -> @[@"b", @"c"]
    items[@",1"]; -> @[@"a"]
#### Rubyのような開始位置と終了位置の指定
    items[@"0..1"]; -> @[@"a", @"b"]
    items[@"0...1"]; -> @[@"a"]
#### NSArrayでの指定
    items[@[@0, @1]]; -> @[@"a"]
    items[@[@1]]; -> @[@"b", @"c"]
#### NSPredicateでの指定
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF='a'"];
    items[pred]; -> @["a"]
### NSString
#### インデックス指定でのアクセス
    @"こんにちは"[-1]; -> @"は"
#### Rubyのような開始位置と長さの指定
    @"こんにちは"[@"2,2"]; -> @"にち"
    @"こんにちは"[@"2,"]; -> @"にちは"
    @"こんにちは"[@",2"]; -> @"こん"
#### Rubyのような開始位置と終了位置の指定
    @"こんにちは"[@"0..2"]; -> @"こんに"
    @"こんにちは"[@"0...2"]; -> @"こん"
#### Rubyのようなパターンマッチの指定
    @"こんにちは"[@"/こん/"]; -> @"こん"
    @"abc123def"[@"/[0-9]+/"]; -> @"123"
#### NSRegularExpressionの指定
    NSRegularExpression * regexp = [NSRegulerExpression regularExpressionWithPattern:@"[0-9]+"
                                                                             options:0
                                                                               error:nil];
    @"abc123def"[regexp]; -> @"123"

### NSMutableArray
    NSMutableArray * items = @[@"a", @"b", @"c"];
#### 負の値を指定した代入
    items[-2] = @"text";
    items; -> @[@"a", @"text", @"c"]
#### 開始位置と終了位置を指定した代入
    items[@"0..1"] = @[@"abc", @"def"];
    items; -> @[@"abc", @"def", @"c"]
#### 開始位置と長さを指定した代入
    items[@"0,2"] = @[@"abc", @"def"];
    items; -> @[@"abc", @"def", @"c"]
#### NSArrayを指定した代入
    items[@[@0,@2]] = @[@"abc", @"def"];
    items; -> @[@"abc", @"def", @"c"]
    items[@[@0]] = @[@"abc", @"def"];
    items; -> @[@"abc", @"def", @"c"]

### NSMutableString
    NSMutableString * text = @"hello world".mutableCopy;
#### 負の値を指定した代入
    text[-2] = @"-";
    text; -> @"hello wor-d"
#### 開始位置と長さを指定した代入
    text[@"0,2"] = @"--";
    text; -> @"h--lo world"
    text[@"0,2"] = @"-";
    text; -> @"h-lo world"
#### 開始位置と終了位置を指定した代入
    text[@"0...2"] = @"--";
    text; -> @"--llo world"
#### 正規表現形式のNSStringを指定した代入
    text[@"/[hw]/"] = @"-";
    text; -> @"-ello -orld"
#### NSRegularExpressionを指定した代入
    NSRegularExpression * regexp = [NSRegulerExpression regularExpressionWithPattern:@"[hw]"
                                                                             options:0
                                                                               error:nil];
    text[regexp] = @"-";
    text; -> @"-ello -orld"

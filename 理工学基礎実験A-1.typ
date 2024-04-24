#import "template.typ": *

#show: project.with(
  title: "アナログ演算回路",
  author: "田中 太郎",
  coExperimenter: ("鈴木 一郎", "佐藤 花子"),
  experimentDateTime: "2024年4月19日",
  experimentDayOfWeek: "金",
  experimentPartOfDay: "午前",
  fillingDateTime: "2024年4月25日 18時30分",
  ReFillingDateTime: "",
  department: "電気情報学科",
  class: "D",
  studentId: "67890123",
)


// start page number
#set page(numbering: "1", number-align: center)
#counter(page).update(1)

= いろいろな例

ここでは、論文の表紙および本体の記述方法について述べる。

== 表

表を描画する例を @figure_table に示す。

#figure(
  table(
    columns: 2,
    [*西暦*], [*和暦*],
    [2023年], [令和5年],
    [2024年], [令和6年],
  ),
  caption: [表の例],
) <figure_table>

== 脚注

本テンプレートはTypst #footnote[https://typst.app/] 用に作られており、@typst-keio-b2-template で配布されている。

#[
  #set text(lang: "en")
  #bibliography(title: "参考文献", style:"ieee", "理工学基礎実験A-1.yaml")
]

#import "@preview/physica:0.9.2": *

#let textL = 1.8em
#let textM = 1.6em
#let font = ("Hiragino Kaku Gothic ProN")

#let reportInfo(
  title: "",
  experimentDateTime: "",
  experimentDayOfWeek: "",
  experimentPartOfDay: "",
) = {
  table(
    align: center + horizon,
    columns: (0.3fr, 1fr),
    inset: 8pt,
    [実験日],
    [
      #experimentDateTime #h(0.5cm) (#experimentDayOfWeek) (#experimentPartOfDay)
    ],
    [実験題目],
    [#title],
  )
}

#let authorInfo(
  author: "",
  department: "",
  class: "",
  studentId: "",
) = {
  rect(
    stroke: (
      bottom: 1.5pt,
      top: 1.5pt,
      left: 1.5pt,
      right: 1.5pt,
    ),
    height: auto,
    width: 100%,
    inset: 0pt,
    grid(
      [
        #table(
          align: center + horizon,
          columns: (1.5cm, 1fr, 2cm, 1.5cm, 2.5cm, 3cm),
          inset: 8pt,
          [学科],
          [#department],
          [クラス],
          [#class],
          [学籍番号],
          [#studentId],
        )
      ],
      [
        #table(
          align: center + horizon,
          columns: (0.3fr, 1fr),
          inset: 16pt,
          [*報告者氏名*],
          [#text(textM)[#author]],
        )
      ],
    ),
  )
}

#let coExperimenterInfo(valuse) = {
  grid(
    stroke: (
      bottom: 1pt,
      top: 1pt,
      left: 1pt,
      right: 1.5pt,
    ),
    columns: (0.3fr, 1fr),
    [
      #align(horizon)[
        共同実験者
      ]
    ],
    stack(..for v in valuse {
      (rect(width: 100%, inset: 8pt, [#v]),)
    }),
  )
}

#let fillingInfo(
  fillingDateTime: "",
  ReFillingDateTime: "",
) = {
  table(
    align: center + horizon,
    columns: (0.3fr, 1fr),
    inset: 8pt,
    [提出日],
    [#fillingDateTime],
    [再提出日],
    [#ReFillingDateTime],
  )
}

#let climateInfo(
  temperature: "",
  humidity: "",
  atomosphericPressure: "",
) = {
  align(left)[
    #block(width: 40%)[
      #table(
        align: center + horizon,
        columns: (0.3fr, 1fr),
        inset: 8pt,
        [気温],
        [$#temperature degree.c$],
        [湿度],
        [$#humidity percent$],
        [気圧],
        [$#atomosphericPressure "hPa"$],
      )
    ]
  ]
}

#let project(
  title: "",
  author: "",
  coExperimenter: none,
  experimentDateTime: none,
  experimentDayOfWeek: none,
  experimentPartOfDay: none,
  fillingDateTime: none,
  ReFillingDateTime: none,
  department: none,
  class: none,
  studentId: none,
  temperature: "",
  humidity: "",
  atomosphericPressure: "",
  body,
) = {
  set document(author: author, title: title)

  // start page number
  set page(numbering: "1", number-align: center)
  counter(page).update(1)

  // Font
  set text(font: font, lang: "ja")

  // Heading
  set heading(numbering: (..nums) => {
    if nums.pos().len() > 1 {
      nums.pos().map(str).join(".") + " "
    } else {
      text(cjk-latin-spacing: none)[#str(nums.pos().first()) ]
      h(1em)
    }
  })
  show heading: set text(font: font, weight: "bold", lang: "ja")
  show heading.where(level: 1): it => {
    set text(size: 1.2em)
    pad(top: 1em, bottom: 1em)[
      #it
    ]
  }
  show heading.where(level: 2): it => pad(top: 1em, bottom: 0.6em, it)
  show heading.where(level: 3): it => pad(top: 0.6em, bottom: 0.6em, it)

  // Figure
  show figure: it => pad(y: 1em, it)
  show figure.caption: it => pad(top: 0.5em, it)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure: set block(breakable: true)

  // Outline
  show outline.entry: set text(font: font, lang: "ja")
  show outline.entry.where(level: 1): it => {
    v(0.2em)
    set text(weight: "semibold")
    it
  }

  // Math
  set math.equation(numbering: "(1)")

  align(center)[
    #v(6em)

    #block(text(textL, "理工学基礎実験レポート"))

    #v(4em)

    #reportInfo(
      title: title,
      experimentDateTime: experimentDateTime,
      experimentDayOfWeek: experimentDayOfWeek,
      experimentPartOfDay: experimentPartOfDay,
    )

    #v(2em)

    #authorInfo(
      author: author,
      department: department,
      class: class,
      studentId: studentId,
    )

    #v(2em)

    #coExperimenterInfo(coExperimenter)

    #v(2em)

    #fillingInfo(fillingDateTime: fillingDateTime, ReFillingDateTime: ReFillingDateTime)

    #v(2em)

    #climateInfo(temperature: temperature, humidity: humidity, atomosphericPressure: atomosphericPressure)
  ]

  pagebreak(weak: true)

  set par(justify: true)
  body
}

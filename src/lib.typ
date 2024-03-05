#let document(body) = {
  // text & paragraph
  set text(font: "IBM Plex Sans JP")
  set par(justify: true, leading: 0.85em)

  // heading
  show heading.where(level: 1): (it) => {
    pad(y: 3pt, block(
      breakable: false,
      width: 100%,
      inset: (bottom: 5pt),
      stroke: (bottom: 1pt + black),
      text(weight: 300, it),
    ))
  }
  show heading.where(level: 2): (it) => {
    pad(y: 3pt, block(
      breakable: false,
      inset: (bottom: 5pt),
      stroke: (bottom: 1.5pt + black),
      text(weight: 600, it),
    ))
  }
  show heading: (it) => {
    if it.level <= 2 {
      return it
    }
    let heading_sign = {
      text(fill: luma(60%), size: 0.7em, weight: 200)[h#it.level;. ]
    }
    pad(
      y: 3pt,
      block(
        breakable: false,
        [
          #grid(columns: 2)[
            #place(right + bottom, text(fill: luma(70%))[#heading_sign#h(0.5em)])
          ][
            #text(weight: 600, it.body)
          ]
        ],
      ),
    )
  }

  // list & enum & term
  set list(
    indent: 0.8em,
    marker: place(center, dy: 0.25em)[#circle(radius: 1.5pt, fill: black)],
  )

  body
}

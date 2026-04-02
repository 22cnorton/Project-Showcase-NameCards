#import "@preview/tiaoma:0.3.0"
#set page(paper: "us-letter", margin: (x: 0.5in, y: 0in), flipped: true)
// #set text(size: 12pt)
#let data = csv("names_2.csv")
#let empty-link = ""

#let namecard(name, role, link) = {
  grid(
    columns: (3.5fr, 1fr),
    rows: (1fr, 1fr, 1fr),
    // stroke: black,
    grid.cell(y: 1, colspan: if link == empty-link { 2 } else { 1 })[
      #align(center + horizon)[
        #text(6em, weight: "bold")[#name]
        #linebreak()
        #linebreak()
        #text(3.5em, style: "italic")[#role]
      ]
    ],

    if link != empty-link {
      grid.cell(y: 1, inset: 0.5em)[
        #align(right + horizon)[
          #tiaoma.qrcode(link, options: (
            scale: 5.0,
          ))
        ]
      ]
    },
  )
}

#for row in data.slice(1) {
  namecard(row.at(0), row.at(1), row.at(2))
}

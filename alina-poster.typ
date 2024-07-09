/**
 *
 * Alina Poster Template
 *
 * Version: 0.0.1
 * License: CC-BY-SA 4.0 International
 * Author: Jérémy La Scala <jeremy.lascala@epfl.ch>
 */


#let palette = (
  primary: (
    main: color.rgb("#5C4DCB"),
    container: color.rgb("#BEB9E6"),
    onContainer: color.rgb("#171333"),
  ),
  secondary: (
    main: color.rgb("#A3B08D"),
    container: color.rgb("#E0E6D7"),
    onContainer: color.rgb("#2F3329"),
  ),
)

#let display_authors(authors: array) = {
  set text(size: 32pt, fill: palette.primary.container)

  let affiliations = ()
  for author in authors {
    if "affiliation" in author {
      affiliations.push(author.affiliation)
    }
  }
  affiliations = affiliations.dedup()

  let nbrOfAuthors = authors.len()
  let authorNbr = 0
  
  block(above: 2em, below: 1em, [
    #for author in authors {
      let affiliationNbr = none
      if "affiliation" in author {
        affiliationNbr = affiliations.position(a => a == author.affiliation) + 1
      }
      let correspondingAuthorSymbol = if "correspondingAuthor" in author {
        if author.correspondingAuthor { 
          [#sym.ast.basic]
        } else { none } }
        else { none }
      let terminationString = if authorNbr < nbrOfAuthors - 1 {
        ", "
      } else {
        none
      }
      [#author.name#super[#affiliationNbr]#correspondingAuthorSymbol#terminationString]
      authorNbr = authorNbr + 1
    }
  ])
  block(above: 1em, below: 2em, [
    #let nbrOfAffiliations = affiliations.len()
    #let affiliationNbr = 0
    #for affiliation in affiliations {
      let terminationString = if affiliationNbr < nbrOfAffiliations - 1 {
        ", "
      } else {
        none
      }
      [#super[#(affiliationNbr + 1)]#affiliation#terminationString]
      affiliationNbr = affiliationNbr + 1

    }
  ])
}

#let header(
  title: none,
  authors: array,
  topAbstract: [],
) = {
  set align(left)
  set text(fill: white)
  block(fill: palette.primary.onContainer, inset: 10%, below: 0pt, height: 100%, width: 100%, [
    #heading(level: 1, text(size: 72pt, title))
    #display_authors(authors: authors)
    #par(topAbstract)
  ])
}

#let alina_footer(
  footer: [],
) = {
  set align(left)
  set text(fill: white)
  block(width: 100%, height: 100%, fill: palette.primary.onContainer, footer)
}

#let alina_content(
  content: [],
) = {
  block(width: 100%, height: 100%, above: 0pt, below: 0pt, content)
}

#let alina_block(
  title: [],
  body: [],
) = {
  set grid(gutter: 24pt)
  block(inset: 8pt, width: 100%, [
    #stack(dir: ttb, block(fill: palette.secondary.container,
    width: 100%,
    inset: 24pt,
    [
      #set align(left)
      #set text(fill: palette.secondary.onContainer)
      #set heading(numbering: "1.")
      = #title
    ]),
    block(inset: 24pt,
    width: 100%,
    fill: white,
    body)
    )
  ])
}

#let alina_ammo_bar(
  content: [],
) = {
  block(fill: palette.secondary.container, width: 100%, height: 100%, inset: 32pt, content)
}

#let alina_chip(fill: color, textFill: color, content: str) = {
  box(fill: fill, radius: 50%, inset: 0.6em, text(weight: "semibold", fill: textFill, content))
}

#let alina_highlight(content: []) = {
  set text(fill: palette.primary.onContainer)
  block(fill: palette.primary.container, inset: 1em, content)
}

#let alina_poster(
  title: none,
  authors: array,
  topAbstract: [],
  bottomAbstract: [],
  footer: [],
  body: [],
) = {
  set page("a0", margin: (left: 0pt, right: 0pt, top: 0pt, bottom: 0pt), fill: color.luma(221))
  set text(size: 24pt, font: "Helvetica Neue")
  set par(justify: true)
  block(height: 100%, width: 100%,
    grid(rows: (450pt, 100% - 700pt, 250pt), gutter: 0pt,
      header(title: title, authors: authors, topAbstract: topAbstract),
      alina_content(content: body),
      alina_footer(footer: footer),
    )
  )
}
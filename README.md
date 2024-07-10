# Alina Poster Template

This is a simple and naive template for making academic posters with Typst.

This is an ongoing, unfinished project. Use it at your own risk.

Feel free to modify it and adapt it. Please, mind the _CC-BY-SA 4.0_ license and respect the terms of it (respect attribution and share any derivatives under a compatible license).

## How to use this template?

Clone the repo or just copy the main file, `alina-poster.typ`. Then, import it in your poster.

```typst
#import "alina-poster.typ": alina_poster, alina_block, alina_ammo_bar, alina_chip, alina_highlight, palette
```

Finally, to create the poster, you can initiate it as any normal Typst template.

```typst
#show: doc => alina_poster(
  title: [Your title.],
  authors: (
    (
      name: "Jérémy La Scala",
      email: "jeremy.lascala@epfl.ch",
      affiliation: "École Polytechnique Fédérale de Lausanne",
      correspondingAuthor: true,
    ),
  ),
  topAbstract: [
    Your abstract.
  ],
  footer: footer,
  body: block(inset: 32pt, stack(dir: ttb, doc)),
)
```

### Why "Alina"?

It's simply the first name that came to my mind when choosing a name for this project. Next template will start with a B.

 <p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://github.com/swouf/alina-poster-template">Alina Poster Template</a> by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://github.com/swouf">Jérémy La Scala</a> is licensed under <a href="https://creativecommons.org/licenses/by-sa/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Creative Commons Attribution-ShareAlike 4.0 International<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1" alt=""></a></p>
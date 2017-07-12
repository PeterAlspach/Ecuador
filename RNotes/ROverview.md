R: Overview
========================================================
author: Peter Alspach
date: July 2017
autosize: true
font-family: "Times New Roman", Times, serif

***

...
<h3 style="color: darkgreen; font-size: 1.7em;" markdown="1">
R: visi&#243;n de conjunto

<img src="RLogo.jpg" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="85%" />

Why R? (1)
========================================================

* R is free and open source
* It is a scripted (rather than click-and-point) language and thus compatible with the concept of [reproducible research](https://simplystatistics.org/2014/06/06/the-real-reason-reproducible-research-is-important/)
* It has a great support community
* It is readily expandable with thousands of additional packages on [CRAN](http://cran.espol.edu.ec/) and more still on [github](https://github.com/)

***

<h3 style="color: darkgreen; font-size: 1.5em" markdown="1">
&#191;Por qu&#233; R? (1)

<h3 style="color: green;" markdown="1">

* R es libre y de c&#243;digo abierto
* Se trata de un lenguaje con gui&#243;n y, por lo tanto, compatible con [investigaci&#243;n reproducible] (https://simplystatistics.org/2014/06/06/the-real-reason-reproducible-research-is-important/)
* Tiene una gran comunidad de apoyo
* Miles de paquetes adicionales en [CRAN] (http://cran.espol.edu.ec/) y m&#225;s a&#250;n en [github] (https://github.com/)

Why R? (2)
========================================================

* There is a wealth of documentation in [various languages](http://cran.espol.edu.ec/other-docs.html#nenglish), including [Spanish](http://cran.espol.edu.ec/doc/contrib/rdebuts_es.pdf)
* There are many good online courses, some of which a free
* It is power statistical and data-science software, and many publications contain links to a relevant package

***

<h3 style="color: darkgreen; font-size: 1.5em" markdown="1">
&#191;Por qu&#233; R? (2)

<h3 style="color: green;" markdown="1">

* Documentaci&#243;n en [varios idiomas] (http://cran.espol.edu.ec/other-docs.html#nenglish), incluyendo [espa&#241;ol] (http://cran.espol.edu.ec/doc/contrib/rdebuts_es.pdf)
* Hay muchos buenos cursos en l&#237;nea, algunos de los cuales son gratis
* Es software de estad&#237;sticas de energ&#237;a y ciencia de datos, y muchas publicaciones contienen enlaces a un paquete relevante

Why R? (3)
========================================================

* It has a number of different interfaces (e.g., [RStudio](https://www.rstudio.com/) which can be [freely downloaded](https://www.rstudio.com/products/rstudio/download/))
* [R Markdown](http://rmarkdown.rstudio.com/) and [knitr](https://yihui.name/knitr/) for producing reports

***

<h3 style="color: darkgreen; font-size: 1.5em" markdown="1">
&#191;Por qu&#233; R? (3)

<h3 style="color: green;" markdown="1">

* Tiene una serie de interfaces diferentes (por ejemplo, [RStudio] (https://www.rstudio.com/) que puede ser [descargado gratuitamente] (https://www.rstudio.com/products/rstudio/download/))
* [R Markdown] (http://rmarkdown.rstudio.com/) y [knitr] (https://yihui.name/knitr/) para producir informes

What's not to like? (1)
=========================================================
* For some, it is difficult to learn - especially if they have no experience with a scripted language
* There is such a wealth of courses, documentation, packages etc it can be hard to find the right one

***

<h3 style="color: darkgreen; font-size: 1.5em" markdown="1">
&#191;Que es no gustar? (1)

<h3 style="color: green;" markdown="1">

* Para algunos, es dif&#237;cil de aprender - especialmente si no tienen experiencia con un lenguaje con gui&#243;n
* Hay una gran cantidad de cursos, documentaci&#243;n, paquetes, etc, puede ser dif&#237;cil encontrar el derecho

What's not to like? (2)
=========================================================
* It is an interpreted language and can be a little slow (e.g., in fitting complex mixed models)
* It has grown way beyond the original vision and there are some inconsistencies and design flaws which cannot now be changed
* [R-help](https://stat.ethz.ch/mailman/listinfo/r-help) can be a little brusque

***

<h3 style="color: darkgreen; font-size: 1.5em" markdown="1">
&#191;Que es no gustar? (2)

<h3 style="color: green;" markdown="1">

* Es un lenguaje interpretado y puede ser un poco lento
* Ha crecido mucho m&#225;s all&#225; de la visi&#243;n original y hay algunas inconsistencias y defectos de dise&#250;o que ahora no se pueden cambiar
* [R-ayuda] (https://stat.ethz.ch/mailman/listinfo/r-help) puede ser un poco brusco

Structure (1)
=========================================================
<h3 style="color: darkred;" markdown="1"> Note: the following is unlikely to make much sense initially</h3>

* R has two broad categories of objects
    * __Functions__ which do the work
    * __Data objects__ which store the data and results
* R functions have __arguments__ which determine precisely what work they do; e.g., mean(1:10) will give the mean of the numbers 1 to 10

***

<h3 style="color: darkgreen; font-size: 1.5em" markdown="1">
Estructura (1)

<h3 style="color: darkred; font-size: 0.97em;" markdown="1"> Nota: lo siguiente es poco probable que tenga mucho sentido inicialmente</h3>

<h3 style="color: green; font-size: 0.97em;" markdown="1">

* R tiene dos grandes categor&#237;as de objetos
    * __Funciones__ que hacen el trabajo
    * __Elementos de datos__ que almacenan los datos y los resultados
* Las funciones R tienen __argumentos__ que determinan qu&#233; trabajo hacen

Structure (2)
=========================================================
* Data objects are either __lists__ or __vectors__ (or atomic)
    * Vectors have __elements__ which must all be the same type.  They may have a dimension __attribute__, in which case they appear as matrices or array
    * Lists can be pretty much anything.  A common list is a __data.frame__, which is really a list of vectors

***

<h3 style="color: darkgreen; font-size: 1.5em" markdown="1">
Estructura (2)

<h3 style="color: green; font-size: 0.97em;" markdown="1">

* Los objetos de datos son __lists__ o __vectors__ (o at&#243;micos)
    * Los vectores tienen __elementos__ que deben ser del mismo tipo. Pueden tener una dimensi&#243;n __atributo__, en cuyo caso aparecen como matrices o matrices
    * Las listas son muy vers&#225;tiles. Una lista com&#250;n es un __data.frame__, que es una lista de vectores

Structure (3)
=========================================================
* Objects may be found in different __environments__
* R is object-oriented
* R is case sensitive

***

<h3 style="color: darkgreen; font-size: 1.5em" markdown="1">
Estructura (3)

<h3 style="color: green; font-size: 0.97em;" markdown="1">

* Los objetos se pueden encontrar en diferentes __environments__
* R est&#225; orientado a objetos
* R es sensible a may&#250;sculas y min&#250;sculas

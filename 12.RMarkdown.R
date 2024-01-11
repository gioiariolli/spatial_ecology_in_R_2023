---
title: "MarkdownReport"
author: "Gioia RIolli"
date: "2024-01-09"
output:
  html_document: default
  pdf_document: default
---

# My first markdown document

To show both the code and the results if you put eval= false than you only obtain the results without the code

Here you can add some text

```{r, eval= TRUE} 
2+3
```


Using proper packages:
```{r, eval= TRUE} 
library(imageRy)
```

```{r, eval= TRUE} 
im.list()
```

Lets import the mato grosso area image without warinings we set warning to false:
```{r, eval= TRUE, warning=FALSE} 
mato1992 <-im.import("matogrosso_l5_1992219_lrg.jpg")
```

EXERCISE
To make an RGB image with the green on the red
```{r, eval= TRUE} 
im.plotRGB(mato1992, r=2, g=1, b=3)
```
```{r, eval= TRUE} 
par(mfrow=c(2,2))
im.plotRGB(mato1992, r=1, g=2, b=3)
im.plotRGB(mato1992, r=2, g=1, b=3)
im.plotRGB(mato1992, r=3, g=1, b=2)
im.plotRGB(mato1992, r=1, g=3, b=1)
```
Calculating spectral indices:
```{r, eval= TRUE} 
library(terra)
library(viridisLite)
dvi <-mato1992[[1]]-mato1992[[2]]
viridisc <-colorRampPalette(viridis(7))(255)
plot(dvi, col=viridisc)
```
Calculating variability:

```{r, eval= TRUE} 
sd5 <- focal(mato1992[[1]], matrix(1/25, 5, 5), fun=sd)
plot(sd5, col=viridisc)
```

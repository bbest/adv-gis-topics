---
layout: home
title:
excerpt:
image:
  feature:
  teaser:
  thumb:
share: false
ads: false
toc: true
---

# Clipping and projecting with OGR

> This assumes you've read and understood [Clipping and projecting with GDAL](./GDAL.html)

In order to clip vector data with OGR, the data being clipped and the data that define the area-of-interest both need to be in the same projection. So, the first thing we need to do is project `AOI_BarkClay` into the same projection as 

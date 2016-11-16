# qq.plink: QQ plot from PLINK assoc format

Usage: 

    Rscript qq.plink.R plink.assoc "some title"

  Requires that column with P values is labeled as `P`.

  Example data:

    > write.table(data.frame(P=runif(2000000,0,1)), gzfile("p.gz", "w"), row.names=FALSE, quote=FALSE)


  Example command:

    Rscript qq.plink.R p.gz "Example QQ Plot"

  Example plot:

![Example QQ plot](https://github.com/vforget/qq.plink/blob/master/qq.png "Example QQ plot")

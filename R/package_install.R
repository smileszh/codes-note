# automatically install packages

#设置镜像
# options("repos"="https://mirrors.ustc.edu.cn/CRAN/")
# options(BioC_mirror="https://mirrors.ustc.edu.cn/bioc/")

#安装BiocManager
if(!require("BiocManager")) install.packages("BiocManager",update = F,ask = F)

#批量安装R包
cran_packages <- c('Matrix',
                   'tibble',
                   'dplyr',
                   'stringr',
                   'ggplot2',
                   'ggpubr',
                   "ggrepel",
                   "ggsci",
                   "gplots",
                   'factoextra',
                   'FactoMineR',
                   'devtools',
                   'cowplot',
                   'patchwork',
                   "pheatmap",
                   'basetheme',
                   'paletteer',
                   'AnnoProbe',
                   'ggthemes',
                   'VennDiagram',
                   'tinyarray') 

Biocductor_packages <- c('ReactomePA',
                         'COSG',
                         "Seurat",
                         'EnhancedVolcano',
                         "Seurat",
                         "TENxPBMCData",
                         "GSEABase",
                         "GSVA",
                         "clusterProfiler",
                         "org.Hs.eg.db",
                         "UpSetR",
                         "clustree",
                         "conos",
                         "cowplot",
                         "dorothea",
                         "entropy",
                         "future",
                         "msigdbr",
                         "pagoda2",
                         "scRNAseq",
                         "scRNAstat",
                         "tidyverse",
                         "viper",
                         "progeny",
                         "preprocessCore",
                         "enrichplot")


for (pkg in cran_packages){
  if (! require(pkg,character.only=T)) {
    install.packages(pkg,ask = F, update = F)
    require(pkg,character.only=T) 
  }
}


for (pkg in Biocductor_packages){
  if (! require(pkg,character.only=T) ) {
    BiocManager::install(pkg,ask = F,update = F)
    require(pkg,character.only=T) 
  }
}

#安装COSG包
remotes::install_github("genecell/COSGR")
#Downloading GitHub repo genecell/COSGR@HEAD
#Error in utils::download.file(url, path, method = method, quiet = quiet, 
#无法打开使用URL'https://api.github.com/repos/genecell/COSGR/tarball/HEAD'

# remotes::install_local("./genecell-COSGR-v0.9.0-1-gc8f3f53.tar.gz",upgrade = F,dependencies = T)


#前面的所有提示和报错都先不要管。主要看这里
for (pkg in c(Biocductor_packages,cran_packages)){
  require(pkg, character.only=T) 
}


#没有任何提示就是成功了，如果有warning xx包不存在，用library检查一下。
#library报错，就单独安装。
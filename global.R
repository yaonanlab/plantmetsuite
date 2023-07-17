

# WELCOME TO RadaR

#RadaR is licensed under the GNU General Public License (GPL) v2.0 (https://github.com/ceefluz/radar/blob/master/LICENSE)

# INSTALL DEPENDENCIES ----------------------------------------------------

source('dependencies.R')
# load all packages

# HELP & INTRO DATA ---------------------------------------------------------------

intro <- read_csv2("intro.csv")
# FLUID DESIGN FUNCTION ---------------------------------------------------






fluid_design <- function(id,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52,x53,x54,x55,x56,x57,x58,x59,x60) {
 	fluidRow(
      div(
        id = id, 
        column(
          width = 2,
          uiOutput(x1)
		  
        ),
        column(
          width = 2,
          uiOutput(x2)
        ),
        column(
          width = 2,
          uiOutput(x3)
        ),
        column(
          width = 2,
          uiOutput(x4)
        ),
        column(
          width = 2,
          uiOutput(x5)
        ),
        column(
          width = 2,
          uiOutput(x6)
        ),
        column(
          width = 2,
          uiOutput(x7)
        ),
        column(
          width = 2,
          uiOutput(x8)
        ),
        column(
          width = 2,
          uiOutput(x9)
        ),
        column(
          width = 2,
          uiOutput(x10)
        ),
		column(
          width = 2,
          uiOutput(x11)
		  
        ),
        column(
          width = 2,
          uiOutput(x12)
        ),
        column(
          width = 2,
          uiOutput(x13)
        ),
        column(
          width = 2,
          uiOutput(x14)
        ),
        column(
          width = 2,
          uiOutput(x15)
        ),
        column(
          width = 2,
          uiOutput(x16)
        ),
        column(
          width = 2,
          uiOutput(x17)
        ),
        column(
          width = 2,
          uiOutput(x18)
        ),
        column(
          width = 2,
          uiOutput(x19)
        ),
        column(
          width = 2,
          uiOutput(x20)
        ),
		column(
          width = 2,
          uiOutput(x21)
		  
        ),
        column(
          width = 2,
          uiOutput(x22)
        ),
        column(
          width = 2,
          uiOutput(x23)
        ),
        column(
          width = 2,
          uiOutput(x24)
        ),
        column(
          width = 2,
          uiOutput(x25)
        ),
        column(
          width = 2,
          uiOutput(x26)
        ),
        column(
          width = 2,
          uiOutput(x27)
        ),
        column(
          width = 2,
          uiOutput(x28)
        ),
        column(
          width = 2,
          uiOutput(x29)
        ),
        column(
          width = 2,
          uiOutput(x30)
        ),
		column(
          width = 2,
          uiOutput(x31)
		  
        ),
        column(
          width = 2,
          uiOutput(x32)
        ),
        column(
          width = 2,
          uiOutput(x33)
        ),
        column(
          width = 2,
          uiOutput(x34)
        ),
        column(
          width = 2,
          uiOutput(x35)
        ),
        column(
          width = 2,
          uiOutput(x36)
        ),
        column(
          width = 2,
          uiOutput(x37)
        ),
        column(
          width = 2,
          uiOutput(x38)
        ),
        column(
          width = 2,
          uiOutput(x39)
        ),
        column(
          width = 2,
          uiOutput(x40),
		  
        ),
		column(
          width = 2,
          uiOutput(x41)
		  
        ),
        column(
          width = 2,
          uiOutput(x42)
        ),
        column(
          width = 2,
          uiOutput(x43)
        ),
        column(
          width = 2,
          uiOutput(x44)
        ),
        column(
          width = 2,
          uiOutput(x45)
        ),
        column(
          width = 2,
          uiOutput(x46)
        ),
        column(
          width = 2,
          uiOutput(x47)
        ),
        column(
          width = 2,
          uiOutput(x48)
        ),
        column(
          width = 2,
          uiOutput(x49)
        ),
        column(
          width = 2,
          uiOutput(x50)
        ),
		column(
          width = 2,
          uiOutput(x51)
		  
        ),
        column(
          width = 2,
          uiOutput(x52)
        ),
        column(
          width = 2,
          uiOutput(x53)
        ),
        column(
          width = 2,
          uiOutput(x54)
        ),
        column(
          width = 2,
          uiOutput(x55)
        ),
        column(
          width = 2,
          uiOutput(x56)
        ),
        column(
          width = 2,
          uiOutput(x57)
        ),
        column(
          width = 2,
          uiOutput(x58)
        ),
        column(
          width = 2,
          uiOutput(x59)
        ),
        column(
          width = 2,
          uiOutput(x60)
        )
      )
    )
}

fluid_design2 <- function(id,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10) {
 	fluidRow(
      div(
        id = id, 
        column(
          width = 2,
          uiOutput(x1)
		  
        ),
        column(
          width = 2,
          uiOutput(x2)
        ),
        column(
          width = 2,
          uiOutput(x3)
        ),
        column(
          width = 2,
          uiOutput(x4)
        ),
        column(
          width = 2,
          uiOutput(x5)
        ),
        column(
          width = 2,
          uiOutput(x6)
        ),
        column(
          width = 2,
          uiOutput(x7)
        ),
        column(
          width = 2,
          uiOutput(x8)
        ),
        column(
          width = 2,
          uiOutput(x9)
        ),
        column(
          width = 2,
          uiOutput(x10)
        )
      )
    )
}

fluid_renderUI <- function(id,title,src,name,des,inputid,mystyle){
renderUI({
    div(
      mainPanel(
        id = id,
        width = NULL,
        tabPanel(title = title,column(width = 12, align="center",img(src = src, height = '100px', width = '100px'), h5(strong(name)),h4(des),bsButton(inputId =inputid, 
                   label = "Use it!",style=mystyle)),column(width = 12,br())
          
         
        )
      )
    )
  })
}




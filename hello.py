import pandas as pd
import numpy as np
df = pd.read_excel ('HERBS.XLSX')

new_list = pd.DataFrame(columns=['id', 'title','description','variety','variant_of','price','quantity','type'])
currenti = ''

def addrow(row):
    if type(row[0]) == str:
        global currenti
        global new_list
        #print(row)
        if currenti ==row[0]:
            rowlist=[]
            
            rowlist.append(row[0])
            rowlist.append(row[1])
            rowlist.append(row[12])
            rowlist.append(row[4])
            parentlist = rowlist
            parentlist.append('parent')
            parentlist.append(0)
            parentlist.append('0')
            parentlist.append(1)
            rowdf = pd.DataFrame(np.array(parentlist).reshape(-1,len(parentlist)),columns=['id', 'title','description','variety','variant_of','price','quantity','type'])
            #print(rowdf)
            new_list = new_list.append(rowdf,ignore_index=True)
            
            
        
        if float(row[2]) == 1:
            pricelist = [5,6,7,8,9,10]
            for price in pricelist:
                if float(row[price]) != 0:
                    rowlist=[]
                    
                    rowlist.append(row[0])
                    rowlist.append(row[1])
                    rowlist.append(row[12])
                    rowlist.append(row[4])
                    rowlist.append(row[0])
                    rowlist.append(row[price])
                    rowlist.append(1)
                    rowlist.append(df.columns[price].replace('price/ ',''))
                    
                    rowdf = pd.DataFrame(np.array(rowlist).reshape(-1,len(rowlist)),columns=['id', 'title','description','variety','variant_of','price','quantity','type'])
                #print(rowdf)
                    new_list = new_list.append(rowdf,ignore_index=True)
                    
                
        elif float(row[2]) == 2:
            
            if float(row[13]) != 0:
                rowlist.append(row[13])
                rowlist.append(df.columns[13].replace('price/ ',''))
                
            elif float(row[14]) !=0:
                rowlist.append(row[14])
                rowlist.append(df.columns[14].replace('price/ ',''))
                
            elif float(row[15]) !=0:
                rowlist.append(row[15])
                rowlist.append(df.columns[15].replace('price/ ',''))
                
            elif float(row[16]) !=0:
                rowlist.append(row[16])
                rowlist.append(df.columns[16].replace('price/ ',''))
                
            elif float(row[17]) !=0:
                rowlist.append(row[17])
                rowlist.append(df.columns[17].replace('price/ ',''))
                
            elif float(row[18]) !=0:
                rowlist.append(row[18])
                rowlist.append(df.columns[18].replace('price/ ',''))
            
            elif float(row[19]) !=0:
                rowlist.append(row[19])
                rowlist.append(df.columns[19].replace('price/ ',''))

            elif float(row[20]) !=0:
                rowlist.append(row[20])
                rowlist.append(df.columns[20].replace('price/ ',''))

            elif float(row[21]) !=0:
                rowlist.append(row[21])
                rowlist.append(df.columns[21].replace('price/ ',''))

            elif float(row[22]) !=0:
                rowlist.append(row[22])
                rowlist.append(df.columns[22].replace('price/ ',''))

            elif float(row[23]) !=0:
                rowlist.append(row[23])
                rowlist.append(df.columns[23].replace('price/ ',''))
        
        
for index,row in df.iterrows():
    currenti = row[0]
    rowlist = []
    addrow(row)

print(new_list)
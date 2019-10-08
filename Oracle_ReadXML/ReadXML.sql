select *  
FROM XMLTABLE('/person/row'  
         PASSING   
            xmltype('
                <person>
                   <row>
                       <name>Tom</name>
                       <Address>
                           <State>California</State>
                           <City>Los angeles</City>
                       </Address>
                   </row>
                   <row>
                       <name>Jim</name>
                       <Address>
                           <State>California</State>
                           <City>Los angeles</City>
                       </Address>
                   </row>
                </person>
            ')
         COLUMNS  
            --describe columns and path to them:  
            name  varchar2(20)    PATH './name',  
            state varchar2(20)    PATH './Address/State',  
            city  varchar2(20)    PATH './Address/City'
     ) xmlt  
;  

--- When there is special character in XML, need to escape
set define off
select *  
FROM XMLTABLE('/person/row'  
         PASSING   
            xmltype('
                <person>
                   <row>
                       <name>Tom</name>
                       <Address>
                           <State>California</State>
                           <City>Los angeles</City>
                       </Address>
                   </row>
                   <row>
                       <name>Jim</name>
                       <Address>
                           <State>California</State>
                           <City>Los angeles&amp; Torrance</City>
                       </Address>
                   </row>
                </person>
            ')
         COLUMNS  
            --describe columns and path to them:  
            name  varchar2(20)    PATH './name',  
            state varchar2(20)    PATH './Address/State',  
            city  varchar2(20)    PATH './Address/City'
     ) xmlt  
;  

select *  
FROM XMLTABLE('/person/row'  
         PASSING   
            xmltype('
                <person>
                   <row>
                       <name>Tom</name>
                       <Address>
                           <State>California</State>
                           <City>Los angeles</City>
                       </Address>
                   </row>
                   <row>
                       <name>Jim</name>
                       <Address>
                           <State>California</State>
                           <City>Los angeles&apos; Torrance</City>
                       </Address>
                   </row>
                </person>
            ')
         COLUMNS  
            --describe columns and path to them:  
            name  varchar2(20)    PATH './name',  
            state varchar2(20)    PATH './Address/State',  
            city  varchar2(20)    PATH './Address/City'
     ) xmlt  
;  

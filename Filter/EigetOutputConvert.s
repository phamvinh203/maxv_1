<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
<!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
<!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="ct50" code="stt_rec" order="stt_rec" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lấy hóa đơn điện tử bán ra" e="Convert Einvoice"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Hóa đơn từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
 <field name="trang_thai_hd" allowNulls="false" clientDefault="*">
      <header v="Trạng thái hóa đơn" e="Status EInvoice"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="">
          <text v="Tất cả" e="All"/>
        </item>
        <item value="1">
          <text v="Hóa đơn mới" e="New EInvoice"/>
        </item>
        <item value="2">
          <text v="Hóa đơn thay thế" e="Replacement EInvoice"/>
        </item>
        <item value="3">
          <text v="Hóa đơn điều chỉnh" e="Adjust EInvoice"/>
        </item>		
        <item value="4">
          <text v="Hóa đơn bị thay thế" e="Replaced EInvoice"/>
        </item>		
        <item value="5">
          <text v="Hóa đơn đã bị điều chỉnh" e="Adjusted EInvoice"/>
        </item>	
        <item value="6">
          <text v="Hóa đơn đã bị hủy" e="Cancel EInvoice"/>
        </item>	
      </items>
    </field>	  
  <field name="ket_qua_hd" allowNulls="false" clientDefault="*">
      <header v="Kết quả kiểm tra hóa đơn" e="Check results EInvoice"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="">	
          <text v="Tất cả" e="All"/>
        </item>
        <item value="0">	
          <text v="Tổng cục thuế đã nhận" e="TCT receipted"/>
        </item>
        <item value="1">	
          <text v="Đang tiến hành ktra điều kiện cấp mã" e="Checking"/>
        </item>
        <item value="2">	
          <text v="CQT từ chối hóa đơn theo từng lần phát sinh" e="Refuse to issue code"/>
        </item>
        <item value="3">	
          <text v="Hóa đơn đủ điều kiện cấp mã" e="Invoices are eligible for code issuance"/>
        </item>
        <item value="4">	
          <text v="Hóa đơn không đủ điều kiện cấp mã" e="Invoices are not eligible for code issuance"/>
        </item>
        <item value="5">	
          <text v="Đã cấp mã hóa đơn" e="Invoice code has been issued"/>
        </item>
        <item value="6">
          <text v="Tổng cục thuế đã nhận không mã" e="Received Invoice no code"/>
        </item>
        <item value="7">
          <text v="Đã kiểm tra định kỳ HĐĐT không mã" e="Periodically checked e-invoices without codes"/>
        </item>
        <item value="8">
          <text v="Tổng cục thuế đã nhân hóa đơn có khởi tạo từ máy tính tiền" e="Received Invoice from Cash Register"/>
        </item>			
      </items>
    </field>	  
   
	<field name="mst_ngmua">
      <header v="MST người mua" e="Tax Code"></header>
    </field> 
    <field name="mau_hd" >
      <header v="Mẫu số" e="EInvoice Form"></header>
    </field>
    <field name="so_seri" >
      <header v="Ký hiệu" e="Seri No."></header>
    </field>
    <field name="so_ct" >
      <header v="Số hóa đơn" e="Invoice No."></header>
    </field>	
	
	<field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
    </field> 

  </fields>

  <views>
    <view id="Dir">
      <item value="150, 30, 70, 100, 100, 130,0"/>
	  <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
	  <item value="11000-: [trang_thai_hd].Label, [trang_thai_hd]"/>
	  <item value="11000-: [ket_qua_hd].Label, [ket_qua_hd]"/>
	  
	  <item value="110---: [mst_ngmua].Label, [mst_ngmua]"/>
	  <item value="110---: [mau_hd].Label,[mau_hd]"/>
	  <item value="110---: [so_seri].Label,[so_seri]"/>
	  <item value="110---1: [so_ct].Label,[so_ct],[ma_dvcs]"/>
	  

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>TxuLuxoEdnFm4XDuhs3GbCMgP7Cq6LPUUWqUkic//npUTXSPUk8GEdmArtuh0cn6yWbvprcvD0Jj5rMRXvJbQ6vgaSmSft7tzRD2JJdtVxsM5KRTxj/7T81qu8vw6EVmEZVIV5thWMgVr3/MCBnsaDCNGUiIaeec1H5X3/FTSiqbMmRfajCSudvUvkmti5loAxSOytVBe6CzIpFywUOCenfuMqW039JxU4H9bhjz/mrUewn5IyRA2ZjXzxdYoY5LISNlMvqPQ3nbcDozms11Lw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f1h8IuHH30pVWY0Ih8jlSK4GR23//r9+Df1x7Rxvy4fUaWT5nIzqqYkQ+lL+LaUs6TURi0Gn0dfVR8nYIBwr0Y=</encrypted>]]>
      </text>
    </command>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f9DMtri2oXjzdywzRtXyI39DfB1c/XxTO1ZN+yWLrHAUqmQCKHHOLb4CzwB7K8HpNQ1Du/hjvi/rlYSmqfZCE8MnhUbO1kHX9a5S9VVGPG/</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>5MwNWd0w451vXYduyMLlZE8cps2L1enZb7gPlrxzkjXDserD7pW2dqj1JpdO2KyI5UPrrTMF7Ho97ZSQFw3NGGxZWlfawH+/QEyLGnXJC0UmOyTV5DY4wb6S39N1t7rcwWlcEA8yOKYspYld+Uf/m3ErN9sd/qQHLOZowlxV/uO5BZEeV5ezKNf8Ev52Fg2ojk+0zZIIyGTgOLlBlQezRKOedm6iE41SudAlpX0EATwkpOO2TsqZvwr8O/DKUnTo1zOZ7HewA2l/li/RFJjtHmVNhF5NxWwRBM/X2vTwPHKW4FyakrXfiXogzvRHwgjHOZisicNHgyGWCVds/M1oUGRu5PyitFtKMn2Q3cOT62jSeLzKuLYQwj3g2ZbWi/YXjpwP53FmcnKwD1iLhhcHTOt1OEklazd7FemPM0XgULVq+1vZdEB398ZCUB1FqrOCIapGY9J4+gKLNhAP/Tn++LLgUwLA9j7RGFc+kQSePLZ3bp/zyzG9bpr8gGPm+sL4jHGHkS03IuoNcPOKLlJZMVDq+yiKdZlGTC+JpSj4aU9Sd38hMPHzWq69C0aW3MZD8fyzDX/X78HF3H5G8UAmGbERFQSabPTQ9F2qSkj1LMZ/SvxaRofF9WgmMmjs0l4skpYJI6JUrzeGSWFpPu7Xp28lybx9s2H9CtcNZqozXAEe1MoWUnkhiA4XOjIhwSQZx8AoeXeDnPAGKuRw598ZORKNY7W0T0a/XjHXn/9NAhTpKSg2ZzW8DCcCaPzjyAk/w/trwmI814stwZNT6UvmS13lMpFcnv48YXbVkgErzPwFa5fKFvkAMEIGP1Mxln6K</encrypted>]]>
	  
      </text>
</command>
  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>q9eiGJMeF3fi5u4LH3PzEvP1bZJm9G5TS47jjdMoKrZDP2XbHw7pL3m4VuZLKibZRHyaRjo9Vl/+HLtC70NtaJZ75spMgehHf3ZgXJR2fBDBHEfXFMAZjQ1fghrRQsW5jWfEI2vCKKcRspPGeb7BBH3tCH2QzUnlkCRAbbuWpN6MyHCzyZhzxwXHU7ZhReMGu0PJkxK6Pkt0i/r6BFnTQ5eZ6wQecOwI0R3+si+6I0DyYgmAtex7HdVy6KAHx1HfUTNUjCSlyVfHiuxvrokZ31AlqwDbHfKWO3RShncgYyrFf4hhs7EJYKsuyX95PzYN/Pq9D6BmIU1Zq/n5b7zp0NYCwpGkCLM4jWEZsDQo7KgSnqBNJ+oiNqboKXSCWVHe9jzdol3Seb0aHlQfB/HW8wh89CVTU6P87MFQ+3kM2bkkDucWuWxnySPHfGIyGmkyK218b8aVK/4U79crmC+HYnvikLemDcIVPB7yx8LsX8Jlvj/IaFbYYHH3GBtuZuO02kygg+AZMQuvlLg/kbOX4hdYzGJzN58gOzCHFrXoHqzp87HlleTM7aPD0miQD+gSAZGlW4Gvqan0QJlwV0m0YTpELb4FyUUkVbtmSL9Wb/XrNpFKQ5//1kOJkNJgIR1mfznXJX7AN2jQrN1kUEV633wmbokj8ffOcpmdNshrRjNhA5i9C7bHoAGOxm2ZP+mr9mrRgUprLhGxJFm0K2thITZ44OE0+2SFP/0Etw79YvasRJGwcZssXMNcpfpULepH8YbgrxhjHgQHpoxij9u7yk2vvnZTi0tPYOvbmhl1r+jeB+JIelEB+QcLYHXcM9TunJCWB4Qg/gJEB/C6CFojP0zajk69AHtJrJUdnPCoq/vmU2RK4M5T6ngsSbQElOn5Hq+WBfZZsnzC/69Qc0y2OmTufn8UwK71oe122j/TFW52KAtC+a6T6EIS0vGOQxSI+1t2XCbB8/k501fx9ZNl7gLeDWG0U74o1lTKzxzeZ/EkXO7FsL1lZzSJBi/R1TX4/kHGvxPYbbJFB0gkhdK6ubk6WPEI2N/XJByvWayCUMvgqKyMrkGDh5lRJuEAmXspklwVDDPdacIv3J/8ysTOUPxQy9TzszT1ddfTKepZVY3t26DgIa7OXK5M/rhOqf2kOcWNG0gh5zxQQLCQPZdhAK5yuqt44vFfUMZAlIhCqBV2yvADBj7cTQ41IIedC/RIvrOPM2dKLkg5MPDwZXhu9AOGWCLihQvBEspBlJ/76rZ1ODi/wZ7k0kB1h/ksdfwtwspqC8WKrNq8TjNfs/znHxpTD6Upf3xS9GhPNMM7F65LCubGbiyf7BmRCD9k6b4il+BeyJN0XWIEEJ2hGQxnYSYF/1oTttWiJ0aVrage3cPT1ExADVanE79gziafHqCbxTE32dLwsxY97PWA3wM4WuP/+1IOHzLYPE4IXzLQ+GPadllyxdJvZCx+FUTmIz0Zgjt9qoMx+xbAUi0hqnQrrrGh50aq2J5AQuKdrUE9qd6VHQ8aggwP9xseBj8WDDh3ZbNmaBtmP//MLr0BUxJ7KCsYBhcNrbiEydCy6uyV3cqiEAmtvQhOkkfQ2dz8qKjPBVtKZGEzX98gRpeIGhL+Y7+jDqutpPvianxcsoSBNBbAQJrXISDIOBW434GtHY3UcwAfWiKui2V3D7HTZvw9ahRAz0m5r/Ge0gLoDVhOzHg=</encrypted>]]>
    </text>
  </script>
<response>
     <action id="dmvt">
      <text>
        <![CDATA[<encrypted>eCpZqtV3kHGgXIwsAelF8q8dQX1RVZmhpUsNZDyv8CYnNsWSQxpTF3ISHPeV23mroylU/1R/inC4PFZS5d6ztFvggofOzcmAZ+KawruC6+NsBxp5WqfkpL4nHNgIp5fbV/nGslyViSICDaA2JyKeWCTWIqDveuPwjc57EZLp16o=</encrypted>]]>
   </text>
    </action>
   <action id="GetCaptchaImage">
      <text>
        <![CDATA[<encrypted>izK46fMW2roCFMpSnbb7wY+3FJoUCAy2cWhKEKMunwt9ANrW+LIrI2+LulIHjH/olAbQkVJeH8JLU9JzzUme2eqa2zmfZr93A0rU1Ql2Tpe4dakyCqWwQdztMlpfXPtgJ0t+qKwkiM/j2lajD5UoTynpQEAceex7fOfvMdkWv1JH7HbsnwcXZ7+bGsj92TxHAm2z4sbexyYKjWEsW97xF8r3ldGYfbZUrcws7UJgQ1A=</encrypted>]]>
   </text>
    </action>
   <action id="ConvertOutputCheck">
      <text>
        <![CDATA[<encrypted>+4gP8Qm53w8w9TslRaf5tNIAJ7+5yMGw56ZwoFTu3GAgg47WKDm32lURJAgYDoqxN3AnptEcVpzeI+OLozC1DjZNjbwsNjgcuyPIiup3HPJpZbS5DVy7hBFxJM1gEyrUw3ZGLWon4s8zMfQV8vK2e2qJJTGn68xDVxtRhZh7k0LiM2i18i/u6wgk8889rvYXTA/QF4UoFdYPX9piPYjdeTPZm9kNWbNGnl5Q+e6b0W0JEJtxwVu2J3bCv3iajgg6pi2ns2J+e29B4tSzTF1oFj1fzszMFAczir+WnqbiU9JgnxnTf09W1k4YI7veR27zZdC/DvcRDwWADgE2pAiQ6w/CB9phX6H0C/qnncCPr4M=</encrypted>]]>
   </text>
    </action>
 
  </response>
</dir>
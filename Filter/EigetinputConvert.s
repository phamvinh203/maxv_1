<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
<!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
<!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="ct60" code="stt_rec" order="stt_rec" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lấy hóa đơn điện tử" e="Convert Einvoice"></title>
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
		<item value="*">	
          <text v="Tất cả" e="All"/>
        </item>
        <item value="5">	
          <text v="Đã cấp mã hóa đơn" e="Invoice code has been issued"/>
        </item>
        <item value="6">
          <text v="Tổng cục thuế đã nhận không mã" e="Received Invoice no code"/>
        </item>
        <item value="8">
          <text v="Tổng cục thuế đã nhân hóa đơn có khởi tạo từ máy tính tiền" e="Received Invoice from Cash Register"/>
        </item>			
      </items>
    </field>	  
   
	<field name="mst_ngban">
      <header v="MST người bán" e="Tax Code"></header>
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
	  
	  <item value="110---: [mst_ngban].Label, [mst_ngban]"/>
	  <item value="110---: [mau_hd].Label,[mau_hd]"/>
	  <item value="110---: [so_seri].Label,[so_seri]"/>
	  <item value="110---: [so_ct].Label,[so_ct]"/>
	  
	  <item value="110---: [ma_dvcs].Label,[ma_dvcs]"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>TxuLuxoEdnFm4XDuhs3GbEjEyvi9gwsveHUMYCi/3HoBVYFLFg1q0r+DKq7DvrSCAJYhAg2nYW7gm8edOKoPznLoemILQMR1JKm7m59MakQKeItpmK5XRkTMCFgvKkOnmCPbBE3DdOb4WQnQ+RKJ5qrCNQZku8sF0F/g1LxUGmp116HjNBqhbZfb90wTODKNmep45nwnzh9WDT9pHhhCH4temJ/3mBYhovBsE2x7KNfgzzxecMw5zzTrknCffzJvQ8kEj2G2Z0xJHdsLe5knJw==</encrypted>]]>
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
        <![CDATA[<encrypted>x0cYh3qn1rhjhcd3puAHCohzUBrHwZShcclvCuCbNy8KbgGSF47u7BYgOe2PrRBA8FRAXkz9lBRuFY8bd0NLP249a3Z7N+CUFsrMRqbQQT4+KIfqDwG7wdVOWrOVgEOQKMYm5hbo+ZNbI0W3zy6CUv2yrXqz4OMJRAgzHQrmjpvYmFVHZ/9lz/KiAkEkqCnkno3n6CmZy1lcomnYY0TkhDCGQu9EFGWWOUn+NQ5JoLrDN0rpHgnQbhL1rorrZgyF9ypC9vLkR7WufWff1c7rm/Gud9Vl8PHN1oaNcabk5DaW4rIx+fwh72xEv9PPaAuNVQSCkfoSvqjfepzubgN2Mvif86yNPVBzr97sKhyiDxigMYcNxJrVB67cjHWXlAEzbXXc1fvWXerCkN6AlONWpptevFXpkUw6RhRHJ+MJf3Zj/fq8e7ziT9U7mdK9qd3vDfHzAfiFMfNVXzK++J30NnBZVsO/69EA1uNs3lWdFODchPzDrDc/n5pjkIUHRER2WKsavvKqGAtEN3XElIearG8kIaw2PJd1MkT1+BsYyUqss2989HQqAPbpqyqMU9BwZMQbkok/CqORtALus0Y8b9UmpOTDRtcoOP0IxeBk9DppJfFUbCfZEGOLTpnuaXZiizVWq638o6yIo1KOHsvdSBzrskIRZNBId5u/7Wl97cBXyUlWzlj6WkPfLqkf1L+mb1PEG3o9qcOVos2vZpugh9KbL+zz8zq0ZMqwSJitrxSzeVqSpYgAInrz8b2FQmEI</encrypted>]]>
	  
      </text>
</command>
  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>mpqt7wHKcdT0miFzreDic7+jowPIoKS+X76b6/9vITMaLwWvg5NM2mtVNWC5e9Ni9MBv4mduK8Jc8nDYN5JEvwhHHjXwnPKrac3rWTSICaiTp4RmLgC2OpSEUj2rLMTEw6FdybvFGvRJnCjcNzsAAjVb3KGCAUObWG5g1scj5ZPNt7PFyr8Xbk/pGBNiG0+bOOOwkkEIhTZz4Ls+UuPESD1RJY4YPAQRu0UEjxs2r2/gAveh1E2nIOAtmjGgvQjiroTJG1tNtc7RSV2jW5vbs8ofaHYPCiFAgzGrRgRYQasc5EfFsjNn+WQCrRrE3BG7z7p9PK6sU8Q1akaWB5yPlk4+Aj0FY4SvD4/Cam2UCNMwu4PH0qhqBOYXGibA98LHQ+qrbO4rG0Rrw7QovJJSYcF+Ez5+BVU5h4Xu2F6xi9oIpj8b8NTUJXCIFQCx3KGL5+xYjJMEWFMKnEP8Rrofm3XMXrxlDO71/JxaETMFTGC6uS+9zBdJ6+ExOpNQqLzPMvs3cmCYaGzE2mWXSuFU8YE37Ns65Z4OfWvFtP2EYoPlpRSwr6DEXaUc1SBJbNs4AnVDlUUhHc+quuixwfbwhyEXaFF4dmJw8zp+eHgZ7OIn+LmaDQ4z/o7ChwDTQIrH1NKePIZ1DhSkhh02Bg5wHQxMa7CMJlTshMxBsd0Ip/DQNsFN+a2qtSbQyG1mRRDWyPVaW7nJLioOg5us4froSTUXUkfGdIQ7mtg+Ng2K7eOQ1dBiT1QQI7OxZBTfO/hKZzqpB44mYJvnPfGh8RRlem5zHMYRIScSN7vgnXHJYsO0LlzgbB+rTBbUfOhWv24b3d7KPMOnN9+dteaN7w9VhDnVo0bfp7gXVMKIgxPn8mXYep5WAbc2WDlHommq7ETs/8esnDn3MU1+UH0vqfJSmUejQOe736/TKV7gtVz2wzV78mddAuKiMKIRCLzagZFlmzzeN0QGMHQxNR35X5u0rRJJtSNJb4z/EcBSqtMScQbKq/pgL9Xp5wdcgjjP45AxG4B10vCa5EmGyKXBI1bbbTUE2yINtOW497+G7hyI5Qicg7Jb4vSKKDTAh3HVK7s9gdUUkl2PS7t8553V+00zcIChoGjpVz0GunydHinPR4XuWhWcSungkoWiWZh89fgjo2TV/Kp49B/INfGDcCp2Dm5gkivH5FLA7v3Kn6FdjALuKtiia9U5MjwUduqMHXotHwV9+hifXum29dcFGXnyWL9Csx2nPF+HL5+Tezja03zYQ9Gqosp7/IBz4cRP3MB2ScvWla23hSHN8vTeI1SrnCQ1mtNCxpwAt6d4SG1IKwQbXRVo7N9BywmsKVcr9icNyxhHRk3gfiPnPPJGaJm3jgYR8RCx8WTPVEaCmXsWQgPBrLXZOE0ikFuAfPraOYKsTPcGsJTFyZatqeJPfVUd2E0P/xRMmMi8aBX6lcWqEvHOX8772jyL2IerX9izRQvGpLUkhC+FeeWZUkSfY+QQhOEyhqQ3OmS9Lf2OG3sQDIw2uRjecXCgk3G8sEQr/gU+NcW6+sbOK48oPeGlj+15qg9O26rVPXxQzFHHB61S3DgyQgl3BupbqhOxHaMOJlMsThsSvu3rKN0DkrVTVNPwmIPey1SYS858b8ist5lgBw2ffy0ubv/0gTiXvHcbfzu2lDwVK1MhKsOjGJ/TYY5+/z3XtcrTF++ExrKQ0E+GrlYu5o+okHEsmNWh083vELDl7ZFTIgUF1Bruwj48qjbsuFOfkC7xtC4JKb5ijmCkyC9BHf1tzFj8NVu8sYx44EOVMS3nmCnfYCHPeTOe/6NsCiVdGHJE1ONfhE807i2MIFTId4YtbU9ic3Hk3qlLnb2CmwnVUNcW0D5+GkPPs6B8Hdneq/cQmA+4K6pYmHbxP/677UCsLkEBSFUvkKxpUcytb3HR891NuESx46kjeTKbXAYD3hqIdz2JtNvA4DcRWSQ=</encrypted>]]>
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
   <action id="ConvertInputCheck">
      <text>
        <![CDATA[<encrypted>nkliFlIQD5cjUqCiK+Inxsx5fW1LFP98kY4nJjUAvNznLySl086V+XjDvrXORFYz/mI2L9HSln4j3aNan0Q+FepBKGMsKa84IIfuXLw9Z4d9z6/fHg/O0NZ0XQcEjGHTj3Ny9hn6o4nA2uX2VaGRFlBEG8KUOH703I8pY6ixjkMmSsvX9EaZq58zXzaNKZlwfWrOVXGVEB49hG07s8NC4zGMyOGa876BjPAmUXkOV53QfL7UGtWeBf9ZOdO7Lgli+TIB6vGeaH7eGz1Yl/2hwFxJXcfzGGlf4mZ2QbyGqnabwI78I9VTgT+1GdBuKo61Im9l6+A8FU00Iul+8ka5iJkvIycgtdIVH1CfwGh5IdY=</encrypted>]]>
   </text>
    </action>
 
  </response>
</dir>
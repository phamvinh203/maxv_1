<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="cdvv" code="nam, ma_dvcs, tk, ma_vv, ma_kh" order="nam, ma_dvcs, tk, ma_vv, ma_kh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="số dư ban đầu dự án" e="Project Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4x32MjUCehN8dH+lH6wpzafSrO9OAmW5gHpgLKr6s8LNv5+/jPNg/WvbcSLNEKQvbw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Dự án" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status='1' and vv_sd_pslk ='1'" check="vv_sd_pslk ='1'" information="ma_vv$dmvv.ten_vv%l" />
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status='1'" check="1=1" information="ma_kh$dmkh.ten_kh%l" new ="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Dư nợ" e="Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPq5nBcVJMVUcSR6+GJGQ+XGPe4SVeh2lk4rGi73JHLOxo=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Dư có" e="Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPqhoO/yUEppLuYCVG8M/7IwtZsW1DhPQoGMq6f5lOdU88=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Dư nợ ngoại tệ" e="FC Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPq0O1D2X/ETf5PQbkdXoHqBN9g78szMDgrThUjUCsLIaw=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Dư có ngoại tệ" e="FC Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPq5TUF/SHqk5ApU1r4Zm9/pFl9+MeXWycakelM3D+J6T8=</encrypted>]]></clientScript>
    </field>
    <field name="ct_kh" type="Int32" width="0" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cn" type="Int32" width="0" external="true" hidden="true" readOnly="true" clientDefault="Default" defaultValue="0">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="110, 105, 330"/>
      <item value="111: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="111: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="111: [du_no00].Label, [du_no00], [nam]"/>
      <item value="111: [du_co00].Label, [du_co00], [tk_cn]"/>
      <item value="111: [du_no_nt00].Label, [du_no_nt00], [ct_kh]"/>
      <item value="11-: [du_co_nt00].Label, [du_co_nt00]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7W+/WiT6FegCvJc5gl4Wc9AzY2+7fHzhPzoilbZSKN1kkWMSFth4lXgPTBvoczCrOKU2+gDGHJdS+RCmV0m1vWavvIUxXCmFPffYR1b5oaxh</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>3MnbaA4rV8OlfwUvlYbEFm0nThChZigbRNXmnueNlTCNpba45Jy5IsR840+a/tCnSoa+JHn3qTBxVK4yOjnEWYkx1o5mDP2R29gNnJUiVb9wl4AjAtMZXTfv+amzWLsk9ntl7zlfi4KOr8znSJLqEE0lAjis6e1PQwj/R7jxjHZV17EmaT2GBiFV05O0pcri</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>WJlfIzJ2P3yqezLQAm9Jn64Rlnz4pHWV2zBOT29SvzuEucoRe6ZLT3pGCegQe/4N5Hifx2VBqI4/RMC4tGEAyoXQTHroFXj7G6SsT4w7z6jyxVJlSu9q9grrYPQXh7ajeM4AaS0kavopjZniFsuBcbTCKHK4Yr0XfDiqT+6kbOExi0mwJ8EqiV/tgWppZ+a3/pUfilHSMpLBX3kgSv0zbKRHZ4UMoPO4mahpBhOBZsxOhVwuTypA7qUdYmgCJrVFd7w5pUHcDYAZLLT7GJgLxbEkoq2I8KEQ9FCI/q0/ReM=</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3P8PIFhqcVK6hpf3CyN5l93Al2E8ZbFE/jY6QNaee+VCA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/5NRu3nfHu1FzbNr0dJx1p+QsMC2NBOqvj+mJZPEtvP9MBp0LZkpNT8+dSCmygj7sHLphX/UL9Wk4qS02hNOur</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>oTn2uwg+Uw3vAdyETGAkz+XCELtMGhBMZHGAaX91oiGd9PhIGki+2C91Jbd8kFFHj5Q8LlyJxtVMXGMSJxSToZbJQtsn4Z0kbd3vPYtjF1ZEaswpxfpgR3kMENUJU55gtVyevtfgzZ7UEircXNt6LQLXRxk5Fxt8b8c1RY8FAH4tfZU+R2zPFATIdFBHAAY/8FAwSIcQ8bV06GhwYOE4OUl7Khk4jIzQ40/El0zBHE6krbxoIEwHZ74DlMYVS22SdyMsM4tvstIjRwLylSjTDrfgp6qQ+XD8u2dFbZdOY0DFmU3FHRKsKn0DAjWG2bZObZnjhcSR0P3eI1QQcSIROVus0m09dhAh6a7jaDySlQn3rbmP/L/MMfNq9QxYJOQgxOXlVZoQDsQHnUqzij3FL8ArFkLO8FHfYp1PHtm8WzQk2cxZRv0fBEIfrMm+U6YCze6/H8miBVYhHd6iizXcAvHekHzRDkrXklJRLwKYgeXV1II5SlsX+/bLq1NF0l95AGW4D1iFL+RZbz68FrijNw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>fhfdVj0hUUQvwnCaUgeOEwL1GLVjCZOvODpG/BdvyMRrHGada8ZuJ5aYOrBu49rXR5KTMeSDTzcR+HRnVrApnw13ue+CDbAln1EXtwec90hs9VOoSilVn3mx0SYZgECWvnondaIhnQGcUgEHa5tGpLoljPsvf0ZpceeJ+zK3esE5b+x5GVm3pmNQC1H6F49GkpS3M/8+jcWdhQJc7xxLbtYmd/p3ZRgkf3g3G3cTuMUK7B5HpBFRLmOiAXsdKUfHBa8rHQMEKkdF5HL6pu3nu2n8LIaRBDCoEMZgNXOOvnvNkzApgZlZeOhNAkZeZNnT</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>1m9eqUeBOQgT2eiHeTFP7GjyVRWRlPaltJvWgbeqtbxOFwVm4pauEqIixaX3BlZ/uUd5SaZ5viBptmMDboFU3zjM2vEB0gT/s46ju4afDw0Lc1Rfbn3GIl8lt3c3cx5u1879+RE1iwNqpHsmp9g2tVMrMFPv+EKma5zNXdN5OPJNBDHsyIX6isGX0Qz94PgqqxjymglsQB8VWatazfIahd/mWlE88P/CvJmw6bTt0InV16VZti2Tw8YdEho5zHS4FllTpY9u9Nd4GmSToeZlJh9BEGoiOx60zagf+GVNQ3ptOw9EdfNPh6MS8rezDTA8drvI4OTg8JDkgdNm0DpVdMAaWILrDJWE/b/BPb/RcusgzX6MzzzyFKmLjp/FZ9YHv5FwZQzTh6ycUqUWJn+5rTqAWYHN74DDuLCk0cEBBHtl8Cfw0/hJfNR/rPZO1BCt</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>eCFxFnjfUumkm9lYRvXYDrcqv+8wQQWmYp+KqC6bTYbbB64AAIbbAxr4JB8zckAjSelFAPslTglUPmDbaUL9ffhjrqrgRHvLZlj4fbEzFi4xFbtOIg0pgzeO20Lu4FacyPlQgtEyQm8AFdxQ6lvM/6jCH51CwukLVS2CX3Sf2ZY=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>xLVrE/2g22wOIDK2769KQCXst9gWkBJ3qMUdgvqZCYIJSF8bsyHhjS6sXAPdLo2AAVMr+nKtMPyum+TGDq9xK5/ni7LcYKBJO7VNyBQ/ALZCPOhETZcJP72SwwLfsJswD6sMqy4+hnr7UtOJf8WUrYqJANgxZG3R2HfQ+z8C9j1QYXAVGfSKbaUizmhwhRVDV0lP5Vsw+ljsT0CBtK+QNv9f/w1ke8OwkNrnbFNaJNq/yw6QXkBTg0aKRuqu0ctvamT5ltCew41iZhjoQsQsx35T+B0DhjKSrfS77heA+Ba2UdW3K4qY83CJbnoYAr05aDAKkjDf9Z6oyiJl149ubZn1T8YZu/Yeuf9syomzdKJX4CUnKCPXy8VK/pHHoTUsme2ubu00MfkYabJwzKrwsZ94cA0kCb6tYQEcOEkX61QP75PFmt9k9nXyuoLPoxCOCOxTWsr/rjbXLlIF8aJkpqHV4IG6N//K4Y9M/dU4V1UUfnqLCI5h8kMamLxtX3EZRDNKD9iov3HXwn9HzmXxj3ak2A9GkYrzLdp10/c7nAPMGqWhhNtAN958QrDMDMtc4XbOnxs1L6Le9UTrBK5pgW2JHg7b8TNylAAs9BqhpECDEzQyUX/0Je/KN/WWV5N9+g1GII9S9mTacyuMJPRAoNCls5/7GcpEvN45L3iRMfyzi70eXQbDoeD5Yn0rD/66FGDAt7uz31E+8VFBh/adgWBRn5ZhS85i9w/r61W1U6vSxaaV1rHW4rMmBFiabUTzLxhiKlTRsdrTrX+jreXqYSHHpGS/nlKVyD3q1/OuLCt3rZCaytAhWGs8yX3g2fmriBVEbXMVnDsSVSvyUuWj/GQhquqX/iiWuLZGPpGnK5iLLC+Av0dcEqGw1x4amCRl</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Job">
      <text>
        <![CDATA[<encrypted>LYsQP+xHunF0V4kGFNFbsPhVXR4W1f/upA5we2o9Fql2nbCEsi8rX96DNK8/TGMKz7hlhPSZplGkQar7NjeHzV4C7PPobwFqYiOb+VR7lopR8SlV3uBZjDrL3wg3chKtm40K5VppfsAA0gy8QmXJjQ==</encrypted>]]>
      </text>
    </action>

    <action id="Account">
      <text>
        <![CDATA[<encrypted>fydLgUi/GndCBXad5BcGwW7Q/JjIIUx7MTFNNmtl1CDhfzltfwOF9Vzm2qfhUKqeE9JXbky0E1og48AtUNzdS486cq0oJ2dfA/OgqYNs8VBYt1W+LRhMzrkwEqRQcmsrNfIwcqEoepozXWgxJRlF0A==</encrypted>]]>
      </text>
    </action>
  </response>

</dir>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Cập nhật địa chỉ theo địa giới hành chính từ 01/07/2025" e="Update Address from 01/07/2025"></title>
  <subTitle v="Cập nhật địa chỉ theo địa giới hành chính từ 01/07/2025" e="Update Address from 01/07/2025"></subTitle>
  <fields>
     <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="500" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="ma_so_thue" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
    <field name="dia_chi" width="500" allowSorting="true" allowFilter="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
	  <field name="tag"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ma_so_thue"/>
      <field name="dia_chi"/>
    </view>
  </views>
 <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kipSji91fjPcSMbqqKdAa4ut6fXHKYiqByGfJUR4VgtUBE1uHRqkNzfbGeLtA/2J0TQDFHUQctwLXrKPFy7kAQc=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3klGLWyk7LxXEKT8blJWP9m66rJgL0on/Ej3X1HPY78t9mdxZp0dabzpRvVlDyyg41+YHZc5OC0DdLAm/1ezHnSA=</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjqN8AscshQnVlzdQ7G/9mra8xXWGNroGBZuBhQQ6PM1aFnWcowcCRBXs2xohkf0RqfiwT8oik3HQqc0MLFTTTU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>

      <![CDATA[<encrypted>KOSv9CmXquvtXG2cF7CUgGI11rL9FZ2RkKBTejw7Sb5KWU7ZgcHpL/rw2MZtFhsDp/rAnaPFCpfTxbR12m1TRGG2Bba7gBN74wYjKyQ0kSuy0xs3sag2OTJHALybayV7tVvXZR0dQlGshIfvVKJ8h9/QgRlJIaJIeJ7EYwwSOJirQef73+quqqqUwhp6B6ZHy9pnRswafXkWNICwnc4VOB0EIEeYuUWtBn+koF2YXKPlR5mfJb+IRSu9OmYL6yR1RaB0LwGHqety0rT060Rq+R8sw70IfwjGVOlvvf9mdig/7i7fDfg1/iWco0Lx0keFVTaOy7wL7RI3K6Z3S7G1QH9WzcZ3dW1e81TB1QGHPOXRrbQ78CVnjPipDnSGnntGXXHz6GqHO9xS7a/nVa7tIivL9P3ORoL1RLz/E9bhbyzuIUaCsL+DvhyVVjZ2l7Clhna11/BD4IX1hLKGYWG4QoO0pLpudL6lU0bVVuyfBIrahdtXflMygX8hzDCHqLUU5KaZ2joNzg/i4iSNNRz9JbNOqBup8Li6QNgZq9HQxaQfG8wYfIZf7D/ssOw/iPMuYj2yPQU5ix5nnFmzpj7Ijdg2oCQcCCU8C3dAF4+g7iUAEE7cRrqlalrnTGyIXlGbCVz2S0gglRd9FFiRR/4dLZs27YmMxp1rPZsWke5qAFloOp2M/VWGuGnO0d9zg1UvcFXTWM2++T7IVL9txOwMFNgNfef5gC5jP/L43/3veXV6sE61jWN52o0NYr2qVAha+Goxqxbp/0K5/q0a4IR4Hbpd7Y6YD1B7eQCwthCWd4sZSuqX3URxV/vjm1HILyVUSekFp5Ad6qx4uOi7UQF1LktYmX5seG2w23wyxrZifokTnh7CqZ7PmpFKekSPI4H3xaBsmG67JaIrEk6zcM1ApSDK9NrUv5rN49WMrVoKtHmZda/Bm+eBlUClwDdmKrXDb/NCLS10Mxya7cDuHqKWb8e3YPZOuJ+LpOmrY+hAwM3hc/Jwnqi6sgTsZbb03L3PXSp2Y75NuLq0BXZ/7/HNmrUR4vwWnRcmIRSyzYl/cIIaSh2Q5/qKMvSqgjggzOrtxNfTT5IR+zA6BjMnE3OOqLWYGEfXhp1xJZnNDpAWQUwR/X2JuKoP/rKuMADSors4q23BLrlosGzpxKaom8Mv+wdllJDIAU6t0kT+QsgXHRSbudrO9YbX6Pimg83LGnP3/YONufx1pQtFOot0E1M18RW55ubaYOaW142N7YsXv4eMrq+XzpUoFvBusqcULuOvqRmlodMWqfMwF9oNSolonXAjVJKbpn8Eyyz+lRorD6u+7Saoaq9eGM8nQTIq+WO2+XTHKeQVevRHlQlVXacd1ITZbX8EuZROBXj06wmj5lafGHPKVaUA+7CpmU280RrY59NINfE2ojD6X0uT1+oa65hJ8XNTk9MqICD6lFI7I5H8F21MYXM0xHy48K440OD2/JikUnWyNcXCueQb1lMMF2UUJvMnrAdQb366JmXtfDxWGjaQAnbaJs/KZ2dGyQa0G2pfHUWYxaqSYtHEv2IWUuftRQZGMYJvfKpeYsqcxeAPvTKJvEjmU6bXkIBd8via37zNmcbW4ZSO2iYg0Tf8/0suEoDELUKXFXejlW78cla3exne/dUUAgJpmGfCw0zr30uSegogtLxXOkm8H7mlrGRQ94lusNJ++uE70J19aayCqgGgXIKgVDn4jecHAjdiVMR6PO1zt6hQAwLrlR91SHdp5rPP4TE7jF7sYSZZxCs=</encrypted>]]>
      <!--&JavascriptReportInit;-->
      <![CDATA[<encrypted>FbVGaR9Ilt4OoVHj2t1mzxXNJX5xp+JMzsnXQgrHx14BbGAve0W0xSP4yweEmzgWPLbRoJxA0ogQ6eDUra50S+Hrd5MG0a1Pn3+j9LswBxiLS7RJMIxwVdNgspMnYTpLQIVxG3cl2lIo2Kv505gsisfsIGlphQrNRHxCfLKoCYJ212XGGrnh2mH3QxujvR4z7nSG6VkyWgFOpNLa5GwWryczuNgonXFM1K/j2kMYSiSqZiSgR3Co1BKh0n35dRB5ZbA3GPkv1oFFtZwik7kraizTtfSpeFCBzFWNosGYEjtX33mdnXMeDZvyV50qi75GEZ7dzyGOgQr/iEcWhJCSkiDplWYKmR1pqxqSuxk42rXYGsGRqo4WNLdTKOkElf7JyHPrJSneByAPM7TVi7vp8HvNGEBYYM78S3XEt6o8LoMn1Xz0EU9e9bycInz8W/GUiNJXRFkUXmOOrUNqOd5K9U3IZ1tkLZZttYHPfQgjy05xcUwC7bVIp0W/ihDx27MFNEnaiOMluDICFk/HGRWX99/xwaNOuN57guxK2B/SPi1+Oc1RoqSnjC2gasAvdTltx9PePIGaehyirBlPC9JCCGtmvsWFm5Kyc/EHhfrKMUQuQ7Y0OphByH89F6HrQOMPJLBiOe14F89fte9Ynium0nmGBya98Lp0li5aWnLuWyycoyE8N48q8y46NcZWFpYsy+T+uOiQ/lsbjw5ezG9VvwJTbFz2E3StzpBFp7raWF06IeM6+NuP3vMLOV3XcHZsuuPHF0xnPttDRGLBd4QPVfp2cYJ4uJ5s91C0II5R/07H6iXx7IuAMKWOA71adPvzOqsVyPc0mcaZWAOO5PvAcJB2UNf1QzwutgwuxrU52d7BgX0+k1dCmhDI/o4DiT3RdaPeLyrTX21cmykIXwtbnq/NZ0QLqX8gGCLBAbD12nSItH1suCRDU/cLfIq+XeMaIa+06lQROFHeU5uYylrq7cf+9C9luM+9KZxwsubJtIqov9Zfn03nOHV9G2Ot65z0gGvgN2uqNQDLXghuITKqmPvnPWKETqHgeby48rHN+jN77cagM0KwxSaxWX7Scuj/GNrKAFw4y5P4csWwQvMn3IKXGa24p+h4hBhqB5FzRN7BMcq3o3oUAzJmU166vEu/lgcQ27HiUZ1JtMEcznR8FnW2GFINc2oMaXb2TI3qEzI=</encrypted>]]>
    </text>
  </script>
 
 <response>
    <action id="ediachi_update">
      <text>
        <![CDATA[<encrypted>Kr8Gq11Z3BPt/8NFc6jmEihtNC8FC8pLFweF0wnAhV5gLVaeMGOs6N9chwrWOPO3tjCdgIr9hC46nH5zTG/gy2K0085qcEhBtXAVf1DU9IZcpj8uS1w6TNrdy4wj9XebyuvXlO2KmarsW+VsBsc7MHeFYc0zDia4U82pNaIqbBeE8SwQPy6qwml/bwdDkP4aEKi1xNF/mhGM5VcaZ+bkPoM9s7pkwT+O4Sra0BNbAGc=</encrypted>]]>
      </text>
    </action>
    <action id="Create">
      <text>
        <![CDATA[<encrypted>6PmJYsjYdZvFeTCVqQOG+DUKQa1aVI10Uye78GbVKZSBPfgIVKFckwiJbGwk5odMfrtYdvgiZfL67wLJPPlTKLPWmimamPw6tXkvRa0TNnnDWrgxEdxh3unBPJjQX+3nN/CPIAF2pyXt/0Y8d9IZUFyqw0AM1i3+tOiqtMoKKW4=</encrypted>]]>
      </text>
    </action>
 
    
  </response>
  
<toolbar>
  <button command="Search">
    <title v="Toolbar.Search" e="Toolbar.Search"></title>
  </button>
  <button command="Create">
    <title v="Cập nhật địa chỉ" e="Cập nhật địa chỉ"></title>
  </button>
  <button command="Export">
    <title v="Toolbar.Export" e="Toolbar.Export"></title>
  </button>
  
  <button command="Seprate">
    <title v="-" e="-"></title>
  </button>
  <button command="Freeze">
    <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
  </button>
</toolbar>

</grid>

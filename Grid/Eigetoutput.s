<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
	<!ENTITY FilterID "user_id0 = @@userID">
	<!ENTITY TransferID "Eigetinput">
]>

<grid table="vct50view" code="ngay_ct" order="ngay_ct" filter="&FilterID;" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Hóa đơn điện tử bán ra" e="Einvoice"></title>
  <subTitle v="Hóa đơn điện tử bán ra từ ngày %d1 đến ngày %d2" e="Einvoice Date from %d1 to %d2"></subTitle>
  <fields>
	<field name="tag" type="Boolean" width="60" >
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="trang_thai_tai" width="60" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="T. thái tải" e="Download status"></header>
    </field>
    <field name="mau_hd" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ký hiệu mẫu số" e="Form"></header>
    </field>
    <field name="so_seri" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ký hiệu hóa đơn" e="Seri No."></header>
    </field>	
    <field name="so_ct" width="100" allowSorting="true" allowFilter="true" align="right" readOnly="true">
      <header v="Số hóa đơn" e="Invoice No."></header>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày lập" e="Date Create"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày ký" e="Date"/>
    </field>
    <field name="mst_ngmua" width="110" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="MST người mua/Người nhận hàng" e="Code Tax"></header>
    </field>
    <field name="ten_ngmua" width="250" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên người mua/Người nhận hàng" e="Name Customer"></header>
    </field>
    <field name="t_tien_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tổng tiền chưa thuế" e="FC Amount"></header>
    </field>	
    <field name="t_thue_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tổng tiền thuế" e="FC Tax"></header>
    </field>	
    <field name="t_ck_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tổng CKTM" e="FC Discount"></header>
    </field>	
    <field name="t_phi_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tổng phí" e="FC cost"></header>
    </field>	
    <field name="t_tt_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tổng tiền thanh toán" e="FC Total"></header>
    </field>	
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>	
    <field name="ten_trang_thai%l" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Trạng thái hóa đơn" e="Invoice Status"></header>
    </field>	
    <field name="ten_ket_qua_ktra%l" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Kết quả kiểm tra" e="Check result"></header>
    </field>
    <field name="id_hd" width="100" allowSorting="true" allowFilter="true" readOnly="true" hidden="true">
      <header v="Id hóa đơn" e="Id"></header>
    </field>
    <field name="ma_ct" width="60" allowSorting="true" allowFilter="true" readOnly="true" hidden="true">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="ma_ct_ht" width="80" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct_ht]', Value: '[stt_rec_ht]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct hạch toán" e="VC. Code"></header>
    </field>
    <field name="ten_ct_ht" width="200" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên chứng từ hạch toán" e="GL Voucher"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true" isPrimaryKey="true">
      <header v="" e=""></header>
    </field>
    <field name="user_id0" width="0" hidden="true" isPrimaryKey="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_ht" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="mst_ngban" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
	<field name="mau_hd_goc" width="100" allowSorting="true" allowFilter="true" readOnly="true" hidden="true">
      <header v="Ký hiệu mẫu số" e="Form"></header>
    </field>
    <field name="so_seri_goc" width="100" allowSorting="true" allowFilter="true" readOnly="true" hidden="true">
      <header v="Ký hiệu hóa đơn" e="Seri No."></header>
    </field>	
    <field name="so_ct_goc" width="100" allowSorting="true" allowFilter="true" align="right" readOnly="true" hidden="true">
      <header v="Số hóa đơn" e="Invoice No."></header>
    </field>
    <field name="ngay_ct_goc" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true" readOnly="true" hidden="true">
      <header v="Ngày lập" e="Date"/>
    </field>
    <field name="ket_qua_ktra" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
	<field name="dn_rr_yn" width="80" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Hóa đơn rủi ro" e="EInvoice Risk"></header>
    </field>
	
  </fields>
  <views>
    <view id="Grid">
	  <field name="tag"/>
	  <field name="trang_thai_tai"/>
	  <field name="mau_hd"/>
	  <field name="so_seri"/>
	  <field name="so_ct"/>
	  <field name="ngay_lct"/>
      <field name="ngay_ct"/>
	  
	  <field name="mst_ngmua"/>
	  <field name="ten_ngmua"/>
	  
	  <field name="t_tien_nt"/>
	  <field name="t_thue_nt"/>
	  <field name="t_ck_nt"/>
      <field name="t_phi_nt"/>
	  <field name="t_tt_nt"/>
	  <field name="ma_nt"/>
	  <field name="ty_gia"/>
	  <field name="ten_trang_thai%l"/>
	  <field name="ten_ket_qua_ktra%l"/>
    
	 
	  <field name="id_hd"/>
	  <field name="ma_ct"/>
	  <field name="ma_ct_ht"/>
	  <field name="ten_ct_ht"/>

      <field name="stt_rec"/>
	  <field name="user_id0"/>

	  <field name="stt_rec_ht"/>
	  <field name="mst_ngban"/>
	  <field name="mau_hd_goc"/>
	  <field name="so_ct_goc"/>
	  <field name="ngay_ct_goc"/>
	  <field name="so_seri_goc"/>
	  <field name="ket_qua_ktra"/>
	  <field name="dn_rr_yn"/>
    </view>
  </views>
 <commands>
    <command event="Loading">
      <text>
       <![CDATA[<encrypted>2/AILa5Y+dPEWcMqYI7nIO8OEXUY/R6c7sn9vhC37UYPFc9fRuwaOhpdkYE6CpkRJXYpeJQf6mZDFO15CmR33UwXvhtGQaQLTcWIXjQB1BPull+CSL1hpkZAkNzses/yp+UTbu3Wnz84upw9CBJshnVCAKh0/TdfDsxeWLm0yfObspRK6biw2CHR0g2j2q8scgx4yNscXOCGmhdPZFcKk2rwiwD4FboUPZ6fQ54ot9o=</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kveMVpP177kKofYOnxe2/b9H/wS3atgD2Sai5PDi7Sor+YRP3rZOn4WtYgsxoAFl8ociIhJzbp6YjwLZS8cRGUM=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ku0s+MPpSw+4BviHGbpGdzmfyHR4o7kMFkgcV8IF788NeGSFsV3oPRikiY+QT/tRUqEgJ7LJBBOv5piVkre9bso=</encrypted>]]>
      </text>
	</command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>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</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>0ivTuIBvYaEzWkvKf0a0flNmg7O0YSEVTTGtdWwGcI7YWyB+dUnHWtWwJiUlhCMwa8nzPaPlnhtGzdy1EVoh3efnGc2kLYckyYaFebW6PCEIixXSSMBbfzkIbIyf4EzCkqVbLG/cQzYWZ8iqGUfQ0F5hCzWP9kPrzp4N9VaJLxCe37LyLvxbOf0C/ig9CVX/QYICkBjGVwrfEe0TvqgdHdKyTN7v4RjrT6dhY2kpDP6Y8YY5y/N/x2TCi6s75iMr/NpWJ+E7km+xHPpramAHpO3BUT5NNRpeQ3IgktSRhOE=</encrypted>]]>
    </text>
  </css>

  <response>
    <action id="REConvertEI">
      <text>
        <![CDATA[<encrypted>B2areL+uYzxodFihCtuETvfE30oPBhpX1G3PCAOomWsLnCKt1KKWg5iK4dW0yIy/jQJ4Ja8LylcN9fQzWKvxZn2+WxAEMO1xOXUJTp6uipN8j55ePzA6Rw1+0QABF8wC6wvW/uuEGueq1J3JtAid2lNENyImnhKQlQ55toosIJIaudkd7RTwcx1TCkcpNXKC03jmCXKZsMV+2PV08LLaw+yn1Ke/wXeYwo4qaXOTMjXV+L1CDdyj4ditS+I6LcltQy7YIQgyqRPFf9KjBRODNoXILLWyAwX00P8IIt0IwH8=</encrypted>]]>
      </text>
    </action>
    <action id="DeleteEI">
      <text>
        <![CDATA[<encrypted>i7A1BeVLDEW3bIsE+q8LTSEIa3QZIkNXm10YyYHaYDhdVZvM5oHf35sji+Hg2pJ4GIuzLVAqLsRxQpEj1GJXmTs4go/luhPcDH2LVKjw65v+Yj1pLb2NFkdgrNQc0mXIlnFHWEviEa29VeyCXgDydMWdvrLcgUJ61smdP3yPbihwCAACd/9DtonHGW4av+fXXCXxhANU8rvOrFX1tjI7vreBVrAbrrIF3+CQ8T0NBs+rbQb6vRnVlrhqNq3fIX3fi5O6uf12A7kvPvGqo+KGq3rLZK7NW/c0ly00W5zILGHKTrJVncWem9l2pZzjCMDdQkKr1wmXT3ByMlIRWyPD8W9ddrMalgdwYHFqVbBHsmHHQBjibPsXmbGZ6Vpg0YXVytAAMysMJ67iuphyp9r5fQ==</encrypted>]]>
      </text>
    </action>
     <action id="HachToanEI">
      <text>
        <![CDATA[<encrypted>kO0sftGgIiqit4liQ+m8NjtXGjzAiLDYShYEAxt7TNNPqkzumy6m0LZfKTBFsvuAeaSY87Hg+hSyFr2fKKeXh9vDKckf8IDnwQFpiEFRUxWaXuanCah40DBFX2NM8/UdTexxVJhzBWcOTh/SAxTPU5hm+b08qww60lPuYFPvk46jQATD5N1312CiDtNNAY9uA7wKL0KZdzU5q4UWr21mCUzPUVU0sX/I3CWYcA9d/hLJI2X461ItbnqpB8T1iXfyjJQyVx+9nN0eSLIhB66uDLZD0PFdl63OZEU3h6rkJby6mS352exQi4xt+GEC7AkkytGQpQnVZaR6FpLJDPXSbN1vZZRgSzT9R0S77aTWF0qfkqZvBjEEijrZq8f+HrOhz0IjvFTlXvOuc1W6cNOqWyyPk59zfD1w5M7KG6jzy1o49LBAWhIjiQhHmYejeJtLaj6E1e29AvFNM6RNH7HJ/5/sZDRUNzdfJVHuVua/JI8wxVtsgHuimw2a2H4gZSaG7ptkSc13br5izjaBjoVIkZWZSiYMs9YUqi4pPu3fRoq1aS0lfzlig4lyroILGImjwH0l5U+veEGSqLg611ttmSsmXn8Rv2p8H6cO9Ye32YxD0imhmFgctiDYc1bVWJDCjuojo6gBvdFK3GhHUxr2DznfLXhoTBcgWsDUJ5R7Zqyoion7NRrtbFSMGhy8lwJ3r065mAKiLn9BwzzuxXN1CwjR7yGD63RHAJnNGZTb2m4vLi2AHJH1wVl7SNuU8ask0glUJtkLVeY5cCGHKdEgtj9zuMBdx+Dw0DtROBAWqyi1hdcoRRdCvmS2mjRL6ADReu/ND6EnS/UtmxN5CWfjkQuLYutqvqo6UauVwOfweQlPgTLIPFiNbBhzl89MFes6EqqQW95ZOiRI/D5NXXSN+w==</encrypted>]]>
      </text>
    </action>
    <action id="GetInfoTax">
      <text>
        <![CDATA[<encrypted>oP1Idi9EnfdEf2oH1pKzbgWj2h1jYaA1tS1AKI4Yw9pJIK/UbKB8xtPoAhyvoA+kjosPgI3dXlWJMfRB/zPxRCGTHh8wW7ZE/L8oaVndXRjKxMitTu87RvgmdyFgyz+ekKuAP5xSXFWmgyEOtoxVUqPyi++lCg/nLDEG4M0fZZ/d0rKCUYpjUUi+T8WRoZfECiYo02SOkypnmjgldpRPrMTJ4PA0TvidbKw9+kigS0ELznn3+paM84Ize7fJdGiS8Ekw9XzCr2EmBBg5xQSGZ95W1Obq1ypLM0vlclZV7REwFpLI/QCSLexsJsecZvWbqZYVDLIjXxToflr+Ou38AM0daoCMu9oDRcyOHYilIsI=</encrypted>]]>
      </text>
    </action>
    <action id="GetInfoTaxDetail">
      <text>
        <![CDATA[<encrypted>IgQWctNtiLVN+wZxzcQZ24h+t7vM062XhNfkY1qEnlB5jmf+vy4nA5WlgEKI3F/+z1ZqLTnUIlPspEksn0n4Tq1h4J+8p3Mh1BmcPJNv8Oc0w2ilc6nvmxwD5MGesnLCf64aNTPy8qhpb/6mLBDJO1vuPxUDP6Y570nmJTkMlGWlbAnwUAln3qzy6XusrI878EBhgUaBDmLZ0icmeE25oQEHNyTrTPvEcZMFbP7quUyNehWdTscjArLJBZLfmywI8owwBFmGKsgx1kofDOiF3joucq1dmQQSJPVwTaV3AouUEnEunTb9QPD+fxo9UsECvypzizxv29Etk2mH4yLFAMDJXYGaqO6yOwlbGs3BrmL2pNicAuU/D5HkSHYh4FlmoRBefjTfw3HpWAzAeo0FD/6U4ZJSljMD8z0vsSmtzFMhfNdlcK3ctJcjSDwwwnOWhSpQE26t/DtgUIMsqpZNed4CmqOHvVVu/K7iTZEb35i2tFAJ4ZBBtRKPZWa2qFr3GC3gOftrTHSr1mKWz3RbC1y5OBZPgzQ3cLdKFOUDsDMTbeOBcDQn/mcaVzY70ekqXPy8OB5thNQg8srEiELwIQ==</encrypted>]]>
      </text>
    </action>
     <action id="TaoKH">
      <text>
        <![CDATA[<encrypted>71yVMDdVLz3aGPeEom6S3iuJBSHdfXaUqPatGeCo2pL5cDLmvcRzj6Q98xKWCQqzqHLzVmoS3S1whdjoOJcEDSJFf3o4M/WQrPx0uE1DLZ4KbeaA7gFceNe6j8SrrDKlbF0q19wcZy0I/pBnMe3aUhr6NHnB+9c1LuVEBVx/7vE=</encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>

   <button command="HachToanEI">
    <title v="Chuyển hạch toán" e="Convert GL"></title>
	    <menuItems>
			<menuItem commandArgument="10">
				<header v="Hóa đơn bán hàng"  e="Sales Invoice"/>
			</menuItem>
			<menuItem commandArgument="20">
				<header v="Hóa đơn dịch vụ"  e="Service Invoice"/>
			</menuItem>
			<menuItem commandArgument="30">
				<header v="Phiếu nhập hàng bán trả lại"  e="Sales Return"/>
			</menuItem>

      </menuItems>
  </button> 
  
    <button command="TaoKH">
      <title v="Tạo DMKH/NCC theo MST" e="Create Customer"></title>
    </button>
	
   <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="DeleteEI">
      <title v="Xóa" e="Delete"></title>
    </button>
   <button command="REConvertEI">
    <title v="Tải lại hóa đơn" e="Re Convert Invoice"></title>
  </button> 
   <button command="ConvertEI">
    <title v="Lấy hóa đơn từ TCT" e="Convert Invoice"></title>
  </button> 
   <button command="LoginEI">
    <title v="Đăng nhập TCT" e="Login"></title>
  </button> 

    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
	<button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
   <button command="View_mst">
      <title v="Xem thông tin người mua" e="Buyer Information"></title>
    </button>
    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>


</grid>


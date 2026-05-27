<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
	<!ENTITY FilterID "user_id0 = @@userID">
	<!ENTITY TransferID "Eigetinput">
]>

<grid table="vct60view" code="ngay_ct" order="ngay_ct" filter="&FilterID;" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Hóa đơn điện tử mua vào" e="Einvoice"></title>
  <subTitle v="Hóa đơn điện tử từ ngày %d1 đến ngày %d2" e="Einvoice Date from %d1 to %d2"></subTitle>
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
    <field name="mst_ngban" width="110" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="MST người bán/MST người xuất hàng" e="Code Tax"></header>
    </field>
    <field name="ten_ngban" width="250" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên người bán/Tên người xuất hàng" e="Name Customer"></header>
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
    <field name="t_phi_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true" >
      <header v="Tổng phí" e="FC cost"></header>
    </field>	
    <field name="t_tt_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tổng tiền thanh toán" e="FC Total"></header>
    </field>	
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="80" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="true" readOnly="true">
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
	  
	  <field name="mst_ngban"/>
	  <field name="ten_ngban"/>
	  
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
      <![CDATA[<encrypted>CAmfU/XCHHYFmdA7FgSHPhhaD68r/xdVk0jcI6aPb6rxAZGoUyVXgrTw7mNKt5EuyMa1OgC6j7+8Q5KhVgnUGKzMPTIZXnO2hYeLneuixN0=</encrypted>]]>
    </text>
  </css>

  <response>
    <action id="REConvertEI">
      <text>
        <![CDATA[<encrypted>B2areL+uYzxodFihCtuETj0sVJ8B87xZrkml0CnpOqQcffTNjnLTpvURyXv/EQGbjxGyLE1kc5aIOd/gH/u9PQ7WxtYkWe1dhHrHjbyeO2I8xR3zpuVoaY/j9kDuxXh7zlAD8J/RJ6/yKtBfmr92VkoF6oF9HNlLR2KxMEDrh6kCLZOOhvbHuUnA5wH4GbO+aEsGVeXJwd9uGOQElpg9Zf29/xXWO4pNzOGAdH/SSMwGq6pnameI+MaVu26XNidcIRY6ulEh67MnIp8+tjM4s+o6G2cd0AptYX7jJPatts4=</encrypted>]]>
      </text>
    </action>
    <action id="DeleteEI">
      <text>
        <![CDATA[<encrypted>eYlayyx1cZOL4QjaTOAYFq+BhQAJVDrhXhurYD7uiElweQO4fWvV8wxfBD1cK9pvVts87mvilNdjHYOavijTtwKvdx4tExgtPxKK7mF/B7CSoftuoO7S0P4n5fv3mLbpB8N4F4Tk3F4J7f1uPmf9Gfw3ff1vRbMASz/gNy9Ps5kbpwzJsjMPcRdz09KnvN80CJC3sp3P/LN9F/dWv+QOup+9Gj9K6h9bhE5D5kSuWY9SGmADDpqNup5xYt9zIhYXtmpelOP+aOSar2EfjAALry6pkB9ZaYymed2Ro3QLAxd9lkKUJX0Sqo+bvX3nx6F9Rnia2q5oln/+XsyHN95/SG7L6IwoZjVbu91u+TOYNHs3nVTGAMLzWO+VF3Xo9KfMMVlSx/a8Xx6OyeFKYcMa7w==</encrypted>]]>
      </text>
    </action>
    <action id="GetInfoTax">
      <text>
        <![CDATA[<encrypted>oP1Idi9EnfdEf2oH1pKzbjqksSeMBNm/3qyY2FSikgyQrFqKjll5zo4vyKadwSnX/z3oi4tghV4DMfitVo01C9e9aQlHlHs3eGcdyHstQmbFeJntbM9iTojcsvyt1RFoqOwnuVETTZR2AaH5brZOrlsiAEiohnmQSCkrznidGTD/81cYs8HKj/ebx9Bk6kWwbBEnBNf6/uLuA9W1qvI1+txMBU0Eshpzt9x6+fB4fXaXZU+EXZFSwlAZximEzTYVn9tJG69UDaXfdj117woZXQxnJmFw0xfzXWZ8RPvahTK0M+aPMteLyPJtnMRGwe6xnJI4B53tWCcjilN+DR57GIhSS0Durw7GRWbsN1hOe+E=</encrypted>]]>
      </text>
    </action>
    <action id="GetInfoTaxDetail">
      <text>
        <![CDATA[<encrypted>IgQWctNtiLVN+wZxzcQZ2zNXf28a/fLckMRrwyHIodNiFKRqepByIAjxSFJMT93Gj4+4wkCsdV1egkWATWH2TBbtYWil31cUYr7QSAouJGlJOoYVJGtg8t5vFSB1fVGMW6odMEC+FlQnwxo9gvK7wNhu8/7iKHGWXYXZ7oTam4iJjiA3hplBE/YFx+B56rr3d83SKCt+C/0uOj6ieA0h9aFmd+GUK5jOjeFm7K8oirvAn1RTElZUeIVCRB9khCcCMXwcFSLeRNqxOmLLc3gxbP+YuuZO3dS2mO+ijEBZaunXoxe6Cgj8dxwcas95iYs3GlSYudDrTmW4v+5uEAxaoKMI17JZBE2ueTF6R0+aKwO+7/O8TPo0+f66fBZ0ajd18j3gZyUHgHptXGnUudkMuGS0NTnb7RLUPouIuc7dI4lt3Mb7urmhnFg/lDYl/Lf61rS6npHzKYBspg6rcwlE0f+0V/FbGhuk3IKTf3lSjfM4Hbt7CJ49TzkqCGYf4fcQW7f7OM7sn6EAD9ezpNF6veFlMK2BeZp49zAjk606AeVE3ixjsvAwGlwIj5YuisbBtAuP7CS+dWKSvdNVCHv+6Q==</encrypted>]]>
      </text>
    </action>
     <action id="HachToanEI">
      <text>
        <![CDATA[<encrypted>uG8g5sZ/+6u/NvaTFc+3RM6rWpZS+A5dMtnRr9IW2ZmAZMTXkNuuaVwgOonqZeCzv2K6RqESTE1uLAuVv1ODv2XbWBcU2m/LUdxz+8mRHKebEI0qqF5Y9OsQuywGho2soBbzsYYID+ijMdxbhJqEt9J1SmS9jd8X8ueNhYT93fUK0XGyaHy4v5Fb4/vnhoR+eyXqfOcoZx9xR5kevpFqjzHC58smLtT7q+4CPNxVV4F8UFcNc1p6DKvvyDizZIhXRH/8EBLndtJPkEiwRfeYAhCVGRtc0o9ps40A3pw+XiMJ1tD1ybiW6XcA5qZqCAvpZLxqxojaFWqLV1ISmtCUVeqaGPU7TIfRoaze+RsiTyooIk7hTAAtqXTfSkhO/L6lWa6X4FmoDL7Z/Att1zxg4A/EBLKhGN7jWklRk06sgmxfxbzQmPO31RBTKqX+1Is4GyfRSav+D1Ex4+ttd7fTyLvLj7degK2J7NQ7vpF2imQpl1xaiXm+Yg4ejtp/UDYKaGPTNd6mow1KKjJeAh/CxF1Re5EXHXuZlbFT0+Si0576xboR8l5pd1L+cqKZnslDdGnDSuN9BYzOTiB76MZ1tzfJDu5Z9l4Qn5eehK+tRSasDrNnezewBGcgqgF9fwcb7qXGzOp/GGdnqS01lXdF1Yq+7teXN/b53KXWS+JY2dkFCKu2UvEEzguwt6dQV10aXVktKnLhhng7y+VEA+6VcqnTj34hrXa43mFLVlJ6gRcUY3NMbIeNVWnQQSmQdJu1TDLjIXiLtrGR23gkweUAnsjHWb4KaW5CNvt4jaZZDDM9BW0Jbes2MuzGENe5jAG0XpM5kOPbJ5bjEUMYxNNKTtouBxyR7GYVhYWEJnHwfiAr70AcZgPDQLSu7H9rZkVaQdpgnUAUW4128QLTtuksr+Kl1jo8sD6+/DDNNraqSbs=</encrypted>]]>
      </text>
    </action>
     <action id="TaoKH">
      <text>
        <![CDATA[<encrypted>71yVMDdVLz3aGPeEom6S3hx/Uf0CKlPIgYbIqDhgU1lGIOVBtZUMoUuB4iQdJK1zcEvarOfWqUiGSq6cDoubNDB1B60ALqvPJg+r6iWgx6pXB6ZGzB8WGx1UGEH4lj6WcHXkqRI+k6a/KvSPLWixCzssPeji+0/EMb81IhvMhcw=</encrypted>]]>
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
				<header v="Hóa đơn mua hàng trong nước"  e="Domestic Purchase Invoice"/>
			</menuItem>
			<menuItem commandArgument="20">
				<header v="Hóa đơn mua hàng dịch vụ"  e="Service Purchase Invoice"/>
			</menuItem>
			<menuItem commandArgument="30">
				<header v="Hóa đơn nhập mua xuất thẳng"  e="Purchase Receipt - Direct Issue Invoice"/>
			</menuItem>
			<!--menuItem commandArgument="40">
				<header v="Hóa đơn điều chỉnh giá hàng mua"  e="Purchase Adjustment Transaction"/>
			</menuItem>-->
			<menuItem commandArgument="60">
				<header v="Phiếu xuất trả lại NCC"  e="Service Return to Supplier"/>
			</menuItem>
			<menuItem commandArgument="70">
				<header v="Phiếu chi"  e="Cash Payment"/>
			</menuItem>
			<menuItem commandArgument="80">
				<header v="Báo nợ ngân hàng"  e="Bank Debit Advice"/>
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
      <title v="Xem thông tin người bán" e="seller Information"></title>
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


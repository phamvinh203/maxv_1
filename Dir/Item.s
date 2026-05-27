<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="dmvt" code="ma_vt" order="ma_vt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="vật tư" e="Item"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_vt" allowNulls="false">
      <header v="Tên hàng" e="Description"></header>
    </field>
    <field name="ten_vt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="dvt" allowNulls="false" clientDefault="Default" categoryIndex="1">
      <header v="Đơn vị tính" e="Unit of Measure"></header>
      <items style="AutoComplete" controller="UOM" reference="ten_dvt%l" normal="true" key="status = '1'" check="1 = 1" information="dvt$dmdvt.ten_dvt%l"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" hidden="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" categoryIndex="1">
      <header v="Nhiều đvt" e="Multi-UOM"></header>
    </field>
    <field name="vt_ton_kho" type="Boolean" clientDefault="true" defaultValue="true" categoryIndex="1">
      <header v="Theo dõi tồn kho" e="Stock Control"></header>
    </field>
    <field name="lo_yn" type="Boolean" categoryIndex="1">
      <header v="Theo dõi lô" e="Lot Control"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA11UmOFnLM1DDgncS4J/9vmTNvywcO/Pa6LLXWKg6TxkfL4zi8d+kwcHWA32rGE6W0w==</encrypted>]]></clientScript>
    </field>
    <field name="kk_yn" type="Boolean" clientDefault="Default" categoryIndex="1">
      <header v="Theo dõi kiểm kê" e="Physical Count"></header>
    </field>

    <field name="dvt2" clientDefault="Default" categoryIndex="1">
      <header v="Đvt 2" e="Unit 2"></header>
      <items style="AutoComplete" controller="UOM" normal="true" key="status = '1'" check="1 = 1" />
    </field>
    <field name="he_so" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="1" >
      <header v="Hệ số quy đổi" e="Hệ số"></header>
      <items style="Numeric"/>
    </field>


    <field name="gia_ton" type="Byte" columns="3" categoryIndex="1">
      <header v="Cách tính giá tồn kho" e="Valuation Method"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="1">
          <text v="Giá trung bình" e="Monthly Average"/>
        </item>
        <item value="2">
          <text v="Đích danh" e="Specific"/>
        </item>
        <item value="3">
          <text v="Nhập trước xuất trước" e="FIFO"/>
        </item>
        <item value="4">
          <text v="Trung bình di động" e="Moving Average"/>
        </item>
      </items>
    </field>
    <field name="loai_vt" allowNulls="false" clientDefault="Default" categoryIndex="1">
      <header v="Loại" e="Item Type"></header>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1" information="ma_loai_vt$dmloaivt.ten_loai_vt%l"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt1" clientDefault="Default" categoryIndex="1">
      <header v="Nhóm hàng hóa 1" e="Item Group 1"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt2" clientDefault="Default" categoryIndex="1">
      <header v="Nhóm hàng hóa 2" e="Item Group 2"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt3" clientDefault="Default" categoryIndex="1">
      <header v="Nhóm hàng hóa 3" e="Item Group 3"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt3%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" clientDefault="Default" categoryIndex="1">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa406h+y/KUPi5vr/dGPsRD9c3QQryMzvSu3JtVOZXDBGj</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" categoryIndex="1">
      <header v="Vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c[ma_kho]}' and status = '1'" check="ma_kho = '{$%c[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_thue" clientDefault="Default" categoryIndex="1">
      <header v="Thuế giá GTGT" e="VAT"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_thue_nk" clientDefault="Default" categoryIndex="1">
      <header v="Thuế nhập khẩu" e="Import Tax"></header>
      <items style="AutoComplete" controller="ImportTax" reference="ten_thue_nk%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthuenk.ten_thue%l"/>
    </field>
    <field name="ten_thue_nk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_vt" allowNulls="false" clientDefault="Default"  categoryIndex="2">
      <header v="Tk kho" e="Inventory Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="sua_tk_vt" type="Boolean" categoryIndex="2">
      <header v="Sửa tk kho" e="Edit Inventory Account"></header>
    </field>
    <field name="tk_gv" clientDefault="Default"  categoryIndex="2">
      <header v="Tk giá vốn" e="COGS Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_gv%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_gv%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_dt" clientDefault="Default"  categoryIndex="2">
      <header v="Tk doanh thu" e="Sales Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_dtnb" clientDefault="Default"  categoryIndex="2">
      <header v="Tk doanh thu nội bộ" e="Internal Sales Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dtnb%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dtnb%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_tl" clientDefault="Default"  categoryIndex="2">
      <header v="Tk hàng bán trả lại" e="Sales Return Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_tl%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_tl%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_dl" clientDefault="Default"  categoryIndex="2">
      <header v="Tk đại lý" e="Consignment Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dl%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dl%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_spdd" clientDefault="Default"  categoryIndex="2">
      <header v="Tk sản phẩm dở dang" e="WIP Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_spdd%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_spdd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_cl_vt" clientDefault="Default"  categoryIndex="2">
      <header v="Tk chênh lệch giá vốn" e="Cost Difference Acct."></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cl_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cl_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_ck" clientDefault="Default"  categoryIndex="2">
      <header v="Tk chiết khấu" e="Discount Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_ck%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_ck%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="tk_cpbh" clientDefault="Default"  categoryIndex="2">
      <header v="Tk chi phí khuyến mãi" e="Promotion Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cpbh%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cpbh%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>


    <field name="kieu_lo" type="Byte" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="3">
      <header v="Kiểu lô" e="Assignment"></header>
      <footer v="1 - Tính theo ngày nhập, 2 - Ngày sử dụng" e="1 - When Received, 2 - When Used"></footer>
      <items style="Mask"/>
    </field>
    <field name="cach_xuat" type="Byte" dataFormatString="1, 2, 3, 4" clientDefault="1" align="right" categoryIndex="3">
      <header v="Cách xuất" e="Issue Method"></header>
      <footer v="1 - Theo hạn sử dụng, 2 - NTXT, 3 - Liên tục, 4 - NSXT" e="1 - Expiration, 2 - FIFO, 3 - Sequential, 4 - LIFO"></footer>
      <items style="Mask"/>
    </field>
    <field name="so_ngay_sp" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="3">
      <header v="Vòng đời sp (số ngày)" e="Shelf Life Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_ngay_bh" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="3">
      <header v="TG bảo hành (số ngày)" e="Warranty Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="tao_lo" type="Boolean" categoryIndex="3">
      <header v="Cho phép tạo lô ngay khi nhập" e="Allow creating lot when receiving"></header>
    </field>
    <field name="sl_min" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="9">
      <header v="Số lượng tồn tối thiểu" e="Minimum Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_max" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="9">
      <header v="Số lượng tồn tối đa" e="Maximum Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="volume" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="9">
      <header v="Thể tích" e="Volume"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtvolume">
      <header v="" e=""></header>
    </field>
    <field name="weight" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="9">
      <header v="Khối lượng" e="Weight"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvtweight">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="305">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110: [ma_vt].Label, [ma_vt]"/>
      <item value="11000: [ten_vt].Label, [ten_vt]"/>
      <item value="11000: [ten_vt2].Label, [ten_vt2]"/>

      <item value="10100111: [dvt].Label, [dvt], [nhieu_dvt], [nhieu_dvt].Label, [ten_dvt%l]"/>
      <item value="111101100: [vt_ton_kho], [vt_ton_kho].Label, [lo_yn], [lo_yn].Label, [kk_yn], [kk_yn].Label"/>
	  
	    <item value="10100101: [dvt2].Label, [dvt2], [he_so].Label, [he_so]"/>
	  
	  
      <item value="1010000: [gia_ton].Label, [gia_ton]"/>
      <item value="101001000: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="101001000: [nh_vt1].Label, [nh_vt1], [ten_nh_vt1%l]"/>
      <item value="101001000: [nh_vt2].Label, [nh_vt2], [ten_nh_vt2%l]"/>
      <item value="101001000: [nh_vt3].Label, [nh_vt3], [ten_nh_vt3%l]"/>
     
      <item value="101001000: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="101001000: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="101001000: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="101001000: [ma_thue_nk].Label, [ma_thue_nk], [ten_thue_nk%l]"/>

      <item value="110010: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11: [sua_tk_vt].Label, [sua_tk_vt]"/>
      <item value="110010: [tk_gv].Label, [tk_gv], [ten_tk_gv%l]"/>
      <item value="110010: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="110010: [tk_dtnb].Label, [tk_dtnb], [ten_tk_dtnb%l]"/>
      <item value="110010: [tk_tl].Label, [tk_tl], [ten_tk_tl%l]"/>
      <item value="110010: [tk_dl].Label, [tk_dl], [ten_tk_dl%l]"/>
      <item value="110010: [tk_spdd].Label, [tk_spdd], [ten_tk_spdd%l]"/>
      <item value="110010: [tk_cl_vt].Label, [tk_cl_vt], [ten_tk_cl_vt%l]"/>
      <item value="110010: [tk_ck].Label, [tk_ck], [ten_tk_ck%l]"/>
      <item value="110010: [tk_cpbh].Label, [tk_cpbh], [ten_tk_cpbh%l]"/>

      <item value="110100: [kieu_lo].Label, [kieu_lo], [kieu_lo].Description"/>
      <item value="110100: [cach_xuat].Label, [cach_xuat], [cach_xuat].Description"/>
      <item value="1100: [so_ngay_sp].Label, [so_ngay_sp]"/>
      <item value="1100: [so_ngay_bh].Label, [so_ngay_bh]"/>
      <item value="-11000: [tao_lo], [tao_lo].Label"/>
	  
      <item value="110: [sl_min].Label, [sl_min]"/>
      <item value="110: [sl_max].Label, [sl_max]"/>
      <item value="1101: [volume].Label, [volume], [dvtvolume]"/>
      <item value="1101: [weight].Label, [weight], [dvtweight]"/>
      <item value="100000: [ghi_chu].Description"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="25, 95, 25, 5, 75, 25, 75, 100,130">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="130, 25, 5, 75, 100, 230">
          <header v="Tài khoản" e="Account"/>
        </category>
        <category index="3" columns="130, 25, 5, 70, 100, 230">
          <header v="Lô" e="Lot"/>
        </category>
        <category index="9" columns="120, 30, 70, 30, 70, 230">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>

    <view id="Form" height="281">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110: [ma_vt].Label, [ma_vt]"/>
      <item value="11000: [ten_vt].Label, [ten_vt]"/>
      <item value="11000: [ten_vt2].Label, [ten_vt2]"/>

      <item value="-10100111: [dvt].Label, [dvt], [nhieu_dvt], [nhieu_dvt].Label, [ten_dvt%l]"/>
      <item value="-10111011: [vt_ton_kho].Label, [vt_ton_kho], [lo_yn], [lo_yn].Label, [kk_yn], [kk_yn].Label"/>
      <item value="-1010000: [gia_ton].Label, [gia_ton]"/>
      <item value="-10100100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="-10100100: [nh_vt1].Label, [nh_vt1], [ten_nh_vt1%l]"/>
      <item value="-10100100: [nh_vt2].Label, [nh_vt2], [ten_nh_vt2%l]"/>
      <item value="-10100100: [nh_vt3].Label, [nh_vt3], [ten_nh_vt3%l]"/>
      <item value="-10100100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="-10100100: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="-10100100: [ma_thue_nk].Label, [ma_thue_nk], [ten_thue_nk%l]"/>
      <item value="1101100001: [ma_vi_tri], [status].Label, [status], [status].Description, [ten_vi_tri%l]"/>

      <item value="110010: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11: [sua_tk_vt].Label, [sua_tk_vt]"/>
      <item value="110010: [tk_gv].Label, [tk_gv], [ten_tk_gv%l]"/>
      <item value="110010: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="110010: [tk_dtnb].Label, [tk_dtnb], [ten_tk_dtnb%l]"/>
      <item value="110010: [tk_tl].Label, [tk_tl], [ten_tk_tl%l]"/>
      <item value="110010: [tk_dl].Label, [tk_dl], [ten_tk_dl%l]"/>
      <item value="110010: [tk_spdd].Label, [tk_spdd], [ten_tk_spdd%l]"/>
      <item value="110010: [tk_cl_vt].Label, [tk_cl_vt], [ten_tk_cl_vt%l]"/>
      <item value="110010: [tk_ck].Label, [tk_ck], [ten_tk_ck%l]"/>
      <item value="110010: [tk_cpbh].Label, [tk_cpbh], [ten_tk_cpbh%l]"/>

      <item value="110---1: [sl_min].Label, [sl_min], [cach_xuat]"/>
      <item value="110---1: [sl_max].Label, [sl_max], [so_ngay_sp]"/>
      <item value="1101--1: [volume].Label, [volume], [dvtvolume], [so_ngay_bh]"/>
      <item value="1101--1: [weight].Label, [weight], [dvtweight], [tao_lo]"/>
      <item value="100000: [ghi_chu].Description"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>

      <categories>
        <category index="1" columns="0, 25, 95, 25, 5, 70, 25, 75, 230, 0">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="120, 25, 5, 70, 100, 230">
          <header v="Tài khoản" e="Account"/>
        </category>
        <category index="9" columns="120, 30, 70, 30, 70, 230, 0">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
	<![CDATA[<encrypted>YW4yfOeROxWVdVRyh03iY+AyHOJYqcB/SDzadPE5NAsAjCK6c+JVt36GMaYqjXC4O505J45wC9aGpUHjNkCAK9mlFXagIEyyjsYBHaabEo82a1kYOP5yffBDRlJQCbekxbOvDl/tNaQFQU2oxheWwdpCXvTsfbPwE/+WQgUBqXwOJqPzWsZlaDBwxEDtaZTUUBDX+Bn17XzptksorKe1hwNgQ3QjS/+i/0Vv8ZZ7as0u2fj6Hkhr5EuHy7XYV/pohxHs80cd4W/+XEOcumezhWo3O8A23TYhw9Y5kI5XHunw9KADiPkYXsCuTGnv8ytYRz3Xz97e7odYsnAf0rfqySEPEh7eTvOXmjj5CeXBbAqkPfL3M/aR0+e7lUMJh18Qb0Y1hDtMgMro0MZYlr/TQgRc+9PrWMM+MTFEh22a/k81JdC0HPo3hQ4ci3gdxvwoNvovgsK790mzxivIbKP8bjqVz/zwLfDPsRfDeKorqGVBKVisejO2+rWXQSMQw6/N8IOygV+Qn5kkJM+gk0DonG+cWOn8ryHzl59ysZRuxksodKZQXJu1mmA814JNoCyve5Am1mRIWSi4SLT5COG26g==</encrypted>]]>

      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7cifIx4hFBcZL8uB8NvC/pvi6T67fBaXtfBeWLOeBRrbbcc0wFC+dlv3Uwdn2fQfFq2lmg2aIDW0IghK4lkYn1E=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
	<![CDATA[<encrypted>YW4yfOeROxWVdVRyh03iY+AyHOJYqcB/SDzadPE5NAsAjCK6c+JVt36GMaYqjXC4O505J45wC9aGpUHjNkCAK9mlFXagIEyyjsYBHaabEo82a1kYOP5yffBDRlJQCbekxbOvDl/tNaQFQU2oxheWwdpCXvTsfbPwE/+WQgUBqXwOJqPzWsZlaDBwxEDtaZTUUBDX+Bn17XzptksorKe1hwNgQ3QjS/+i/0Vv8ZZ7as0u2fj6Hkhr5EuHy7XYV/pohxHs80cd4W/+XEOcumezhWo3O8A23TYhw9Y5kI5XHunw9KADiPkYXsCuTGnv8ytYRz3Xz97e7odYsnAf0rfqySEPEh7eTvOXmjj5CeXBbAqkPfL3M/aR0+e7lUMJh18Qb0Y1hDtMgMro0MZYlr/TQgRc+9PrWMM+MTFEh22a/k81JdC0HPo3hQ4ci3gdxvwoNvovgsK790mzxivIbKP8bjqVz/zwLfDPsRfDeKorqGVBKVisejO2+rWXQSMQw6/N8IOygV+Qn5kkJM+gk0DonG+cWOn8ryHzl59ysZRuxksodKZQXJu1mmA814JNoCyve5Am1mRIWSi4SLT5COG26g==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>WLXzjZ5ABCKBu2kRWZZ1hzHXWHFJeDJpqXwHnVmA+Ozd61sK1Vyn7QjE8vTitM5To8GsmnhqlxSQhTlIBRPquHHNfxwIJH7KxJNSbK2Id9AHw++e3ym9/9bwymE4zpeW/d+LjhUGrnQ/nMGxNpbQb6aUFG69c4t2AvIoDk3BWc+lYNMAKKeeWgy6VLjF7T7XRylzNvaIyrSdS0oifrAZi9t1fp8RtzLyPgNV0Gr1bSmQWiyHOETveEYPNM53iQbEOsHW0/aY9ss6TtT/mlPFb3fR04YK1tJ73yZNEU3k97ndVFdLTCPjAn23IbID/ePeWO+Ae75/GgSQsBxImUmEafxFlPm5HZ9Thkmo4Mo4nT8dq+2BGdb3b8DNsPbQgxp4MkLisJAlPh4j+6/xy4baP4pbPXmFUZaSmGvImgNFcKrqUOJp7GRzpFSJ7/TikYW2bpLLlu6gvHghTPwZS7U5qVjmefS/HcOCPa/ESOD5kj4przYRMuDbd5iSKhYf3LkCF09GNQmJLzAgEA2jrda0yL0TlK89+ovtI0oaVmSaTLM4QQ1pNcAMX6mdJLrLcr+FtbQnsKzRSHClqPipa0QxDg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>ncE1NDvywkm2YMHhFb2uT/ms4CBjPELXJKfDKekLW3altuuKOtBkbrmIpj9iSISnmHUt4RqI1FtX44XdQrRZgSJ3Mujfv1KVKFrdsloldNjtdF79ZlJi8AGrcoUdBW3qbjGgASNXymI3FLOuwBXyu+r9CFqXaE8UOfPfcvGH8XkVAZok6lQqV3I0pK+rY0lyyTpl1weHpw8tn/LJ5JzRUstwEWq7qOwlVuJLPq5lT5GVYL3rSJDvBMt5cI8P5tMHDZN1xUYAdJjM4h+pzj0D+EUbClvWQUzsbB7HO5houvoPHTjHNxKoSzvJEnhDFCw4EghQ01DePd33d6eCViwR3s5exEC8TedebmbeCst1lMkKqiUf05ykMw+4lSEYPC/j</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>/z6TzuArFhZppxk326TrqW5gcnqXaQwmUFPwQaiuZ+Kx5Wn4s8eAX04BYAUXQZ/SzGOWFE8sIgdCR9t3S5Ki/nhah5LDqvYf8B7PlZXqHpZgY2NafFJ8XCU7GhnFXgMWTZ/696ZJkji7TQB0ZmRsJ54Ut1Eb6YWGpFjU//w26uoKMEA5Qmy/4W8wW9tohmEM0s+xd3eKTxxRq+qMBPBTZ9Xkj/g7KVXiQFsBIRWWjAXQrfeSoaKMKNUZJSmh1/Q4dVVXzPgRvazyM9jcz2s3ZSy/kRBung8elfXyNBWvP6LtktGK9PyxWpnDRAU6OkzPV/Z9Wphgn1e31noHy4BNLb46+avpJXF1XyAxXjRFYJnVQGc3ySUMdP2zJnD3XUg9fdxHtyWNjTh5QL+LYOFcjGkEwCaNQiyGnecD8jOCvAXzduMs4qwi1D+Qo4p2K6QYno05W2+QH+sGh2kEYxNKrxOnNyqJ5zO0Gu66DMFiC4LoEtLWTTCO17SiYcjg5CWbpxIJopaxKMc1ruwjVkAJDQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>F9hi1qFl7jBbYzcyJta+A2AgJaexdg/HHhDacMImfLdrAVUoTK03zVYxcrUJPTvbwQrxsqx6wDDLjqDXei3c3A6qCTI7ONtzCUZmZhQWiGdCV8Bq9B1ej/ey/U2UQC3Rh/W7xtSSVTNFm7Kr/w8tDeButYN1fysSYRsRN+HD4WfSoD7cGUqNilZKP8BFh7cVOusDZd7BZxgKGKdy0m7melowmomVkFw/uIe7uOEKGKwmaih7AXBLuZy8/lMqo4osIbkrORXE++5rf2csTO4ctlQskQVcB7UZQcBguntjUMYbcvC8dSB2bL+NPFRWOqnYtdtcjLntcdl865hxuc3sHo4xVlTJ8znhMJ2p6M3b5Yi1TcADuqEqVnqBFrscggMw</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>B591WJUJlEJwHXnXA4ljXeEKCgeG4c5AKRhJebtMt5N73lDsbPzcZOeCzt44zbLOsYQGjxYpJjxbFoeOIMvEXu14kSINLaiV6lkaAbAF6GL1ZnbZR15+f1D+22fxRyl7ESKd5aaZsKvewNEjFskVpBh3Zk1eTpcbymiApFLLmAOGDj0E3AbslZLaz/VWUMzuolADkeocj6LcwQgmluszlv23hDPygkLrb/k/rVwKhbqXtmzIuL1R6YSBxLBB6coi</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ZM0Yhb1gBE0SIPvcuakKa2530lPCiJE4eXHX+t8sX1SyPENpkJjUHFKnaE5JK5B0r6qE/hIsR86ie+LjkpCpBLXiTz4WcwrUoTPYwsf/+Iu2yermraLdH7BEEev1G6eD4vifKmpq7c8HQu+FcRKVNA/kyd3vSuqb899aasjQ4KVnkbhLDOt0ufrHBclzeBksrUSTQQ11RzEEcKT5Wht5Q23OSPVgdA2Y03iFQp9W+nIzCMkZT6EYIUugLFi2KJTShoKPPRuL2SgBpbbaIZuEeWkDqcGTUjQLMenZqhgRaEr/1VSBo4m8pfTjOMM4/CdH5lAXG4kOwX9w4rjZRy75/OerBA6z57bCi7HWaWXPHoasDL36gJHcEKZ6ng4rqAhBG0865SIkVVbomyM39q+wlG2IURA8by4eDULUCXd0ey/Clcd2W3k32cdC775mIxbV43mqXlvynHqOIhLAQoW80EDYgppFb7WPBYSV4gILaS3T1e4+x1vNrJA5GjRBJp6DWzxzRhbVyxEMTOCeb875nVNC/S+vMoR5n4o4EE2S5tO5VAj0sMSmWRDG1bT/yAEcfH8RifQNJra8l63sfeJAZ1uaBXqAcaTR4v9IZ6vi4QrBGfAg/KX1QtzM8Oa+SgZYxr12RBjbyhn1FnEYYgE3snbN2LK3A8CstSsc/EE4l9GiUcSxcIs5+2NBkdD97dDt6hCdrtwcsxQ5qjnrLyk9BuVWBS+bwOrlujQ/jFfnYwU1OhrjHjg+nl78Y1ZS9Aot</encrypted>]]>
      &ScriptSuggestion;
    </text>
  </script>

  <response>
    &XMLSuggestion;
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>psvP6uuIfjW3SzFdvVdQ6jupb0R5TtzmZzvIt0kn1fYtwRtn4ohq5c7SD815PlIJhEK0zOFVIFbbANHaBmPuNf19ksZN7M63BDcTyrWV0uuHrl40kV9k14Xv8cNog9P8z6vh45saGe5UDLrX+KzPwL8/W/z7P9d//oFy2FYBFpPWQhBlva7UaRObbZZFAAQXVSakSUvCEInWksehX+gm+H9YF3s+xHlIEKgigwiJBwlQnCF6TrTvRML6SIF/xX8s</encrypted>]]>
    </text>
  </css>
</dir>

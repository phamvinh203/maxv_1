<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="da_chuyen_yn" dataFormatString="0, 1, *" clientDefault="0" align="right">
      <header v="Dữ liệu" e="Dữ liệu"></header>
      <footer v="0 - Chưa chuyển, 1 - Đã chuyển, * - Tất cả" e="0 - Đã chuyển, 1 - Chưa chuyển, * - Tất cả"></footer>
      <items style="Mask"/>
    </field>

    
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>
    <field name="tk" categoryIndex="1">
      <header v="Danh sách tài khoản" e="Account List"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ghi_no_co" dataFormatString="1, 2, *" clientDefault="*" align="right" categoryIndex="1">
      <header v="Ghi nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có, * - Tất cả" e="1 - Debit, 2 - Credit, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_du" categoryIndex="1">
      <header v="Danh sách tk đối ứng" e="Ref. Account List"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Mã khách" e="Customer"/>
      <items style="AutoComplete"  controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_ct" categoryIndex="1">
      <header v="Mã chứng từ" e="Voucher"/>
      <items style="AutoComplete"  controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_ct%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_nt" categoryIndex="1">
      <header v="Ngoại tệ" e="Currency"/>
      <items style="AutoComplete"  controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="dien_giai_c" categoryIndex="1">
      <header	v="Diễn giải chứa" e="Description like"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"/>
      <items style="Lookup" controller="Unit" key="status = '1' and ma_dvcs in (select ma_dvcs from {$%c[ma_db]}..dmdvcs)" check="1 = 1"/>
    </field>
    
    
    
    <field name="ds_ct" categoryIndex="2">
      <header	v="Ds chứng từ" e="Voucher List"/>
      <clientScript><![CDATA[<encrypted>eJRlam/auknSwzQjUiuPUn6pq27t2haD7TnrNQ3VGyMT8NqRjZK6/MozJDBhKWeW+m7x+9VVHoyFoqOHGVXScg==</encrypted>]]></clientScript>
      <items style="Lookup" controller="Voucher"></items>
    </field>

    <field name="ds_nk" categoryIndex="2">
      <header	v="Ds quyển chứng từ" e="Voucher List"/>
      <items style="Lookup" controller="VoucherBook" key="ma_nk in (select ma_nk from v20dmctnk where dbo.ff_inlist(ma_ct,'{$%c[ds_ct]}')=1)"></items>
    </field>
    
    <field name="ds_ma_nt" categoryIndex="2">
      <header	v="Ds mã ngoại tệ" e="Foreign Currency List"/>
    </field>
    
    <field name="ma_vv" categoryIndex="3">
      <header v="Vụ việc" e="Job"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="3">
      <header v="Bộ phận" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="so_lsx" categoryIndex="3">
      <header v="Lệnh sản xuất" e="Manufacturing Order"/>
      <items style="AutoComplete" controller="MO" reference="dien_giai" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="dien_giai" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_sp" categoryIndex="3">
      <header v="Sản phẩm" e="Product"/>
      <items style="AutoComplete" controller="Product" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="3">
      <header v="Hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_phi" categoryIndex="3">
      <header v="Phí" e="Expense"/>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_phi%l" readOnly="true" categoryIndex ="3">
      <header v="" e=""/>
    </field>
    <field name="ma_ku" categoryIndex="3">
      <header v="Khế ước" e="Loan Contract"/>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ku%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>

    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>

    <field name="ma_db" categoryIndex ="-1" allowNulls="false">
      <header v="Mã CSDL" e="Voucher"/>
      <items style="AutoComplete"  controller="dmdb" reference="ten_db%l" key="status = '1'" check="1=1" />
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XDTBaIuR12p0QH/YyuXhncdsxAdf160zhrF+KWPYvCMNA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_db%l" readOnly="true" categoryIndex ="-1">
      <header v="" e=""/>
    </field>
  </fields>
  <views>
    <view id="Dir" height="220">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
	  <item value="11011: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="111000: [da_chuyen_yn].Label, [da_chuyen_yn], [da_chuyen_yn].Description"/>

      <item value="11000-: [tk].Label, [tk]"/>
      <item value="111000: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000-: [tk_du].Label, [tk_du]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000-: [dien_giai_c].Label, [dien_giai_c]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      

      <item value="11000-: [ds_ct].Label, [ds_ct]"/>
      <item value="11000-: [ds_nk].Label, [ds_nk]"/>
      <item value="11000-: [ds_ma_nt].Label, [ds_ma_nt]"/>

      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [so_lsx].Label, [so_lsx], [dien_giai]"/>
      <item value="110100: [ma_sp].Label, [ma_sp], [ten_vt%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="110100: [ma_phi].Label, [ma_phi], [ten_phi%l]"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>

      <item value="110010: [ma_db].Label, [ma_db], [ten_db%l]"/>

      <categories>
        <category index="1" columns="120, 25, 75, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 130">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="3" columns="120, 30, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>
  <commands>
  <command event="Loading">
      <text>
        <![CDATA[<encrypted>mUjqzgT1y0YJtiWDGzZr5UYSjhuZk18OUkz6EE01UeMmSl+vpCD7HeK6GWuK9VuQeMvs1O7d+LeHF4TRzXizvJbRrvFEfgz63eMb2nVXaxvdJ1P6mruShLZ/ae8z17btbKx4GVYSDBZ+Fg6CvDeN5BmQH5v7g8UzJhvnWWtRaxGySht6QIFS0uviArZPG/AdB5HWxckNgrssDd+NOd/+aA==</encrypted>]]>
      </text>
    </command> 
    &XMLWhenFilterClosing;
  
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>ClVb5pFuUFsViit18HR3fWiVbZu72wSSuQIO/yMUUnFwu6+PnFLOKn3TGKrrt3q3aW6EM+0yOF7f5ejyZ6b49v/i1/pgXJ9T7Z/xvSWh0vELAEeawYFehVcDtiloqCqsbXfj1pxIeP7nIzxDKaKeX7ufZBR20JpbD6bhaqjApQp0gXD0iSj3VQoN08T8rZhib4mK4HPH+GzlP7CvPSj1jvvEFnjoWhBQ6MHpsatI60ngjsBb45oHLp70JpNqaPzJDrMS+B5r3OHmRclnn+w4ujGwLZsa6MNeTBZFK4yT6Mf6eutS8cGJnlM3nWvuZcioTzLE8d+jNpF5cZzuvQxNlOVf5XMXDY/rz7SSTBfwg9fRB2cMf+dPTDpuNATVOxXtnf82+eofE8essyhsTyHoMQeDt38V8owYIZxEDnOYLyq5qWKoG9mKh2Sp1Q/yoYGGlQ5xKYsxOaiFxmsCXn1rdaw0+FgS11uHyGtBl2KStRUYo4hCTWKS/tljwY4mj6mRA1Xjozwpvwx9uzWMgNNYhNEGYjjGohZ1d+cN/iCsTE+6Ge2W14o66Pc25AzkaJJN/8zevOGN9GeJZsvQSGetggLEhEPUTy9MnThyynfuEpY=</encrypted>]]>
      </text>
    </command>
    
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>syco6oxgifJsATWSJCmmJ76V3cIjBjjWuW/vWbJd0eRXVwaLidgCf728XP5YxWhfQ9CHX7Vau1I7sVTLxgzjH73rFl9MXQZMAqgwkgjuij1MBRC24xHuUB8ubtmnGsNel5Hi3umtyk+C3+LJvBAlaA7wsZbNIk561Gy6OYCrmld7bDgybFmT7grI84+aAzIMgsa+zLD8AkCkjb8e4Au1GSnYC5WU+VarsAlJntnDF5M4ZhfD0J+uVYcGS6hFKXYPKj7j6NdOKp/AVZVEWagrmKAXZ04gSQm7PkEEafueuXWOvC49Qdi+eMjq6u6Kyu22</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>6FRoSZSwFLMcVHEUF2b4wiyDEFYGWoWFncQFHHIGQrqPtqemguky2ubadra00dazQwWjLXI3xu+zRX3gBEz5gbHSHjM9Ajg4b7hrMHKyORcam/DLiYSZqgVFYpOstDmrqd0PK82W3gpCzi6eKM/GTpx4Kc5Jg1xk1zIw92KjKFQRlNMbVrEAZvtidjLpnAFjes2AJ9M8z5KGg9p1FPBGT944Bj1cAU+DweKwhxP3/WPVdJ5DNQsTCMsyJoIwJJlV1AKk9eTUOptDO6NnEl2GzgeAa8AlMt6Mw7duTTSMRVW7IH5v4gWld8obBsMKAJABGbpl/DwFRfJ7Mh+bFk6LzqcB0IMNCXxHRkpBIZIuPhKXHKpWGGuTzDAMwzEuzaoReT+kwZW/XjYM/m1Y1OmqdytBI80CKf1uoQLhdK8Y+4UIG5Ki983q51nCWfM/yWctVUW1M5jZhSIbxI+6SDmoYcy5zWWOBhcyDG+A9l7Y2jd13RzQVW1sBD8y2OO5EUFSMorpzUEm8Bm26WoBQktvwwzKADGAJjF14fFo1f5lzDjvqeBnv6iXI4XEqohWPVLFFe1VILTVaBOw38ckuRUydju7T5PKk3MulldYU1jdJmIx+klyI13Q1ELYn8aUZ4c8zjjWU8kCMstMo3izg+ELdXdVe21XDu6e+YEraX3FJ5SGu88PbVc0GufMUC4+2eBKYXozvjCi/aROcUictrkIjOz3rUOZVMx7OPfZkZQaC/O9mMfj++/1HlLfghMzMeeyUb+lZ1vLyQHMScjSmMflVQ==</encrypted>]]>
    </text>
  </script>
  
  <response>
    <action id="CheckUnit">
      <text>
        <![CDATA[<encrypted>jol7FZtf6jNuLOwv/IQ8ZaPzGG3ejdd4dBCNGitAkHK9yciI/7VzuMcwy3R9+sZjK/Yy5ho2I8W285kU54blXkArDsAwjG4hn5lMNXEyMx/zP61/grzYnEW/YKtxDqxRI2W3sezaTpSqOEzTbBf8iCS9aSOiAqT9TPC+auc6u8TDTHW8h5qjNaYCKlJhl/GYtbr5p0tTO2ypHE5YJnZSdVARL7BSVIMquSwUgC+EaxTjbpQEJAedix1twwj5w+rOzIaeTMqsIfOtuSe9zbA52kkaL+YegUcg9hJu3LFnd+HeSH+XVeyJ4jVWxrelvURDJofiNjIBe/vmo8b5iEhAEkfNqRCMD63K9AR7UtmMTLNeRnFptCS6iFtKfdN4kqMPm8ibyWeMrE6Gt3TOapKinSL6c7MMTgLoTPytqh3+OTs=</encrypted>]]>
      </text>
    </action>
  </response>
  &OutlineCss;
</dir>
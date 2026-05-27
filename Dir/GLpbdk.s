<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY Check "
if @@view = 0 begin
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights a where a.user_id = @@userID and a.r_edit = 1 and exists(select 1 from @@table b where b.ma_dvcs = a.ma_dvcs and b.ma_bt = @ma_bt)) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
  end
end
select @message as message
return">
]>

<dir table="dmpbky" code="ma_bt" order="ma_dvcs, ma_bt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Khai báo bút toán phân bổ định kỳ" e="Definition of Periodic Allocation Entries"></title>

  <fields>
    <field name="ma_dvcs" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bt" dataFormatString="@upperCaseFormat" isPrimaryKey="true" allowNulls="false">
      <header v="Bút toán" e="Entry code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bt" allowNulls="false">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="loai_pb" dataFormatString="1, 2, 3" clientDefault="2" align="right" allowNulls="false" categoryIndex="1">
      <header v="Loại phân bổ" e="Allocation Type"></header>
      <footer v="1 - Doanh thu, 2 -  Chi phí, 3 - Khác" e="1 - Revenue, 2 - Charges, 3 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="so_ky_pb" type="Decimal" dataFormatString="###0" categoryIndex="1">
      <header v="Số kỳ phân bổ" e="Allocation Period(s)"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yzwpL+1jRmFW4I7WEUs2gSrjtNO7O61C9YOc71tFDfb3i637fPqY2uXiJj+agvDwpLZmXKdVinNaauWPqoHP58=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" categoryIndex="1">
      <header v="Ngày bắt đầu" e="Start Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yzwpL+1jRmFW4I7WEUs2gSrjtNO7O61C9YOc71tFDfb3i637fPqY2uXiJj+agvDwpLZmXKdVinNaauWPqoHP58=</encrypted>]]></clientScript>
    </field>
    <field name="ngay_kt" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày kết thúc" e="End date"></header>
    </field>
    <field name="tk_no" allowNulls="false" categoryIndex="1">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yzwpL+1jRmFW4I7WEUs2gSrjtNO7O61C9YOc71tFDfb3i637fPqY2uXiJj+agvDwpLZmXKdVinNaauWPqoHP58=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_co" allowNulls="false" categoryIndex="1">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yzwpL+1jRmFW4I7WEUs2gSrjtNO7O61C9YOc71tFDfb3i637fPqY2uXiJj+agvDwpLZmXKdVinNaauWPqoHP58=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_co%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" categoryIndex="1">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị" e="Value"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yzwpL+1jRmFW4I7WEUs2gSrjtNO7O61C9YOc71tFDfb3i637fPqY2uXiJj+agvDwpLZmXKdVinNaauWPqoHP58=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị nt" e="FC Value"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yzwpL+1jRmFW4I7WEUs2gSrjtNO7O61C9YOc71tFDfb3i637fPqY2uXiJj+agvDwpLZmXKdVinNaauWPqoHP58=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tien_pb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị đã phân bổ" e="Allocated Amount"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yzwpL+1jRmFW4I7WEUs2gSrjtNO7O61C9YOc71tFDfb3i637fPqY2uXiJj+agvDwpLZmXKdVinNaauWPqoHP58=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tien_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị đã phân bổ nt" e="FC Allocated Amount"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yzwpL+1jRmFW4I7WEUs2gSrjtNO7O61C9YOc71tFDfb3i637fPqY2uXiJj+agvDwpLZmXKdVinNaauWPqoHP58=</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tien_cl" disabled="true" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị còn lại" e="Current Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_cl_nt" disabled="true" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị còn lại nt" e="FC Current Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_pb_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị phân bổ kỳ" e="Allocation Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_pb_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Giá trị phân bổ kỳ nt" e="FC Allocation Value"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kh" categoryIndex="2">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="2">
      <header v="Phòng ban" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="2">
      <header v="Dự án" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1=1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="2">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status='1'" check="1=1" information="ma_hd$dmhd.ten_hd%l" new="Default"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_ku" categoryIndex="2">
      <header v="Khế ước" e="Loan Contract"></header>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="status='1'" check="1=1" information="ma_ku$dmku.ten_ku%l" new="Default"/>
    </field>
    <field name="ten_ku%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_phi" categoryIndex="2">
      <header v="Phí" e="Expense"></header>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1 = 1" information="ma_phi$dmphi.ten_phi%l" new="Default"/>
    </field>
    <field name="ten_phi%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" categoryIndex="2">
      <header v="Số lsx" e="MO Number"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l" check="1=1" key="1=1" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="dien_giai%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" categoryIndex="2">
      <header v="Sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" information="ma_vt$dmvt.ten_vt%l"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2" categoryIndex="1">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="336">
      <item value="120, 36, 70, 150, 100, 100, 30"/>

      <item value="1101000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110: [ma_bt].Label, [ma_bt]"/>
      <item value="1100000: [ten_bt].Label, [ten_bt]"/>

      <item value="111000: [loai_pb].Label, [loai_pb], [loai_pb].Description"/>
      <item value="110: [so_ky_pb].Label, [so_ky_pb]"/>
      <item value="110-11: [ngay_bd].Label, [ngay_bd], [ngay_kt].Label, [ngay_kt]"/>
      <item value="110100: [tk_no].Label, [tk_no], [ten_tk_no%l]"/>
      <item value="110100: [tk_co].Label, [tk_co], [ten_tk_co%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>

      <item value="110-11: [tien_nt].Label, [tien_nt], [tien].Label, [tien]"/>
      <item value="110-11: [tien_pb_nt].Label, [tien_pb_nt], [tien_pb].Label, [tien_pb]"/>
      <item value="110-11: [tien_cl_nt].Label, [tien_cl_nt], [tien_cl].Label, [tien_cl]"/>
      <item value="110-11: [tien_pb_ky_nt].Label, [tien_pb_ky_nt], [tien_pb_ky].Label, [tien_pb_ky]"/>

	  <item value="1100000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110000: [status].Label, [status], [status].Description"/>
	  
      <item value="1101000: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101000: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="1101000: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="1101000: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="1101000: [ma_phi].Label, [ma_phi], [ten_phi%l]"/>
      <item value="1101000: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1101000: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>


      <categories>
        <category index="1" columns="120, 36, 70, 130, 120, 110">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="120, 36, 70, 130, 100, 100, 30">
          <header v="Thông tin chi tiết" e="Detail"/>
        </category>
      </categories>

    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>VZm7idYgzoq0oBL+7RvhOAE59mLj4flozmc2h9+YCcD6K8r7F6i+yG+O8l/IZYfBIy1yqstro4zvFxDCXtJQWOrbWuLbiLOn7JJITs5xMrJ14/TTA8Q3dQs0Iw8Sef2MDEJtd10zJrfN7Ia8LJWW9kAy+V6DBGFdME/QfMEM3598cv3k6I5x1G7TBoB+huz7KOPMfsjaDDvTnBGFHG0jOLhYg8QFuP1J4KfHrY4j39NzsrKQ50lNa6lvAZ1U1DnB7Wlb46PBCOPdrSHZHcfwdUrf90kTX87DimwzoRBjKeQFvmeeXx87wj8vOWT0TQZZeBoW75Z2NLrCoOr5u6sJSj2fdLZYc7qTrS8GWFCfXoclbkl2czM+vd0jjRnw3T2A6rjd/vk3yVFQ5mvR2JdtumHFj15zKZkbnAKfcyQt2edg5bY2Euu7p/ABaN9vJizJN06MXeaFZ095SvoMo/Q3VbKy9nEBy0J/ykeeybQQQAgquJNZMK2aZDNk4KJDoI9TzlnHqB9Li2i+g6tCrKaO8opkGFbniFGdodo/w5/NAwwjpSy0Y3qS2MTQu2I4Ulh3k/Hz9zoA67QseBM6gozmsw==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZOyuOqbqo+EH+XwkJH/B8/hYf/QCOTNnlHe/f7fq8d6Wszd+R1rZ8f2CcNoQvkgHJMlb+LBMAUi1GmOg6l9QJY8iDU5ZObY4qoC7Yw2FPaXFY8aMd9bEmzGnATLexWh72YNnXmj9J+93KaZSC4U9PviaG7m+mx8K6/EkBNAUU8w=</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/5NRu3nfHu1FzbNr0dJx1pNuqZfC8VPvR8QzZbftKhZLzW//Vi4cTeMNoKApAGI8xxypzem21jhEabqRP7Gxp3</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>Sj3qmez2MVk+dTrHVkCYE9xVxENBuIgdMzQLdTkR8WIO24aAWXepxCIKtOnKzvRObqgbEDfHcc7nzjLagRJ8ryPQSgsKRyeeu35RMZwC7RfdFkj11cuLhSGP7Q/E+8SjP6uxbvDPxkJ1QolxMn1C+g==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>TllLxOywGidwPuoQnMBE5Hv3zX52wDlTlM7gHiYPXkaams13r5PubroO6lFM8IVOMRiDqWb0zSNp8CgbEqHngs0TY8DTeDoLpwU7Rc5ZrNC9v+BQvl90Z0jZisHcOnEuAJgPsBZTABhjX4E6XQG0eA2BFJHduE5/MYkQsVD9d3n4Tdpl8O4lmI3qJY3r0/SS4AMz7QyND/Z+EfbQyN+hiMtWo1D++3ad8cZkrx323gOq3gBEdohNtGx6hT3LYnp5IPn3F41D7muxR/Qq04AgAgpbKgifTO7r++yi4gUB0rVey7DKdvOiJpvxqZBlrWhVCHdv9kPLnpR57sbMrb730UuZmopu/WZL8n2SAS5AIbcCcMGluz07GXxlYmjzGXr62uhNOHoTcc4NWQ6oxEq3toYDslo7wLQFpG0YskLDDhufHa0/M20hzsw/tVOkkeieuoqFWSukwrANMSRtJN079EFGN5LlvKtjjTgS1nlvNiYE7ZwAZTzAPfebnfefAhaqnDekuqI/4XwWmmh0fn4hdOELZ1Z1AAWLo7YypyWEu/pXFFhesASHxRStyRxWO8UBZ4VQoVdfkdUwWP3WITNJ3Cn8IJCAq6yf88hRf+lIP6M=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>SKsBq5cyravPN4G+cBHpOQasFvRUEHJTlYygwRnqzDnHxj76XbM46l/KI9vyEaufgoCvpTbunJ2B9pi2tep//Y9uiDyziaO682HmNmaTk50bAfHF2n+jRZkcaMQi6zu+X3LThszfWwpM9mIhzNSk7A1sSdrTKQ9oXgx+Z0uzL2Hz1Uepx0VhW92k5EC3+manVCE78B3VYNfrYlKlGfEDob44gbkFCACRzUc33doPnP2kjQXysTs4O5GiNZMzXMwqMGJ0oYfhJCSfpZ145Mf3rdVJclXCpo1PYzNsAO4Y8UE=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>00OR0DUsMHi4VnnWtG3rzIqdHZMjrSs9TWq0JdgEBmKqTyqYNwIqckhdK7XoLbRTjyHA2fHyhRw6GpzUJsjb5cVhRWFf8ruvTltKNnSk+gQbZthuQ4Yqy7e6dC9IVZV0soOgvIEW+GrR/ltC6auGEiIdhNrsXJ72vaWQ+ey6xfvb6VX7kAg4/stOYfGapcziAt0YZlEAIxs3u4bVByPE2/1ntJcwO1C8GLG4RxDkR8VHTQprAfk75BjBIcX9RPspDV4pyizyahU7S9Gvt8uyn3vese6jCZjeNKQBirUIaCowMLJJYb+PQVBtn6OIlmKn6fiHPiu8dArU62/C2UeKAg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILc0hRAOn78BJ/HNDMvEhXxL/xiEqXXui4U4VaRHB3Aqe</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>enM9/hy1gSTX4yvJWrgGWYeNMLofDEYIMMaidI7ZGXHFijCW2+uxs0cPvOcQXlDD5mBj9RdKW5tQ+Q0SL9WfAhn6FR12GyalYyKf6ErQMkkESETANGLkSOEp/w3uiAkUOb6YeCb6vPSKxp0KD8PAdSrUWGH8VtaEJLt161Qw/udK3nUbOLQUB8iY+zVsNeOmdpGNDBhTKuguyBWAdLNDRGglmr4I7HJm6D16TXrdBJltS8oz6S0fqYo4iTWS3eHoN+nwd6LkhQajl5GCyRx32Yj2YihJvvcuGk83soXtsFH/2LeGq9C8ioqVQbYysfxgMJ5CNKutWRyceMLq6OV80NTjjiIz//JXyhz/1c+Yjy4=</encrypted>]]>
      </text>
    </command>
    
    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKw11W0L3vbYegBUyYupq3eKx3l4qcy7x9Fy8Ibe/nez9GPf658uBVRDNOaAZq54QfvA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>iKSzze9eh1r1Yokb4hPdx88JsEonBnNfyzgvIIqW+o2u+UxqWaZBgKHywxSHwUb+jI6LkQTSfHvUiISvsL0+qc+vD9l07Y2yw4UALS0ej3GiTD7uaEkpJbuakAi/DY8+g7PN0YICe/1n4QwJyuHsZ01OEEIko6vQg8XCd1UAjXgbG2+quEt+kMeHHZsxZFNw/LslijrjRhGCAzRPUnOo2YJJCXTtyWoCr/vImlCU+8T7jx69jalmUZEl6pEgXkZ6GxAhR7rRQzyIot6V+xSnm2NApDSpvLVAxDnr+xTZHgu/mVxswhaz/hrr1Y9zdSSWZJmhTsQ4gSOqKsIENnJZQS8SLEZ9yGy8/hVgtkv/+A3C64hrdurY99F1aR1nApAKuXU8Fx15Wl+JtMnnJJCjHh1TAkTkZufxEeIu4hb5nMK47GW15jwyDTree1HxyxNgEePFDWj9MR1jMO7NIJBluN7sF2WnNGPYBdA7naokX3ChGYvhZOBF4AGB7PipK9CKCt1SdbylkeIuZXm6zzAv2QPhJdTBVJ9pEa7AiDVl7YlTxRTcFBeHmy0kXBHdRkrAyd7zggtMr4re04i70ZablZiyDsRN3FJdpZ+T5KX+3wQAXHv6EXKceau7y6LJE+vGvjSJdtJuhD3MKift5C66/XHJRXro7Rp0UvLt3AHw674N65zKxVwL9zKstLqWImQFS8b9HySjxtuKRMQBaqk7ntx05/zBZ3EjyeMFi22MrtPsju4/D9Si7LTiy2sY82A+rvgQFE254Ur7HLWoWMaXnHIIj+7HF4prbaj7Y1xx4Q2fOuShAreigjBYjPz2nELPC2F6XhRBsoViORAgpqFIdjGMYEdo1w7/XPl45qT/vabXB7ryAQozhdacp8DdgHP/EIDADDIso17PImcy+IJnmXSJ4NtA/ysVDH0Uo/KOgz24OQEOvMcCiX91+zTV0DOit6ujgcNnvIp06JhIl+c4kbfMTF50I8/48oVxyz7xRzR0KivInlY0kIBLsU/67GIYeKdD/iF8TQqGXJ1/95Zuj6LPVHKo76mlLXt3dp8D//2ZP0ZwkcTncA3d8SpoXZ9gtuNa5vcbzLVyqccED+Aj7WSM40RDQSvUG7BE/2SeyyCxaR7ef6sT0lqrlwGdRozwHIWmmqTd86DIk43wshCmENFj/JvFA9615C9XMOiPkKldOGc3BE8C69a+qdI8uhsSdNiOvDksfFBhmVQLzXVtrO/PT8c4CB69i+vYF56q7kiKGYEZuft1HEOO0hCtZGwNdG6VAFDyga3NR45UESADVCEtMrGbquC4qF0iCBGus++BBlnxD64+1zKRXaAEemqzEFkU6BPpzmwqcgtPd79zFD5AtjM93JDirL+IfNVB7Kc6O5nTayUNwuoTAY8NhpGg</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="Account">
      <text>
        <![CDATA[<encrypted>LYsQP+xHunF0V4kGFNFbsPhVXR4W1f/upA5we2o9FqmWkvMQ0uz6MZqtqzVnBkXYEw9R2qZoDKmAD06YiKtY8pjqvYHUXyt1Qexc82ntE3dsNOs2ATVWMQ8t7xay5DevHaoagry8FBfBNzbAff/f2A==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>

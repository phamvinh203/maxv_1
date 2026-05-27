<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="edmruirothue" code="mst" order="mst" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Doanh nghiệp rủi ro thuế" e="Company with tax risks"></title>
  <fields>
    <field name="mst" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_dn" allowNulls="false">
      <header v="Tên doanh nghiệp" e="Company Name"></header>
    </field>
    <field name="ten_cq_thue">
      <header v="Tên cơ quan thuế" e="Tax Company Name"></header>
    </field>
	<field name="ngay_dong" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày đóng trạng thái tổ chức" e="Close Date"></header>
    </field>
	
    <field name="tt_canh_bao" >
      <header v="Thông tin cảnh báo" e="Alert Information"></header>
    </field>

    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="160, 30, 70, 110,230"/>
      <item value="110: [mst].Label, [mst]"/>
      <item value="11000: [ten_dn].Label, [ten_dn]"/>
      <item value="11000: [ten_cq_thue].Label, [ten_cq_thue]"/>
      <item value="110: [ngay_dong].Label, [ngay_dong]"/>
      <item value="11000: [tt_canh_bao].Label, [tt_canh_bao]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fBAmPxJrbfpfTGOD2YY+4dnoDkTtNcsa1aQilFPVHFiXrcKMVyd5zvAZ347/KZVPsUyuE4Z2eOjluobep/021o=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f1h8IuHH30pVWY0Ih8jlSK4GR23//r9+Df1x7Rxvy4fUaWT5nIzqqYkQ+lL+LaUs6TURi0Gn0dfVR8nYIBwr0Y=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>0jcQogs8p4VpJSBM1Qz2wmiM8N3sYfdJm4D8bchWEdj7xHoGV9M/aYQCv+ItUSKKKvJobR835Y7asV3pOtSeKseKEzebRhUA/PaJAg9pXyxtIxo6KiLGvbBo8Ly2W5V41UV86BspqXuFcTlcEdCOqcz6GjRciO6Ea0xi+BiLSA5Px4f6Z15psx4491xS7xLh/NCjsudl/ZJgghaJIayClZHxwvvmMaYHhZ/CGoVX/KvRpY+qzd3+JotWyeq5QjjJnm8jiL8i1OxlEb+DvXAnRfdiKc1Fo6Ueay9grWjCCdM0YL6Jw3rJxcwgfHX7ZaeUDdjAAW/3+/obwdjhhNdMxsakTY5oR4oyEqDSuCog5DwZ9/ZltuXZazQ4txtqxnCX96W2pylYCO3gPygGLhPYYdLkJeZMWKwGdJUhpR0hpIdhXd3JiWzMgOdeu+q7L9eZ</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>9iD4aLFB/6dL2T0weIF9okpHmX4J5e7MWOapkPuyfyC57tGwfHPYmtyWUl1Ug3af4YBr7E2PvSWrxkG4tbM4Hb1cYFU1VzJM3DcG2c+Qu591IgM7qJbdiq/FJkMeNKW7JrhmNIAJrA3OP3c9BM/GhFcaLXoO8GQjfawP97HDzBMsnZDLRDMMKCRbYHjkqf9pWzZrDrEZfnUTqmZKNe2B3672F2IMLvXor1Hlg3RswVIkQnKy9eYVahCugPUshioF</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>RsqFwOpwj4kH5PYLX1ZOpEfQzdVeXMCqiAkZ/pCjc/HLx0b0g7e5z3VKzL4kgxrvh+6X3TXOyNyKq5YtR4geVO3f/8SSlyzPYNZ9IL5moj75y/z8q934t6inwESXNJVRrm8v6WahMV9hviDaPH1nFpQf/TN6HhnXL5tbBRzV9prZitsW+niK1EJkyFU9+OPQsLNUtE0YKYS6sVU/OR2jWA3K+yve7+NntOgMvaXjVVN3yOu0i+yOy4qiPuGXi8Dv/kCEwAdpMvi1yWrSq5ivwAOfh9KMqhleKRX9jiQTD6Vps5u+hFMMKs4ARbugvBI9</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILaMGSjz+WbVp9K9gTOGk051RZDsDA9Qz/q6KHg/yzNsd</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+PgihumCzQ/FSwKNRseNLn8r/c7Hqnl0waLJ9B5Nz/rg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>NOmjHl1TGfYvRDC6/95p733Hy3zZC6GuYcxwOp0umSSj27SI5liGnV7Bf9TfKZcKUhVc37awsgBmPaBUNDFxiMYfQePAllqz1LS5UhrG9EE4czzxmyzVIxd8Wcsown32edmZCwMIyABLq8gYF3e856qiQzebWQmQKF0VPSeaU9jQhAt1LMUtfqTbxlLK79ykG4Xn8YjZg8/rk7tGpzqZblJrvChDtL8M357OcIdUxdgMufLiHO5Z+kGy4sX35pLN1BRJeitt0a6H/WrxK8btmw==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>

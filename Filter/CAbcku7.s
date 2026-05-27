<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CABCKU7">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_vay_from" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vay từ" e="Loan Date from"></header>
      <footer v="Ngày vay từ/đến" e="Loan Date from/to"></footer>
    </field>
    <field name="ngay_vay_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vay đến" e="Loan Date to"></header>
    </field>
    <field name="ngay_bc" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="so_ngay" dataFormatString="###0" clientDefault="30" align="right">
      <header v="Số ngày cảnh báo" e="Warning Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk">
      <header v="Tài khoản vay" e="Loan Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ku" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại khế ước" e="Contract Type"></header>
      <footer v="1 - Đi vay, 2 - Cho vay" e=" 1 - Borrow, 2 - Lend"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa42YL7jlXo0ShoGODsFToUQ3own4aR87ci4INT1PLCyFsDZoc+IU1A7tT/V4Zjg8TLA==</encrypted>]]></clientScript>
    </field>
    <field name="ma_ku">
      <header v="Khế ước" e="Loan Contract Code"></header>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="loai_ku = '{$%c[loai_ku]}' and status = '1'" check="loai_ku = '{$%c[loai_ku]}'"/>
    </field>
    <field name="ten_ku%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 80, 105, 100, 130"/>
      <item value="1101: [ngay_vay_from].Description, [ngay_vay_from], [ngay_vay_to]"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>
      <item value="110: [so_ngay].Label, [so_ngay]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111000: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6inE9H+FbWdGTTq3PfO228aI/cEqVfb0FHxBb9DgKEDsEP++v9Bo+iJuNc4nmvcLZBSSVqocPleMIlUu2/+kZs+ybgkbFN/MVE356TnNoJNpZRXw5V6gp+W5DEffbfjLWdPCn/uTfo71KhvjmMS5IbVEPxaczXWtQ5ym+sSVjbvcnm6ijshw4R0a+ZHeZOIgo9LOLxnuwDShEPlvDCspBy0vkxy1xt8J3BEHiwOHFoZP4</encrypted>]]>
			</text>
		</command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>8Gfp8KtMd/WA0BB5EIe96WBwxlO4jEychX/YQZPr82OKw0whhuYMur3nQII9QTv9P6NVd2XzGpImEMvo6/PqB3C8peF37CgSZEzHXBzoWyyGeOJdPiaxeVduuf3na+Qjf3UNCywkk2zggurSLN7qn49H+TzTCSBWUCEMrqw8Xya3LTOMUuJZdqryeLHhvrzxbpN+NxR/pW9Z3kiYboyDZ4OWViaxOcm4yX8uN6vkUrQ3cGSZ1e4OuzAxdyvjjpfAURAFBpSpw3cY3u8bVhFdPrgvu9ZCaZdhqOApAGHhK0ZGNuGTaFipzUWhGi3kHF02GYt3W3UdadNUuxY1hS8ejA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>S2ar492pS+CXXzvpkFrVE/470NPQjIZ53YFIlC8ynGkjfueB1bx9urGRS60LeqAF93vJeAcRy2ZXv2y+OALdvihs9yD4sN/SsepbXTPpXIvg9/FVgx8+x5wkAGKoHsn6NrZVhJFAUTKxCSf001JdW0nSXV3MRsNWo6JjVO/EbR2ESYG7BXFZJjU+DfO9K9rS/W2BpzaDmeEFOCWQVbQ1UVqQuRIa3BtgPNtIdBnOvnYqoBT2VeGOOZ/BdAG9ZD4QXwDkQhdwVa4H7yYSr1kU8Yg3RZY3mb4/6gXur2d3EJIZAuSaHWbStx6I+COONyxvTS1mn8Oxp4B1QBb4tdVBI3qR1g2jH6rqtGjyBI8SxSTqpwUsLAfqgOhblgQx2SxlusJz2ezaNVqPsBpUv0u5V08EXpQYdiltWNLzAjMP8YJDE+mKmyu7cY6/mYtoATKxrPonMMevhAqhq/2bBenvaJckVykuomW8I706Y6uscUlcDjwsLTV/CYn2KXASI1472tVXgfLgZX+Of+T7EPK5zpy+QPuVgSDEoRbqQXF47a0s/ikSyg2ADpl5Ol5MpP98idBRJ7mKAgRf0r3028eQR+R2IN5npD+eZtllhxprlbkR8Pdi2P1aQiyTURKuPs4NgJbyJGNPymf5ueQzGXwquBbNmc+iL2PpZ9yT9fvSIchBRN6q56v5gjA6F8E3YTx2T0eRvZWnE2QlnA58lNdq9o/i6wFanDkpf9ovi7nGfbB2uHZ943zlj5ngRJpzl6/XfSJ564z7pKXxuij6ezq7+A==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>

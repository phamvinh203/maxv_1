<?xml version="1.0" encoding="utf-8"?>

<dir table="dmtkhddt" code="ma_tk" order="ma_tk" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Tài khoản HDDT" e="Electronic Invoice Account"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Đơn vị" e="Company"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1) and status = '1'" check="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
	
    <field name="ma_tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tài khoản" e="Code"></header>
	  <items style="Mask"/>
    </field>
    <field name="ten_tk">
      <header v="Tên tài khoản" e="Code Name"></header>
    </field>

    <field name="ma_ncc" allowNulls="false" >
      <header v="Nhà cung cấp HDĐT" e="Customer"></header>
      <items style="AutoComplete" controller="ECustomer" reference="ten_ncc%l" key="status = '1'" information="ma_ncc$dmncchddt.ten_ncc%l"/>
    </field>
    <field name="ten_ncc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
	
    <field name="id_phathanh">
      <header v="Tk phát hành HDĐT" e="Account"></header>
    </field>
	
    <field name="pass_phathanh"  defaultValue="'*******' + char(255)">
      <header v="Mật khẩu" e="Password"></header>
	  <clientScript><![CDATA[<encrypted>no+EqBbLHNT1fYFKOGioHcM/ZX594B4wl1LvgU96Aggth1HTLZToygou0idbZGB1F5Xk3ZBXJm+Ia3mUne7yxw==</encrypted>]]></clientScript>
    </field>
		  
	
    <field name="public_url">
      <header v="Link liên kết HĐĐT" e="Link Einvoice"></header>
    </field>

	
    <field name="ds_user" >
      <header v="User phát hành HĐĐT" e="List User"></header>
      <items style="Lookup" controller="UserGroup" reference="ten%l" key="status = '1'" information="name$userinfo.comment%l"/>
    </field>
    <field name="ds_ma_qs">
      <header v="Ds quyển hóa đơn" e="Voucher Book"></header>
      <items style="Lookup" controller="VoucherBook" key="status = '1'" information="name$userinfo.comment%l"/>
    </field>
	
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  
  <views>
    <view id="Dir">
      <item value="130, 45, 70, 115, 215"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110: [ma_tk].Label, [ma_tk]"/>
	  <item value="11000: [ten_tk].Label, [ten_tk]"/>
	  
	  <item value="11010: [ma_ncc].Label, [ma_ncc], [ten_ncc%l]"/>
	  <item value="110: [id_phathanh].Label, [id_phathanh]"/>
	  <item value="110: [pass_phathanh].Label, [pass_phathanh]"/>
	  <item value="11000: [public_url].Label, [public_url]"/>
	  	  
	  <item value="11000: [ds_user].Label, [ds_user]"/>
	  <item value="11000: [ds_ma_qs].Label, [ds_ma_qs]"/>
	  
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>UXi4dLVbLA3AUnbna2/Tzz66ETQ113k9iKBHGmZ4h35dhrd6wcjysxGWKBj8eDXbYm9uifoAOX1ScqNM7mz/ttmEiNZKhqoDbGPARm7UKo33KItAcyklLg6cNcrqYu2O6Dz9v2VNkWTp29XlTleO/U4bNg6nkFhgIXLUh+e/zUhInyOmnDiGlzS5vlMO1u5Gcu8tSfGgeuedTL1VPI3Ajf/Z7ZoTeMfmK7pbW+KGKduG4XiKaRjtqVqA3bKLTeksAhglpk+CaDgW4Q4NthGTZF1yKjVmgs9lT/FZcfcuwoTlBOyv45wpiNBKH7be7D7zBx7iF6qArTLebtRbcAtLsgZMsEylHyUEMwT0lPmw/fmlFPGw7v3kX9RN/+l2zNvOM+LMJWhq/StHZdFPvb5vckFu+Qjb/yoICrkHFCzaWXlTwQ886OUCMeWGuCoIDXqW</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7aVI1g9c4zb2QFazq/HMUVGXvA1mhiswDbd0z+cpgnb2RKLmnyoiFxrFVBlRdTHYFMG2eHbNEsq2wbHBGRr+ezs=</encrypted>]]>
      </text>
    </command>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>zUn9SILv+4bg6gjcZ1+4l0QL6bJnsT0Vu7Zvfxudyf9ubuVyedEbC67hMcuCOmNwFeB2kECM2Za9RHVTiuWnvsysS0VrA7GXcbAUuOXQ+I67b4+un9ZRcxwtn9TMN2iSNe1TF6T2jq3ZecqAZrPF09kkBZPydvPaUkF6Qbh/YL60Ykuemu0W3N8vjPxCP8fTv9/0F2JyBlPv8ihWjjkfKmBdsdfa1nru8GjzCQMUukOsnRHleRfx4ahB0cEpSd/dCvnBjizbT3TWeVX1QeNMImJVv5rUjlNTpy9kQzsSyWs=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7W8sRAx9nzjDjoENJr9GgRheJAuv/Dw6LYanp/qb0c2EGvX3+9N/rO8emZMUyNY8wQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>TrdLpJTvaLZTzcimhgszZQKWFsdqE8K6Z5ttNHwSWnYG5Aau/kfsy4xMcRZKHedgsbJUlJwTo70z04Zod+Uz08tlMpobZh0rS4l3IIakKWrRLOeQmYKNGpvuwZsUgvcbmYlo3wqtQff/ey7ZaPyfx6UaOwZlaO+z0ZFbhBnHLj2Rr+xWHlhaChNTf2pQZl3XVrf9OGa+xZZwzpPe2Yz7R6mmolNgLXesc2qhXku2jG3QRfu4DaBMKs6HDpi0g7XhQWvDgp0fOFtXDhwGSN221xIuen1bV8blG/XTdADLn6g=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>TZiXHgA6Cqm9azOcoKr3U6XRjbdN05Uo+KG7nDPcvLeSVjmwZmpablhKReso/x3Xy+ml+yHv6B79A/WThBVxb+2N5j4v8zyJOQWE+s/a8ebv7lFlL1LhIl4ekALh19Fe3v5fEZSrnocgXtMdBtZNIYPcquzx5tehgwtUx1f+In2WooZAS2xDjeeVj4rkjfnnbE7Lce2eXQJ8HFxNGlRcJQ==</encrypted>]]>
      </text>
    </command>

    <command event ="Deleted">
      <text>
        <![CDATA[<encrypted>KD6BS02JEhvKLIIUhnYRvAF4fNdbbCrNFRO04UW4txF6ZeU5/cyj4RQ5QLxbCp35Bj4yehV1WMmsMj1UT390nA==</encrypted>]]>
      </text>
    </command>

  </commands>

</dir>

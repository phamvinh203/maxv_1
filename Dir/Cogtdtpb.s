<?xml version="1.0" encoding="utf-8"?>

<dir table="xdmcdsp" code="nam, ky, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" order="nam, ky, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="khai báo đối tượng nhận phân bổ chi phí" e="Setup Rule of Coefficient"></title>

  <fields>
    <field name="nam" type="Decimal"  isPrimaryKey="true" dataFormatString="###0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true" dataFormatString="#0">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_yt" allowNulls="false" isPrimaryKey="true">
      <header v="Mã yếu tố" e="Factor Code"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1'" check="1 = 1" information="ma_yt$xdmyt.ten_yt%l" />
    </field>
    <field name="ten_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp0" isPrimaryKey="true">
      <header v="Bp gián tiếp" e="Indirect Dept."></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp0%l" key="truc_tiep = 0 and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep = 0" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp0%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="truc_tiep = 1 and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep = 1" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" align="right" isPrimaryKey="true" >
      <items style="AutoComplete" controller="MO" reference="ten_lsx%l" information="so_lsx$phlsx.dien_giai"/>
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$vdmsp.ten_vt%l" new="Item"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 105, 330,0"/>
      <item value="1111: [ma_yt].Label, [ma_yt], [ten_yt%l], [nam]"/>
      <item value="1111: [ma_bp0].Label, [ma_bp0], [ten_bp0%l], [ky]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1110: [so_lsx].Label, [so_lsx], [ten_lsx%l]"/>
      <item value="1110: [ma_sp].Label, [ma_sp], [ten_vt%l]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ZYm6pq0O4ctdHSgtIkX+kWr1e5Uwjg7Z1zrLEEU0FlJWclYXHsKv/ILr7y6jNwhoRpqPi5FKLm9GbvpuY4iLsw=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VOpfgOoiGWLcrOkxAyj9FfBr+8cqHYVJXxioTxaqynbLeMz7pApiGsvtxMe00SwfquRW3gkXbTEkeMc80SiZ4A=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>FbAnXvvdtnkRO0WtilMlllUzLuO+NvN7+iOd5pdeNgILadoYS97mwK+1xs9N4uW+zz1VAZslEmURNXUtWLUITwcPAZ6HSWT6qwXGoWm9PkxiR44PFraoSBsy9Sm2cxrc07W/AJBlcYsuvhynETEmvzLT70RE9KXhYbXAgXemnS+58abU4gQveCAf4qB8NUyTYfM/EjgPpFMkGa8o6SH5c2552dooXI+e75hYZ7ZDTlegAypx5RDKWkprvtmTNSZYHAKFyo2aWsK70exzwFiGfMqFttVKvrWeleFui2AO/IqPUw0pKesYzFsEUCLQPP1u2ahI8aJrRHJnt7IF+ewNx9qGojUxvihXFKe0XKYHZGfr3zwnuLIn4TjJCp1OgNAWvDcBCUcd5c7JRuavm4wXRAf8iUUnLtomTbMJVVTqGti7iJDzYSsFgwRCYqKkhk7ZffVauWSmzFHAzXtyjhuQZYrMiz3BYqgu76HGH05vqCg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>707k+9GeuJB+dO9tJe5uXOA/lOyl58IOAeSb7BnUFw22Ky7PV0zXFYaeuCArK35wVw7oj+F3zFJlRerXqSqCOIZ8JRWqaONz0QoNByyrl5707BgmC6Mnr2VKtN6UVCKaifK34/gjmzRB0miPoMjCinXd9V/+yuRNY88AMxKPDemE82ygUuI7Tzml+O7K1RJYUppO7h73rj7NFq8KesJqlD7TILTA+aeDmDhCcyjOsq+2F7SJcVE67LvKATwns1zQbxLFCCyq2ZbNql29lkLDIA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>5GBW+lDaEVDQyiAN26pozWT1hAiEHO6WcKt85/iISCUCDWDEfLVwsxyQ24TWiATMhocP9AnEZUGTtcYrRPqcGAve1HH32fWrHJJX6rV6UFavy3hF09/1if3Rf5YfRSpR/8KPkKXpWGMiS+lAuPfHGbn8RL4pzvcfY1tNHFZJc7Yy1Cl8DPRPpgceoIZVIwaAIILRbZGsU/7ZU7atHzDL6BZPdeX0kwQb7h+kUq5wB4ZBT4LH15G95hsarZQTcl5kQKrNk+3LBgELlvAZdfzNJom4oIidZd9pZTp2oiQU5dTdgmhTFUtBzPAXL1scsBW7i1qtDaeVZ1uoEN0uvmZhuZTmEl5UBX35bbIoI3CUkTi222YDQhnLcnMae0orHkJxEncK/kHE0GK2hQc/qFrYfigs2N2ftH1951v9lISiORDsAr2umHo0djNciwwr6W6q</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>b0K9VKeF5MKyOo1JiyPgd3sawtBpgk+Jf3TAwunyp9gt/lezyjXfioGYSPI1zvaIXNjQJ58z8Fv19Eg8Hdzmi7UmJdrLr5OOsWkUYfxk1XZcPXUu2rHWtd/x+VecXuM1Jh4CRN/YWkJfIXFlZc8cleQ3MGLz4ePU8RGnzapnGpRy/Wl0bL467p4MvjIdnZ/1</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>z1JkilzLSYIRDwUpNcu5sFvE/dx7NqG+fo4uHTAOYft2WbERGBX8sMN1epqtP75a7L2/DCgg1hWC5QGOQ9QsFVwFV/UPQBKHj/YrwR7iNY0giYH/TUuNBk+BXxAQ9Z58udVEQe2F1t2mXpqyqgGyyaYs1mSVeedlEhv6kuiUX1z6B/ar6ZcItFSGUjQCo28S0deFLagXlaVV2CHRESJKWvywXJSoR6NJaElMDlhiU+obn+jymNeTi72jiwoFUDXgKlmSnL6z/WrJXmDHWW5MJgI4eg83z4jJtoNUvHDWyay522YiChlLItDG2lVgFdCNRW0othT8GOWTzhuvL+4R8s/k1wL18nfvVdhP6dqv85PfqsDItuLivfB9LXNX5AEgGPdglsyCmNlrc3wDsjyWhD7vY82katfnkbqJPQ03cQIq4sAMZeqSkv6A2jZ9WvfW</encrypted>]]>
    </text>
  </script>

</dir>

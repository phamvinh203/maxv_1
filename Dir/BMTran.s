<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">

  <!ENTITY AfterUpdate "
declare @rate numeric(16, 5)
select @rate = he_so from dmqddvt where (ma_vt = @ma_sp or ma_vt = '*') and dvt = @dvt
select @rate = isnull(@rate, 1)
update phdm set he_so = @rate, status = 1 where stt_rec = @stt_rec
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, 'idm', 'phdm', 'ctdm', 'stt_rec', @stt_rec, @@operation, 'ma_sp'">
]>

<dir table="phdm" code="stt_rec" order="ma_sp" id="DM1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="định mức nguyên vật liệu" e="Bill of Materials"></title>
  <partition table="phdm" prime="phdm" inquiry="idm" field="ma_sp" expression="''" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" allowNulls="false">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$vdmsp.ten_vt%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XC4Nss1aSJzIH09Yeb3ZIhZSUmQvCrjsVji+gj2CPjaOg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" >
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dvt" allowNulls="false" inactivate="true">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_sp]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ddm" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="266" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="BMDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="#0.0000" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="326" anchor="3" split="6">
      <item value="100, 105, 353, 100, 0, 100, 0, 0, 0"/>
      <item value="111000001: [ma_sp].Label, [ma_sp], [ten_vt%l], [stt_rec]"/>
      <item value="111000001: [dvt].Label, [dvt], [ten_dvt%l], [nhieu_dvt]"/>
      <item value="111000001: [ma_bp].Label, [ma_bp], [ten_bp%l], [cookie]"/>

      <item value="1: [ddm]"/>

      <item value="---1-1--: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="100, 100, 145, 100, 5, 100, 0, 0" anchor="1">
          <header v="" e=""/>
        </category>
      </categories>
    </view>

  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Tnr+J9Bg3C0FDCWAVGYtHS1SoGEYb03zLkBoFtIj2Q+SqN3ocjwOyu0GimXRErPQK3yNaPs2hPCQOWNJ1sW3VV1zgQU9RJpmPP8IqsSDP+3</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SwT/j4NeoXvB8r6Apt1gMgm3eItMbmzZ4L90UanQ31esNewB+fL18eRnaNzIad9/TBV8ourF2V031Kl7zpz8m8=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>OC62At2yl94TwmKLC+a+at0cMJcUD2a7YxA1NYMDu//64hjICOfZiPPt5LiEZ3mD3/+YX49SfUlMRMZev/0L1d+45te5J8ZKG0qzBYwyn4OZ66FMblhu/ubWyIlblevcmc6T8aDL6yXJojhsLr1PdNkvfLM7VKR/W8fTV+RBzEMLswk5r0SbLg0TO6av2vOrHhNtA4PL0fwel5vPw5Q2B8o4rsxTXlAiMMhhIGcxyV1npIIzkCNoY5pAJmkYrihY</encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>57Qi+M0Ge3GB6xTe8nWoaozQoXfsWzuk5T+NCqU0EvrXbw0glm3D/BdEUUHpb0ntYzlI7d9DZ3IWxYxKhiTddvEo3CChhsGF8icIgGsQKPxIQxJNA5U+f4oKYLsuQeu5+hWE6mwQ++SMhjoXfmsR2BppL+VP7mzvVg2gJKV3mJNhpoty8XDqCLX2xe7PDyBJzf1kUApYHw3PZWS5F62FtmwybmJb0WS8KL3FQ8RXJqEBnlrzdSuRZssGDHbe9ubvEbhH+l68O02J17l9+MzUGQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>lWx7gKgX6j+1cN8peY2EQDlCUJDGrxs+8wOATbgadsWKVRx5LRvHdepmDFc2y/riBQa4M0fZqZWxaC4NBHhSZrJHfCodqkbswo3KhDdvkDqH39c9FoicVOPaSUR7V1z6VBH87p+xH9AeOnCcHMkDWgRLqe9yg/YJ1gvTspaxMGrAWXbBUYYU1i2POmglsGQQ4MfmM2BfMOQIBlEuz5SVp2T/MFfInRFA6gdXeqP/q3QLnPTMmEZTRKFy+vvtvpFcjQX7FODCfmgtzaHgB4iwJoc6jPm41hoqsyF64BHZCTI=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPsor6Ffs3YMA2R8zXd3VffADyng3x7JpMZ4aRWyr6Q9rOQnhGm0EzxpV82a7hWmdeQ==</encrypted>]]>
        &AfterUpdate;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Q/O+fVFRLGd75+jbZnwl/sJGN0Nebk7T3QVbdnMEoXzn7iYLkTVrlL20kt3a4Q6Hw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        <![CDATA[<encrypted>J6D9V5h4edVjsWMgbEYYNpL3mKvaClSv0ob2cwGVw1KkJ/cZcLqr5gZdFS60uV30Imaht0RLW8HDrNb1+x76BfbMK7K/hAegZq/K6cbNMPktFk91SI4hWuRXHyziLkhyqbuxHXcRCPlbNFCs0zFMwEzjdYXKBG1htle8rSjv4Zg99HJPDezWbAn4wWwE5NN37caojNuVu28InXUh5XKZphRd4wulXVJ+WuTGFfWpEYFgRNKLTA4YD8EkaUhw0qZTwNf7t74xNJWecGy9Tm1dXjcsIqvMVaA2dG8T6ROZ2QS05fuvBntssKznVoRSjJ9j</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>LVy1ZLk8V9dxlM1lppVJ1deGsAJWzZvhgy6lh/5JygsM4WgYdsFo/DvBKFrJKxJtXbhOEPQF1NL6S8kquUYE6m8qVRp2Fmu3cgn3OsoHzCO6b3ocASE3p/xQ++Sp4HTv3+zrNjZeDdYhf8em0xHCuqXE+HpY6WV2NPGeLFpwAfwrO2wrwoumnOrJQEillXk0</encrypted>]]>
        &AfterUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKwzyR7rxQqrKuTy+ld6rkHL/B8MUjipHkkygz/cTG3t3CDFe5t9duHjAXRgpurnmk7g==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>FUbVxF9LZGYxY2ORfcq0ELw0GscM7n6PZj8RQInMTcQqbPVvWkSRWbBpJECNzuUo3rmcx2a7RLbej4h3OtwyfHnsr4pr8P2fPv92RJFRL6DfctrBHnMthz/aazF5z+mZJJ+b7r1pmSDKt9IOvho6wfQUwtFPXd02y/CGDQETlLFXsu89cdlwm+yoWtXwZ4Zpo+kS7BHQlEicacO59qb1jyvbOWgF2HnXQ8iCp7Yof5zNzYhaBDLt7cXCcROWPgjVDmHB2TbA6JSWQLEvDs8vNbJ/GjgsBQ3Tyi1OVHHVCp1fEohrPH4q13SkHkSLUa8f+dsDmyJHD8t8EGKGRswiU8BWcFlL/8ZUYwx0elTAL3Px0XovxmFO7gq7K/hxiIykOKdKMof1bQDATflzN5g8OKGPYPLtKlki0sU0DgXmyMcM1T53xYErTa6msCEgYiYyfuvw5NAftFqGOnYMPzmlymiq7LbOARt4FhNsf4NWg2I1NU/RjT/VOBwi60Ji/znfxMXWXuqxFP540/z+R/bMjBD1zVDdkPE7lqjuq/5u3pOuX6CQZV/2CkC5e/yfithef2z0fbbPKxdODq4hEMDSq5i76mS6fqmOMkJ/VSnEOxBGabzmxOip155nRiXjpm2P</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>rOef5/tXMblzDyF0//fsTarPXbTfcox6x/9WDYCinHPeM6jYiB7vTplHuiX6QBT0mTjnqli7pG3Z4eKIE3P0VKrVoSashfVmk0xX/XRohFpeEYxbZvvQRbSSKOztTlZcYfKxL1Acg4aE/t2uwna9ZdobXILBjbJsPuoxaYnJYj++5voVS2w2/WlH9idj2jnri4aZlAwiH1ascYgUF916iWH3gcnb+IF+WpLAiNrAnxGAakTJzHR7K06zIp3tJC1dDTlNS+qJ4y9hk16TOXYxPgfYUZYhVEDv9XelG2DwYPgoWrEosil86vRvFSF9jT5EJ6gsbrNAprwYL0K7bZv9o6fe2yCyMS5ojFeS3ROVTWlfejCXPY6gGtjRsTC5DnL/vT6lrBKimdAMoXvC+JvP+YJtHX9WDTMRKfIdI9sVEXDBROhcpv0vwhO7aBcIbytzgsbyat5VbdF2nUeLCDOkYyJ0sO+jk/PjqiOOA4KFaICseeez/hn1whChqpeRoe8E8eLC/4BH6O1VrkmjV9rWWDeSc78Gki2Y9we3ZSxZuMfWIIAN5z/cmQJ8mI8yXpnn7cnO+8fsLqStTmhB/DcbGWRbnlW4YQL+lKqW4Wf9ec/+O0AyAEXZ0Ho9ww8QPSJ6hLVv5c+PcpoVRZx79CnhLtoecRKARaqsUhIOj5/Ps/OEuIJO0ZYVwEaU9IrvCUc8VypkppvCf3WFduLc/IgPKTAuiG+tNyN79l871hUkZ4Acpu70mbpnMfCmf+OZSc7dNPtsVY1W4EyAuciZ4/wNllsEmqtfc9+Dctcl+PhQvx5noDbcOH/cuPGdSpvnac7N</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Product">
      <text>
        <![CDATA[<encrypted>GKhB1FHvGERyE3boDJdirvw//ICdyHsdBUzT3q1JZHsH2mfzSP3aRr3F4YQO4uahO1YloB+xBFCdHXl0hDMLSVKGKJur5/c389fX3+W2804X3b1yNiaJtDeXNuk6OFOhkSKiNgADmuQ97Im+YFVjfIFbpIeYDiFXlfA0L8FFHYI=</encrypted>]]>
      </text>
    </action>
  </response>

</dir>

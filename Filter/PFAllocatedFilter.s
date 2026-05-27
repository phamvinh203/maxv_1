<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PFAllocated">
  <!ENTITY DetailTable "d73">
]>

<dir table="m73$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Sửa chi phí phân bổ" e="Edit Charge Amount"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã ncc" e="Supplier"></header>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ma_nt">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="208" categoryIndex="1" allowContain="true">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="268" anchor="4">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100"/>
      <item value="11010000000101: [ma_kh].Label, [ma_kh], [ten_kh%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1----------111: [stt_rec], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1: [&DetailTable;]"/>
      <categories>
        <category index="1" columns="769, 0, 0, 0" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>


  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW4YLq9xp+5Cys6F66FoBAGjpbyNrd9FyHL0eI6q+NVZZ</encrypted>]]>&Identity;<![CDATA[<encrypted>KuV0B2/FNd/lMUhLG/kMQv6Usuxbas9hUlmI+fYVx1E3aSGfT9eiUAXB1i84JiFzrUzXGu72+kvHJ+Yei2k8J4rhsW+tYVEVr0ZsoJR8vjYd/MZ2nXP9d5LBjFgbWwkm0KA3kQUGIgavdZtCsJOECA==</encrypted>]]>&Identity;<![CDATA[<encrypted>Y4S52dgfxymN4KS9/z4eDdDROAK8xU0AOErDDJA28HrKTb8r1HryWN4z7J/V4R1BqNynAfIH4zRQZy7lYGItiv6UEdYrUTSznye3VbQqp15JXwrqED9QY/Fzy9SDH3ZtnfoK+HQB1U8E9xn5aj/0MHNej14NO0S8inS+EPrRiVM=</encrypted>]]>&Identity;<![CDATA[<encrypted>lO0bl9M53C33OGzCRRRtsTApgYbBTrN2E5WmwmoiSBMZidQyw4iQOpJ77nfoGremPt9FmKZXZV5D1lEJzjhu+QL77CsV9Ad0hINePvh5dFjLrMpBdMSeLnIZctHN0UZ55SyCkkuVNn2MxNUDQGnLv+KOx1QuxA0hiy+8AuVhGwx5IuQ7UiGK3xKY8dwezes9zwwgi0FuaH42gujBF3iV1bHiA0VZ3v0C8wjMuKghDWbUu7IbMFGosF78ubjAdh7lrdp730Ai6D0O8JW5aPk8hT7qzAg3Bv+l0d1aMK1yeBg=</encrypted>]]>&Identity;<![CDATA[<encrypted>KuV0B2/FNd/lMUhLG/kMQnN3wJceUQ+uA8gfzA94UaA1prwklS1QeVI69xhbm6V6Ie4YbMF2g1UMsVMfgzw04XWy2I0/VqgyCpW6Nn35mdQ=</encrypted>]]>&Identity;<![CDATA[<encrypted>Y4S52dgfxymN4KS9/z4eDdDROAK8xU0AOErDDJA28HoBjSVj3aq6oPBO003SCY8e6I86XP82R/JKJlXZUuJ1hjMUCHEV5cvuA4sBAtvuZHE=</encrypted>]]>&Identity;<![CDATA[<encrypted>WBAltpjcpJMN+H9uPs9p7XGoXDeLi5dCRnqeblsvMFELSepTPCuMl2XmEbhYEFGyiuVX8G78Qdgj/hZGaBC9OULgaZW2/g8bpG8dn4R4JzuYhqIChfkzyBhuyw7FyMPezHFBLUtFqRyjMHk9/brQXcKCnEWwHkIeTUEZuJH1O8CcuF36uqvMV1jCiW1tQrdM</encrypted>]]>&Identity;<![CDATA[<encrypted>irmbS+I7lprZX+zfF0kzogRAFUAwdCFvg5n4U6Swb4CDNl9f0uiOR7NqtXDf6ORLjYAXA0ItdIG9EXosTOG75tlyWokj3hBGRx9CsPFU0RA=</encrypted>]]>&Identity;<![CDATA[<encrypted>mH5gWK0ldJ0ob6bWfBW4oR1w4oF4x2uC5RJreylbpVK3o5y3hXbJD/VXNQX5MR+e7wu980HCEF9kXUoZGOBaf6qQgfr16bvPIEPN8sWgWoxKoWFjQrAAfo3THCjjPm0CFZe7UWpTGkBBDdcRY9BSPFUY4+l4S7p+vSLGGBIabv3OxwANKmTpMFpKLfZj4WdqgjPWnJhSqshfSCW92k+rt7zIvJ0fwc/6DqEevvSBd4ODgieZC9JIDvf2hricef7xlmbgnJDoCeERO/gQPJCJtEbY9fa4F62oDUxnAkH1jNlIxOnODsgNaAL0qVJob/bb28HIjRhchNcA0JxjoKYOxY7WEjalfqiFJRJGGD4yJeFpcJYn1iPguOngZFtxd+7mMtPBwr46gi8m+KfnUoHx1P1Y/4V53SIiBYAC+Qaj9Fj19CQGKI1ybqA1GQaiOWD0sDCU7hNE1Cb5N5pKL+Nq5g==</encrypted>]]>&Identity;<![CDATA[<encrypted>irmbS+I7lprZX+zfF0kzotN1IuWBNKJ8O5Yx0qNhnrXDu/WS9kkzJ/rHMwGV47b6dDRZQ3ogf3YFT+s4M/oL4z8k/ClsqJxrRW7OTifDOjA=</encrypted>]]>&Identity;<![CDATA[<encrypted>UFLHreeKZilSlG08Y5Qwnt49XT0J+YBISmorF5S+LFnQidEUHdM0XEoSPMZuoHNxTi/9jis23mxXXLAaMYfE01d1FD2S0TyctVI0XnnjVVnMGmtI78CtRfZPlJoL3bb+gxu7peY0/NqJUcV31ftC8p13uLoKlVFMFYtLwlGizFNgWVeZzafCWoE/nCWdF6NgSukZWiCAbI6lnfhLtUYeUeFKEAw6orGGRvEKFnaLTxH7SwTuwIBssaVBhWgyMf+wBaNbomjpPHDIRom5tzw71fDF0eIgk6ROp19tVM2G75gYpKSLU7HuSpF9eZ3x9k1u1s5zu3ZrCdrHYBOl+sV2wvclsOft1yp0e67251SBCIAusAlIzbKM5DmFlJ9qVXynCYEXtlkqzSPRQDfqwt9SB04HGnzKs66Z2HdQ79T/Qxx2oKdhD0RDzGpXxApYbSuMNgPV+5mDGzaflTPmLI/J3kEpDQ26LUXK8bTNkUkdrBjQ/+1Q859RtaFOOAiLYXw816QW2ZoDnePWSPtlu25a6Ra+KZYdZ1IrLn7ltHjnHEDApRlLqJS8Escy2zkYCoUvj3WqMxRC0gWx2U1c1tWMOw==</encrypted>]]>
    </text>
  </script>
</dir>

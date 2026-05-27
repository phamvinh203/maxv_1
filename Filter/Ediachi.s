<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">


  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Codition"></title>
  <fields>
	 <field name="loai">
      <header v="Khách hàng" e="Customer"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Khách hàng thuộc tỉnh thay đổi địa chỉ" e="Customers has chanege address"/>
        </item>
        <item value="2">
          <text v="Tất cả khách hàng" e="All Customer"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
	
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130,0"/>
      <item value="11000: [loai].Label, [loai]"/>

    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
	<command event="Processing">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F0Mxlp5iWXaT5RaWZUiy69qQLAPwWplLmCMvJD8OiSmFfO1veOTE1Qoe0WOtPMfcZZ1stmF7lkGBucRRQ7Lrn+MC//lunnDADtmCrfNOcFSsroYrm0NjRaKLiu0VpevOJH32yhxiefDc+Ar4DyplWO10Azyb3ZDF0Hczev13EVkZ</encrypted>]]>
      </text>
    </command> 
  </commands>

  <script>
    <text>
	&OutlineEntry;
      <![CDATA[<encrypted>nJ/ybHmGSR/i+fb6zt/7Us/rgWqcBkPeoejKeoQMima6zt20ImRt0FvnX/GyZo+ThEax74TFpmt6Vx7OCVID9ejWrAmeDfEuejU7IfBOA4YmkbopnC1YFf6w5FGwG4x69iN1zl32c5GF/N1oWXQM4j/HLCGoD1xz4pl8nTn0s0wt9cAS8aOwopyE8KXkmBnN97icL94r89c4G9m8vIiu3S3WGw9ZGK1RTrofq5mEpZ0E/gpbHoc5MJN25GKvNkxSCZ7MPysEXsslOX+gJQtbDlp6ZgLfiCAmyg8fjgabc9zeLNn28FYVpDj3qK0eGNzsA4tYAawJ8SoUKjWjMMrEMcMuRLsJ4p8OW2BCjuHJ6Ao=</encrypted>]]>
    </text>
  </script>
</dir>

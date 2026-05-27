<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Đổi, gộp mã" e="Change code item"></title>
  <fields>
    <field name="ma_cu" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã cũ" e="Old Code"/>
	  <items style="Mask"/>
    </field>
    <field name="ten_ma%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_moi" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã mới" e="New Code"/>
	  <items style="Mask"/>
    </field>
	
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="110100: [ma_cu].Label, [ma_cu],[ten_ma%l]"/>
      <item value="110---: [ma_moi].Label, [ma_moi]"/>
    </view>
  </views>

  <commands>
	<command event="Inserting">
			<text>
				<![CDATA[<encrypted>/ctfUs2ZMGddifjCUeOMUs0v0RfnhQq01618p8Vk7WSsNIpNh4qyCP9MNHggZE9YGSlwvTSTMAJlqn9a9lC/ozPb7LdtJor//eIR9dehZyY=</encrypted>]]>
			</text>
		</command>
	</commands>

</dir>
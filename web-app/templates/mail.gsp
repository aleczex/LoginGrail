<body>
Order Number:
<strong>${order.number}</strong>
<div style="float: left">Client Name: <strong>${order.clientName}</strong></div>
<div style="float: right">Order Date: <strong>${order.ordered}</strong></div>
<div><strong>Order Details</strong>
<table width="100%" border="1" cellspacing="0" cellpadding="0"
	bordercolor="#FBC8A2">
	<tr>
		<td><strong>Produto</strong></td>
		<td><strong>Quantidade</strong></td>
	</tr>
	<% order.orderItems.each { %>
	<tr>
		<td>${it.name}</td>
		<td>${it.quantity}</td>
		<td>${it.price}</td>
		<td>${it.price * it.quantity}</td>
	</tr>
	<% } %>
</table>
<p><strong>Sub-total:</strong> ${order.subTotal}<br />
<strong>Shipping:</strong> ${order.shippingCost}<br />
<strong>Total:</strong> ${order.subTotal + order.shippingCost}</p>
</div>
</body>
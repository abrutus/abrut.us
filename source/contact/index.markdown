---
layout: page
title: "Contact"
date: 2012-06-22 13:06
current: "contact"
comments: false
sharing: false
footer: true
---
<!--JQUERY-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js" type="text/javascript"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">

$(document).ready(function() {
	$("#GoogleForm").validate({meta: "validate"});
});

var submitted=false;
</script>

<iframe name="hidden_iframe" id="hidden_iframe" style="display:none;" onload="if(submitted){window.location='/thank-you';}"></iframe>

<form action="https://docs.google.com/spreadsheet/formResponse?formkey=dGI0Sm0tSFhRX1VRclY1TDNRSThRc1E6MQ&amp;embedded=true&amp;ifq" method="POST" target="hidden_iframe" id="GoogleForm" onsubmit="submitted=true;">

<br>
<div class="errorbox-good">
<div class="ss-item ss-item-required ss-text"><div class="ss-form-entry"><label class="ss-q-title" for="entry_0">Name
<span class="ss-required-asterisk">*</span></label>
<label class="ss-q-help" for="entry_0"></label>
<input type="text" name="entry.0.single" value="" class="ss-q-short required" id="entry_0"></div></div></div>
<br> <div class="errorbox-good">
<div class="ss-item ss-item-required ss-text"><div class="ss-form-entry"><label class="ss-q-title" for="entry_1">Email
<span class="ss-required-asterisk">*</span></label>
<label class="ss-q-help" for="entry_1"></label>
<input type="text" name="entry.1.single" value="" class="ss-q-short required email" type="email"  id="entry_1"></div></div></div>
<br> <div class="errorbox-good">
<div class="ss-item ss-item-required ss-paragraph-text"><div class="ss-form-entry"><label class="ss-q-title" for="entry_2">Message
<span class="ss-required-asterisk">*</span></label><br />
<label class="ss-q-help" for="entry_2"></label>
<textarea name="entry.2.single" rows="8" cols="75" class="ss-q-long required" id="entry_2"></textarea></div></div></div>
<br>
<input type="hidden" name="pageNumber" value="0">
<input type="hidden" name="backupCache" value="">


<div class="ss-item ss-navigate"><div class="ss-form-entry">
<input type="submit" name="submit" value="Submit"></div></div></form>

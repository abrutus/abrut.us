---
layout: post
title: "cURL PUT request with P12 (PKCS #12) certificate using PHP"
date: 2012-11-19 11:07
comments: true
categories: ['Programming'] 
---
While working with some archaic API I was asked to upload files via HTTP using a P12 certificate. At first, phased and confused, I thought to myself: file uploads usually happen through a POST request using a form
that has an enctype of multipart/form-data, or different protocols like (S)FTP, WebDav, etc. Remembering some academia on the HTTP protocol, I resorted to the PUT request, and it actually worked. So to save someone
some time: 

{% codeblock lang:php %}
<?php
$content = file_get_contents("/path/to/file_you_want_to_upload.pdf");
$stream_length = count($content);
$fp = fopen("php://memory", "rw");
fputs($fp, $content);
rewind($fp);
curl_setopt($ch, CURLOPT_URL, $url="http://some.url/file_you_want_to_upload.pdf");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSLCERT, "/path/to/certfile.p12");
curl_setopt($ch, CURLOPT_SSLCERTTYPE, "P12");
curl_setopt($ch, CURLOPT_SSLKEYPASSWD, "CertFilePassword");
// And if the HTTP endpoint requries HTTP Auth
//curl_setopt($ch, CURLOPT_USERPWD, $cfg['HTTP_AUTH_USER']. ":" . $cfg['HTTP_AUTH_PASS']);
curl_setopt($ch, CURLOPT_PUT, 1);
curl_setopt($ch, CURLOPT_INFILE, $put_file_handle);
curl_setopt($ch, CURLOPT_INFILESIZE, $stream_length);
$result = curl_exec($ch);
if($result === false) {
	throw new Exception("Curl Error on PUT file: ". curl_error($ch));
}
curl_close($ch);
fclose($ch);
?>
{% endcodeblock %}

This snippet opens a file, counts the bytes, opens a file stream (in memory) and passes that information into the CURLOPT_INFILE and CURLOPT_INFILESIZE parameters of the cURL API. This snippet throws, so you should use a try-catch.

An obvious improvement would be to use ```filesize()``` instead ouf ```count()```,
 but my script generates files on the fly, so instead of resorting to slow I/O, I do things in memory. You could change ```$content = "my file contents";``` and see its dynamic nature. If you will use it only for file system files, I do recommend using filesize().

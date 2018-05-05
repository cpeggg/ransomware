# README
This is a ransomware code for academic use.

Forked and developed by the group of ransomware project, leaded by cpegg.

Referred from [mauri870/ransomware](https://github.com/mauri870/ransomware), we avianize its virulence by altering its source code

## What we have done
To make it vulnerable to our defenses, we did the following work:

1. Switching the HTTPS protocol (used for uploading user ID and corresponding symmetric encrypt key) to HTTP, which we can listen to the network card equipment and dump the decrypt information by analyzing packets

2. Tor, as an anonymous communication way, make people hard to trace the attacker (refer to [Tor project](https://en.wikipedia.org/wiki/Tor_%28anonymity_network)). It acts like [bitcoin anonymous tally](https://bitcoinmagazine.com/guides/bitcoin-anonymous/), which people can only know their money has been delivered to a black hole (more specifically, Deep Web (or Hidden Web)) and have no way to trace who has got their money in the end. So here we only let the Tor receiver be the local machine (127.0.0.1). Anyone who want to try this one may need to start a local server to receive the userID and passwd (or your file may not be recovered!)

3. Considering the [WannaCry](https://en.wikipedia.org/wiki/WannaCry_ransomware_attack) situation, when the virus is running, there are tools which can directly dump the program memory by reading process private memory space. Here we found that the encryption key has a fix offset to a known string in the memory. So, if the ransomware has not exited (like it has prompted the *"Press any key to continue"* notice) we can have way to read the decryption key.

## TODO
However, here is one defending way we haven't finish yet:

The analysis of source code let us know that it uses CTR encrypt mode to encrypt the files, if we can alter it to CBC/EBC/... encryption mode, there are ways to recover the file (like [Padding Oracle Attack](https://www.zhihu.com/question/26437065), we can recover the message even if we don't know the key)

We can deployed some special files that can help us to recover the message byte by byte.

Further issue can be found at https://github.com/cpeggg/ransomware, contribution welcome.
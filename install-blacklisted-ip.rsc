/system script 
add name="pwlgrzs-blacklist-dl" source={/tool fetch url="https://raw.githubusercontent.com/rdy28/BlacklistedIP/Mikrotik-Blocklisted/blacklist-ip.rsc" mode=https}
add name="pwlgrzs-blacklist-replace" source {/ip firewall address-list remove [find where list="pwlgrzs-blacklist"]; /import file-name=blacklist.rsc; /file remove blacklist.rsc}
/system scheduler 
add interval=7d name="dl-mt-blacklist" start-date=Jan/01/2000 start-time=00:05:00 on-event=pwlgrzs-blacklist-dl
add interval=7d name="ins-mt-blacklist" start-date=Jan/01/2000 start-time=00:10:00 on-event=pwlgrzs-blacklist-replace
/file remove install.rsc

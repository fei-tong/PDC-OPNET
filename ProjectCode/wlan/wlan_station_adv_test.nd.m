MIL_3_Tfile_Hdr_ 145A 140A modeler 6 519E4AB0 51A122A9 12 wpd FeiTong 0 0 none none 0 0 none FD04E74A 3EBE 0 0 0 0 0 0 1e80 8                                                                                                                                                                                                                                                                                                                                                                                                   Ф═gЅ      8   L   Є  *  .  є  "     Ё   Ї  ;О  ;█      node   WLAN   	stn_wless   	stn_wless           Wireless LAN station    6   General Node Functions:    -----------------------        The wireless station node model    /represents an IEEE802.11 wireless LAN station.    %The node model consists of following    
processes:       *1. The MAC layer which has a wireless lan    !mac process model with following    attributes:       MAC address -- station address       *Fragmentation Threshold --- based on this    (threshold station decides wether or not    "to send data packets in fragments.       *Rts threshold --- based on this threshold    (station decides wether Rts/Cts exchange    *is needed for every data transmission.           "The wireless LAN MAC layer has an    "interface with higher layer which    &receives packet from higher layer and    "generates random address for them.           2. Wireless LAN interface       #This process model is an interface    )between MAC layer and higher layer.  The    &function of this process is to accept    'packets from higher layer and generate    &random destination address for them.     )This information is then sent to the MAC    layer.            3. Wireless LAN receiver       *This is a wireless receiver which accepts    (any incomming packets from the physical    &layer and pass it to the wireless MAC    process.           4. Wireless LAN transmitter       %This is a wireless transmitter which    #receives packet from MAC layer and    $transmits it to the physical medium.                        Destination Address      !wlan_mac_intf.Destination Address                                                                               Traffic Generation Parameters      $source.Traffic Generation Parameters                                                        count                                                                        ЦZ             list   	          	                                                  ЦZ                        Traffic Type of Service      wlan_mac_intf.Type of Service                                                                                Wireless LAN MAC Address      wireless_lan_mac.Address                                                                               Wireless LAN Parameters      (wireless_lan_mac.Wireless LAN Parameters                                                        count                                                                        ЦZ             list   	          	                                                  ЦZ                       altitude      altitude                                                                                          phase      phase                                                                                          Destination Address          
       Random   
   
TIM source            none      Traffic Generation Parameters         
      None   
   Traffic Type of Service                 Best Effort (0)      Wireless LAN MAC Address          
       Auto Assigned   
   Wireless LAN Parameters         
      Default   
   altitude         
               
   altitude modeling            relative to subnet-platform      	condition         
          
   financial cost            0.00      phase                           priority                        role                   user id                                   ╚   ╚          
   wireless_lan_mac   
       
   wlan_dispatch   
          	processor                   Wireless LAN Parameters         J            count          
          
      list   	      J            Channel Settings         
      Auto Assigned   
      Transmit Power         J?PbMмыЕЧ   0.001   J      PCF Parameters         
      Disabled   
      HCF Parameters         
      Not Supported   
   J   J      fj   џ   >          
   source   
       
   bursty_source   
          	processor                   fl   Ш   >          
   sink   
          sink             	processor                   fn   ╚   l          
   wlan_mac_intf   
       
   wlan_mac_interface   
          	processor                   Destination Address          	   ■   Random   	      Type of Service          	       Best Effort (0)   	   	  f|   џ   Ш          
   wlan_port_rx0   
       
            count          
          
      list   	      
            	data rate         
A.ёђ           
      packet formats         
   !unformatted,wlan_control,wlan_mac   
      	bandwidth         
@Н|            
      min frequency         
@б┬            
   
   
       
   dpsk   
       ?­                                          
   NONE   
       J   
wlan_power   J          dra_bkgnoise          
   wlan_inoise   
       J   dra_snr_wsn   J       
   wlan_ber   
       
   
wlan_error   
       
   wlan_ecc   
          ra_rx                       nd_radio_receiver        fђ   Ш   Ш          
   wlan_port_tx0   
       J            count          
          
      list   	      J            	data rate         
A.ёђ           
      packet formats         
   wlan_control,wlan_mac   
      	bandwidth         
@Н|            
      min frequency         
@б┬            
      spreading code         
н▓IГ%ћ├}       
      power         J?tzрG«{       J   J   J       
   dpsk   
       
   wlan_rxgroup   
       
   
wlan_txdel   
          dra_closure          
   wlan_chanmatch   
       
   NONE   
       
   wlan_propdel   
          ra_tx                       nd_radio_transmitter                    fђ      л   ═   Э   ш   
       
   strm_3   
       
   src stream [0]   
       
   dest stream [0]   
                                                                                                nd_packet_stream            f|          Б   ж   к   к   
       
   strm_4   
       
   src stream [0]   
       
   dest stream [0]   
                                              
@          
                                        nd_packet_stream            fj  fn      д   =   ┬   =   ┬   _   
       
   strm_10   
       
   src stream [0]   
       
   dest stream [0]   
                                              
@U         
                                        nd_packet_stream            fn  fl      ╠   _   ╠   >   ж   >   
       
   strm_11   
       
   src stream [0]   
       
   dest stream [0]   
                                              
@          
                                        nd_packet_stream            fn          ╠   x   ╠   ╗   
       
   strm_12   
       
   src stream [1]   
       
   dest stream [1]   
                                                                                                nd_packet_stream                fn      ┴   ╗   ┴   x   
       
   strm_13   
       
   src stream [1]   
       
   dest stream [1]   
                                              
@          
                                        nd_packet_stream           fђ          Щ   Ж   Щ   ┼   Л   ┼          
   txstat   
       
   channel [0]   
       
   radio transmitter.busy   
       
   
instat [1]   
                                              
           
                                                            н▓IГ%ћ├}              н▓IГ%ћ├}              
@U         
                                        nd_statistic_wire           f|          Љ   в   Љ   ─   К   ─          
   rxstat   
       
   channel [0]   
       
   !radio receiver.received power (W)   
       
   
instat [0]   
                                              
           
       
           
                                           
               
       
=V<ї╚%јC       
       
@U         
                                        nd_statistic_wire     fЂ      '   &wireless_lan_mac.Backoff Slots (slots)   Backoff Slots (slots)           Wireless Lan   bucket/default total/sum   linear   Wireless Lan   0wireless_lan_mac.Control Traffic Rcvd (bits/sec)   Control Traffic Rcvd (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   3wireless_lan_mac.Control Traffic Rcvd (packets/sec)   "Control Traffic Rcvd (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   0wireless_lan_mac.Control Traffic Sent (bits/sec)   Control Traffic Sent (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   3wireless_lan_mac.Control Traffic Sent (packets/sec)   "Control Traffic Sent (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   3wireless_lan_mac.Management Traffic Rcvd (bits/sec)   "Management Traffic Rcvd (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   6wireless_lan_mac.Management Traffic Rcvd (packets/sec)   %Management Traffic Rcvd (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   3wireless_lan_mac.Management Traffic Sent (bits/sec)   "Management Traffic Sent (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   6wireless_lan_mac.Management Traffic Sent (packets/sec)   %Management Traffic Sent (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   -wireless_lan_mac.Data Traffic Rcvd (bits/sec)   Data Traffic Rcvd (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   0wireless_lan_mac.Data Traffic Rcvd (packets/sec)   Data Traffic Rcvd (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   -wireless_lan_mac.Data Traffic Sent (bits/sec)   Data Traffic Sent (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   0wireless_lan_mac.Data Traffic Sent (packets/sec)   Data Traffic Sent (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan    wireless_lan_mac.Load (bits/sec)   Load (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   #wireless_lan_mac.Load (packets/sec)   Load (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   &wireless_lan_mac.Throughput (bits/sec)   Throughput (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   2wireless_lan_mac.Retransmission Attempts (packets)   !Retransmission Attempts (packets)           Wireless Lan   bucket/default total/sum   linear   Wireless Lan   )wireless_lan_mac.Media Access Delay (sec)   Media Access Delay (sec)           Wireless Lan    bucket/default total/sample mean   linear   Wireless Lan   wireless_lan_mac.Delay (sec)   Delay (sec)           Wireless Lan    bucket/default total/sample mean   linear   Wireless Lan    wireless_lan_mac.AP Connectivity   AP Connectivity           Wireless Lan   normal   square-wave   Wireless Lan   :wireless_lan_mac.Data Dropped (Buffer Overflow) (bits/sec)   )Data Dropped (Buffer Overflow) (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   =wireless_lan_mac.Data Dropped (Buffer Overflow) (packets/sec)   ,Data Dropped (Buffer Overflow) (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   Cwireless_lan_mac.Data Dropped (Retry Threshold Exceeded) (bits/sec)   2Data Dropped (Retry Threshold Exceeded) (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   %wireless_lan_mac.Queue Size (packets)   Queue Size (packets)           Wireless Lan   !bucket/default total/time average   linear   Wireless Lan   Fwireless_lan_mac.Data Dropped (Retry Threshold Exceeded) (packets/sec)   5Data Dropped (Retry Threshold Exceeded) (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   6wireless_lan_mac.Management Traffic Dropped (bits/sec)   %Management Traffic Dropped (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan   9wireless_lan_mac.Management Traffic Dropped (packets/sec)   (Management Traffic Dropped (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless Lan    wireless_lan_mac.Load (bits/sec)   Load (bits/sec)           WLAN (Per HCF Access Category)   bucket/default total/sum_time   linear   WLAN (Per HCF Access Category)   #wireless_lan_mac.Load (packets/sec)   Load (packets/sec)           WLAN (Per HCF Access Category)   bucket/default total/sum_time   linear   WLAN (Per HCF Access Category)   (wireless_lan_mac.AC Queue Size (packets)   AC Queue Size (packets)           WLAN (Per HCF Access Category)   !bucket/default total/time average   linear   WLAN (Per HCF Access Category)   :wireless_lan_mac.Data Dropped (Buffer Overflow) (bits/sec)   )Data Dropped (Buffer Overflow) (bits/sec)           WLAN (Per HCF Access Category)   bucket/default total/sum_time   linear   WLAN (Per HCF Access Category)   =wireless_lan_mac.Data Dropped (Buffer Overflow) (packets/sec)   ,Data Dropped (Buffer Overflow) (packets/sec)           WLAN (Per HCF Access Category)   bucket/default total/sum_time   linear   WLAN (Per HCF Access Category)   &wireless_lan_mac.Backoff Slots (slots)   Backoff Slots (slots)           WLAN (Per HCF Access Category)   bucket/default total/sum   linear   WLAN (Per HCF Access Category)   )wireless_lan_mac.Internal Collision Count   Internal Collision Count           WLAN (Per HCF Access Category)   bucket/default total/sum   linear   WLAN (Per HCF Access Category)   )wireless_lan_mac.Media Access Delay (sec)   Media Access Delay (sec)           WLAN (Per HCF Access Category)    bucket/default total/sample mean   linear   WLAN (Per HCF Access Category)   Cwireless_lan_mac.Data Dropped (Retry Threshold Exceeded) (bits/sec)   2Data Dropped (Retry Threshold Exceeded) (bits/sec)           WLAN (Per HCF Access Category)   bucket/default total/sum_time   linear   WLAN (Per HCF Access Category)   Fwireless_lan_mac.Data Dropped (Retry Threshold Exceeded) (packets/sec)   5Data Dropped (Retry Threshold Exceeded) (packets/sec)           WLAN (Per HCF Access Category)   bucket/default total/sum_time   linear   WLAN (Per HCF Access Category)   wireless_lan_mac.Delay (sec)   Delay (sec)           WLAN (Per HCF Access Category)    bucket/default total/sample mean   linear   WLAN (Per HCF Access Category)   &wireless_lan_mac.Throughput (bits/sec)   Throughput (bits/sec)           WLAN (Per HCF Access Category)   bucket/default total/sum_time   linear   WLAN (Per HCF Access Category)          machine type       station   Model Attributes      14.5.A-January18-2008                interface type       
IEEE802.11   interface class       access           wlan_port_tx<n>   wlan_port_rx<n>           
MIL_3_Tfile_Hdr_ 145A 140A modeler 9 51CA3531 51CA3531 1 wpd FeiTong 0 0 none none 0 0 none 2E3BB81C 2312 0 0 0 0 0 0 1e80 8                                                                                                                                                                                                                                                                                                                                                                                                    Ф═gЅ      @  Њ  Ќ  _  c  Љ  Ш  Щ   a   Щ  !  !
  !  Ё      	Send DATA                                                                       ЦZ             
Start Time                                                                                   ЦZ             Traffic Load                                infinity(-1)                                     infinity(-1)                 0(Remote or No traffic)                 1(test)                20                40      (          60      <          80      P          100      d           ЦZ             Debug                                                                       ЦZ             Packet Arrival Rate                                                                                     ;lambda --- The packet arrival rate in poisson distribution.ЦZ                 	   begsim intrpt         
          
   doc file            	nd_module      endsim intrpt         
          
   failure intrpts            disabled      intrpt interval         н▓IГ%ћ├}          priority                        recovery intrpts            disabled      subqueue                     count          
          
      list   	      
          
      super priority                              Objid	\process_id;       Objid	\node_id;       double	\start_time;       Boolean	\send_DATA;       int	\node_address;       int	\traffic_load;       Boolean	\infinity;       int	\node_type;       int	\self_pk_num;       Boolean	\debug;       double	\arrival_rate;       Stathandle	\traffic_sent_hndl;       Stathandle	\packets_sent_hndl;       %Stathandle	\global_packets_sent_hndl;          //File   	FILE *in;   char temp_file_name[300];      #define SEND_STRM 0   //Define node type   #define sink 	1   #define sensor 	2       B#define END	        		    	(op_intrpt_type() == OPC_INTRPT_ENDSIM)       .//Self-interrupt code and transition condition   #define SEND_DATA_S_CODE		100   h#define SEND_DATA_S				((op_intrpt_type() == OPC_INTRPT_SELF) && (op_intrpt_code() == SEND_DATA_S_CODE))   0//Remote-interrupt code and transition condition   #define SEND_DATA_R_CODE		200   j#define SEND_DATA_R				((op_intrpt_type() == OPC_INTRPT_REMOTE) && (op_intrpt_code() == SEND_DATA_R_CODE))       int pk_num=0;   //function prototype   'static void create_and_send_DATA(void);   data_num=0;      //create DATA pk   static void    create_and_send_DATA(void)   {   //var   	Packet * pk_DATA;   //in   	FIN(create_and_send_DATA());   //body   	   	data_num++;   +	pk_DATA = op_pk_create_fmt("MAC_DATA_PK");   $	op_pk_nfd_set(pk_DATA,"Hop Num",0);   4	op_pk_nfd_set(pk_DATA,"Create Time",op_sim_time());   +	op_pk_nfd_set(pk_DATA,"Data No",data_num);   	op_pk_send(pk_DATA,SEND_STRM);   	   //out   	FOUT;   }                                          ќ            
   init   
       
   &   // Obtain related ID   process_id = op_id_self();   &node_id = op_topo_parent(process_id);       8op_ima_obj_attr_get(process_id, "Send DATA",&send_DATA);   :op_ima_obj_attr_get(process_id, "Start Time",&start_time);   8//op_ima_obj_attr_get(process_id, "Interval",&interval);   >op_ima_obj_attr_get(process_id, "Traffic Load",&traffic_load);   0op_ima_obj_attr_get(process_id, "Debug",&debug);   Dop_ima_obj_attr_get(process_id,"Packet Arrival Rate",&arrival_rate);       7op_ima_obj_attr_get(node_id, "user id", &node_address);   5op_ima_obj_attr_get(node_id, "Node Type",&node_type);           if(traffic_load<0)   {   	infinity = OPC_TRUE;   }else   {   	infinity = OPC_FALSE;   }           if(send_DATA&&traffic_load<0)   {   F	op_intrpt_schedule_self(op_sim_time() + start_time,SEND_DATA_S_CODE);   }   if(send_DATA&&traffic_load>0)   {   F	op_intrpt_schedule_self(op_sim_time() + start_time,SEND_DATA_S_CODE);   	--traffic_load;   }   mtraffic_sent_hndl = op_stat_reg ("Generator.Traffic Sent (packets/sec)",OPC_STAT_INDEX_NONE, OPC_STAT_LOCAL);   ipackets_sent_hndl = op_stat_reg ("Generator.Packets Sent (packets)",OPC_STAT_INDEX_NONE, OPC_STAT_LOCAL);   qglobal_packets_sent_hndl = op_stat_reg ("Generator.Packets Sent (packets)",OPC_STAT_INDEX_NONE, OPC_STAT_GLOBAL);   //pk_num=0;   self_pk_num=0;   
                     
          
          pr_state        J            
   idle   
                                   
           
          pr_state        J   Z          
   send DATA S   
       
      create_and_send_DATA();   	pk_num++;   self_pk_num++;       'op_stat_write (traffic_sent_hndl, 1.0);   'op_stat_write (traffic_sent_hndl, 0.0);   8op_stat_write (packets_sent_hndl, (double) self_pk_num);   9op_stat_write (global_packets_sent_hndl, (double)pk_num);           if(!infinity && traffic_load>0)   {   a	op_intrpt_schedule_self(op_sim_time() + op_dist_exponential(1.0/arrival_rate),SEND_DATA_S_CODE);   	--traffic_load;   }	   if(infinity)   {   a	op_intrpt_schedule_self(op_sim_time() + op_dist_exponential(1.0/arrival_rate),SEND_DATA_S_CODE);   }       	if(debug)   rprintf("Node: %d. In \"gsrc\",time:%f,\nHave created DATA and sent it to \"gmac\".\n",node_address,op_sim_time());   
                     
          
          pr_state        J  ┬          
   send DATA R   
       
      create_and_send_DATA();   	pk_num++;   self_pk_num++;       	if(debug)   3printf("In \"gsrc\",Remote Interruption,time:%f,\n\   1		Have created DATA and sent it to \"gmac\".\n",\   		op_sim_time());   
                     
          
          pr_state        ■            
   end   
       
      if(send_DATA)   {   /	if(op_ima_obj_attr_exists(node_id,"Log File"))   	{	   9		op_ima_obj_attr_get(node_id,"Log File",temp_file_name);   "		in = fopen(temp_file_name,"at");   є		fprintf(in,"Node %d sent %d packets.\nAll soruces totally sent %d packets. (in \"gsrc->end\")\r\n",node_address,self_pk_num,pk_num);   C		//fprintf(in,"The sending interval is %f seconds.\r\n",interval);   9		fprintf(in,"Simulation time: %f s.\r\n",op_sim_time());   		fprintf(in,"End.\r\n\r\n");   		fclose(in);   	}   }else       %if(traffic_load==0 && self_pk_num!=0)   {       /	if(op_ima_obj_attr_exists(node_id,"Log File"))   	{	   9		op_ima_obj_attr_get(node_id,"Log File",temp_file_name);   "		in = fopen(temp_file_name,"at");   є		fprintf(in,"Node %d sent %d packets.\nAll sources totally sent %d packets.(in \"gsrc->end\").\r\n",node_address,self_pk_num,pk_num);   7		//fprintf(in,"иб░Ч╝СИЗ╬фБ║%f seconds.\r\n",interval);   9		fprintf(in,"Simulation time: %f s.\r\n",op_sim_time());   		fprintf(in,"End.\r\n\r\n");   		fclose(in);   	}   }   
                                          pr_state                        Э        г    D            
   tr_0   
                                   
           
                                     pr_transition              P   │     Q   t  Q   Ы          
   tr_2   
                                   
           
                                     pr_transition                 ┤     F   ш  G   v          
   tr_3   
       
   SEND_DATA_S   
                     
           
                                     pr_transition                i     E  %  D  Д          
   tr_4   
       
   SEND_DATA_R   
                     
           
                                     pr_transition              T  g     S  Ф  T  #          
   tr_5   
                                   
           
                                     pr_transition              Ф       [    Щ            
   tr_6   
       
   END   
                     
           
                                     pr_transition                   Traffic Sent (packets/sec)          (Total number of packets per second that    &are generated and sent to lower layer    by this source.    	Generator   bucket/default total/sum_time   linear        н▓IГ%ћ├}   Packets Sent (packets)          Total number of packets sent   	Generator   bucket/default total/max value   linear        н▓IГ%ћ├}      Packets Sent (packets)          &total packets sent by all source nodes   	Generator   bucket/default total/max value   linear        н▓IГ%ћ├}                        
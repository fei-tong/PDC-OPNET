MIL_3_Tfile_Hdr_ 145A 140A modeler 9 4BFF6231 51425ABF 41 fei-PC fei 0 0 none none 0 0 none BB2D48B7 1845 0 0 0 0 0 0 1e80 8                                                                                                                                                                                                                                                                                                                                                                                                    ��g�      @      �  �    !  %  )  -  9  =  A        DATA Delay Log   �������   ����       ����      ����      ����           �Z             Throughput Delay Log   �������   ����       ����      ����      ����           �Z                 	   begsim intrpt         
   ����   
   doc file            	nd_module      endsim intrpt         
   ����   
   failure intrpts            disabled      intrpt interval         ԲI�%��}����      priority              ����      recovery intrpts            disabled      subqueue                     count    ���   
   ����   
      list   	���   
          
      super priority             ����             Objid	\process_id;       int	\node_type;       int	\data_id;       List *	\data_id_list;       int	\node_address;       Objid	\node_id;          Packet 		* pk_TV;   double		ete_delay;   
int			hop;   int 		src_TV;   //int			data_id_TV;   int			pk_type;   //File   
FILE		*in;   char 		temp_file_name[200];       DataID * id_TV;      B#define END	        		    	(op_intrpt_type() == OPC_INTRPT_ENDSIM)   //Define node type   #define sink 	1   #define sensor 	2       int data_nums = 0;   double avg_delay = 0.0;       typedef struct   {   	int st_data_id;   }DataID;       %static Boolean data_id_exist(int id);      $static Boolean data_id_exist(int id)   {   //var   	int i,list_size;   	DataID* ID;   	Boolean flag=OPC_FALSE;   //in   	FIN(data_id_exist(int id));   //body   *	list_size=op_prg_list_size(data_id_list);   	for(i=0;i<list_size;i++){   2		ID=(DataID *)op_prg_list_access(data_id_list,i);   		if(ID->st_data_id==id){   			flag=OPC_TRUE;   				break;   		}   	}   //out   	FRET(flag);   }                                          �  J          
   init   
       J      process_id = op_id_self();   &node_id = op_topo_parent(process_id);   //data_nums = 0;   node_type = -1;   7op_ima_obj_attr_get(node_id, "user id", &node_address);       5op_ima_obj_attr_get(node_id, "Node Type",&node_type);   /*   Bif(op_ima_obj_attr_exists(op_topo_parent(process_id),"Node Type"))   {   H	op_ima_obj_attr_get(op_topo_parent(process_id),"Node Type",&node_type);   	   	if(node_type == sink)   	{   B		op_ima_obj_attr_get(process_id,"DATA Delay Log",temp_file_name);   "		in = fopen(temp_file_name,"at");   ,		fprintf(in,"		delay			hop		src_node\r\n");   		fclose(in);   	}   }else   {   A	op_ima_obj_attr_get(process_id,"DATA Delay Log",temp_file_name);   !	in = fopen(temp_file_name,"at");   "	fprintf(in,"		in sink_dest\r\n");   +	fprintf(in,"		delay			hop		src_node\r\n");   	fclose(in);   }	   */   "data_id_list=op_prg_list_create();   //avg_delay=0;   J                     
   ����   
          pr_state        J  J          
   idle   
                                       ����             pr_state        J   �          
   RCV   
       
   !   &pk_TV = op_pk_get (op_intrpt_strm ());   %op_pk_nfd_get(pk_TV,"Type",&pk_type);       1//printf("The type of packet is: %d.\n",pk_type);       (op_pk_nfd_get(pk_TV,"Data No",&data_id);       if(!data_id_exist(data_id)){       2	id_TV=(DataID *)op_prg_mem_alloc(sizeof(DataID));   	id_TV->st_data_id=data_id;   9	op_prg_list_insert(data_id_list,id_TV,OPC_LISTPOS_TAIL);       	data_nums++;   @	//ete_delay = op_sim_time () - op_pk_creation_time_get (pk_TV);   /	op_pk_nfd_get(pk_TV,"Create Time",&ete_delay);   (	ete_delay = op_sim_time () - ete_delay;   	   %	op_pk_nfd_get(pk_TV,"Hop Num",&hop);       $	op_pk_nfd_get(pk_TV,"Src",&src_TV);   	   	avg_delay=avg_delay+ete_delay;       A	op_ima_obj_attr_get(process_id,"DATA Delay Log",temp_file_name);   !	in = fopen(temp_file_name,"at");       O    fprintf(in,"%d		%f		%d		%d	%d\r\n",data_nums,ete_delay,hop,src_TV,data_id);   6	//fprintf(in,"%d	%f	%d\r\n",data_nums,ete_delay,hop);       	fclose(in);   }   op_pk_destroy(pk_TV);   
                     
   ����   
          pr_state        �  J          
   end   
       J      Bif(op_ima_obj_attr_exists(op_topo_parent(process_id),"Node Type"))   {   ,	if(node_type == sink && node_address == -1)   	{   B		op_ima_obj_attr_get(process_id,"DATA Delay Log",temp_file_name);   "		in = fopen(temp_file_name,"at");   		fprintf(in,"\r\n\r\n");   		fclose(in);   		   H		op_ima_obj_attr_get(process_id,"Throughput Delay Log",temp_file_name);   "		in = fopen(temp_file_name,"at");   K		fprintf(in,"%f %f\r\n",data_nums/(op_sim_time()-60),avg_delay/data_nums);   		fclose(in);   	}   }else   {	   A	op_ima_obj_attr_get(process_id,"DATA Delay Log",temp_file_name);   !	in = fopen(temp_file_name,"at");   	fprintf(in,"\r\n\r\n");   	fclose(in);   }        op_prg_list_free (data_id_list);   op_prg_mem_free (data_id_list);   J                         ����             pr_state                        �  J      �  I  K  J          
   tr_0   
       ����          ����          
    ����   
          ����                       pr_transition              B   �     B  5  D   �          
   tr_1   
       
   #op_intrpt_type() == OPC_INTRPT_STRM   
       ����          
    ����   
          ����                       pr_transition              Q   �     R   �  Q  .          
   tr_2   
       ����          ����          
    ����   
          ����                       pr_transition              �  V     ^  K  �  J          
   tr_3   
       
   END   
       ����          
    ����   
          ����                       pr_transition                                             
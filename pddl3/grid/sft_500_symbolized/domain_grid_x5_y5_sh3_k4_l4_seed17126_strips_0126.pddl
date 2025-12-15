(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v1 ?v5)
             (pred_9 ?v9 ?v12)
             (pred_7 ?v1 ?v12)
             (pred_8 ?v6 ?v1 )
	     (pred_6 ?v1)
             (pred_1 ?v3)
             (pred_4 ?v9)
             (pred_11 ?v12)
             (pred_5 ?v1)
             (pred_2 ?v9)
             (pred_10 ?v1)
             (pred_3 ))



(:action op_3
:parameters (?v13 ?v7 ?v2 ?v8)
:precondition (and (pred_1 ?v13) (pred_1 ?v7) (pred_4 ?v2) (pred_11 ?v8)
          (pred_12 ?v13 ?v7) (pred_9 ?v2 ?v8)
                   (pred_7 ?v7 ?v8) (pred_6 ?v13) 
                   (pred_5 ?v7) (pred_2 ?v2))
:effect (and  (pred_10 ?v7) (not (pred_5 ?v7))))


(:action op_4
:parameters (?v13 ?v11)
:precondition (and (pred_1 ?v13) (pred_1 ?v11)
               (pred_6 ?v13) (pred_12 ?v13 ?v11) (pred_10 ?v11))
:effect (and (pred_6 ?v11) (not (pred_6 ?v13))))

(:action op_1
:parameters (?v13 ?v2)
:precondition (and (pred_1 ?v13) (pred_4 ?v2) 
                  (pred_6 ?v13) (pred_8 ?v2 ?v13) (pred_3 ))
:effect (and (pred_2 ?v2)
   (not (pred_8 ?v2 ?v13)) (not (pred_3 ))))


(:action op_2
:parameters (?v13 ?v10 ?v4)
:precondition (and (pred_1 ?v13) (pred_4 ?v10) (pred_4 ?v4)
                  (pred_6 ?v13) (pred_2 ?v4) (pred_8 ?v10 ?v13))
:effect (and (pred_2 ?v10) (pred_8 ?v4 ?v13)
        (not (pred_2 ?v4)) (not (pred_8 ?v10 ?v13))))

(:action op_5
:parameters (?v13 ?v2)
:precondition (and (pred_1 ?v13) (pred_4 ?v2) 
                  (pred_6 ?v13) (pred_2 ?v2))
:effect (and (pred_3 ) (pred_8 ?v2 ?v13) (not (pred_2 ?v2)))))


	

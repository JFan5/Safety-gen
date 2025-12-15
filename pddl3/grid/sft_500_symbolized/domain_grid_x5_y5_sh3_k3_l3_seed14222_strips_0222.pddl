(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v7 ?v5)
             (pred_1 ?v10 ?v3)
             (pred_10 ?v7 ?v3)
             (pred_3 ?v8 ?v7 )
	     (pred_11 ?v7)
             (pred_9 ?v12)
             (pred_2 ?v10)
             (pred_4 ?v3)
             (pred_5 ?v7)
             (pred_6 ?v10)
             (pred_8 ?v7)
             (pred_12 ))



(:action op_5
:parameters (?v9 ?v2 ?v11 ?v1)
:precondition (and (pred_9 ?v9) (pred_9 ?v2) (pred_2 ?v11) (pred_4 ?v1)
          (pred_7 ?v9 ?v2) (pred_1 ?v11 ?v1)
                   (pred_10 ?v2 ?v1) (pred_11 ?v9) 
                   (pred_5 ?v2) (pred_6 ?v11))
:effect (and  (pred_8 ?v2) (not (pred_5 ?v2))))


(:action op_2
:parameters (?v9 ?v6)
:precondition (and (pred_9 ?v9) (pred_9 ?v6)
               (pred_11 ?v9) (pred_7 ?v9 ?v6) (pred_8 ?v6))
:effect (and (pred_11 ?v6) (not (pred_11 ?v9))))

(:action op_3
:parameters (?v9 ?v11)
:precondition (and (pred_9 ?v9) (pred_2 ?v11) 
                  (pred_11 ?v9) (pred_3 ?v11 ?v9) (pred_12 ))
:effect (and (pred_6 ?v11)
   (not (pred_3 ?v11 ?v9)) (not (pred_12 ))))


(:action op_1
:parameters (?v9 ?v4 ?v13)
:precondition (and (pred_9 ?v9) (pred_2 ?v4) (pred_2 ?v13)
                  (pred_11 ?v9) (pred_6 ?v13) (pred_3 ?v4 ?v9))
:effect (and (pred_6 ?v4) (pred_3 ?v13 ?v9)
        (not (pred_6 ?v13)) (not (pred_3 ?v4 ?v9))))

(:action op_4
:parameters (?v9 ?v11)
:precondition (and (pred_9 ?v9) (pred_2 ?v11) 
                  (pred_11 ?v9) (pred_6 ?v11))
:effect (and (pred_12 ) (pred_3 ?v11 ?v9) (not (pred_6 ?v11)))))


	

(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v4)
             (pred_6 ?v8 ?v11)
             (pred_3 ?v5 ?v11)
             (pred_9 ?v9 ?v5 )
	     (pred_7 ?v5)
             (pred_1 ?v7)
             (pred_8 ?v8)
             (pred_12 ?v11)
             (pred_10 ?v5)
             (pred_4 ?v8)
             (pred_2 ?v5)
             (pred_5 ))



(:action op_4
:parameters (?v2 ?v3 ?v1 ?v12)
:precondition (and (pred_1 ?v2) (pred_1 ?v3) (pred_8 ?v1) (pred_12 ?v12)
          (pred_11 ?v2 ?v3) (pred_6 ?v1 ?v12)
                   (pred_3 ?v3 ?v12) (pred_7 ?v2) 
                   (pred_10 ?v3) (pred_4 ?v1))
:effect (and  (pred_2 ?v3) (not (pred_10 ?v3))))


(:action op_1
:parameters (?v2 ?v6)
:precondition (and (pred_1 ?v2) (pred_1 ?v6)
               (pred_7 ?v2) (pred_11 ?v2 ?v6) (pred_2 ?v6))
:effect (and (pred_7 ?v6) (not (pred_7 ?v2))))

(:action op_3
:parameters (?v2 ?v1)
:precondition (and (pred_1 ?v2) (pred_8 ?v1) 
                  (pred_7 ?v2) (pred_9 ?v1 ?v2) (pred_5 ))
:effect (and (pred_4 ?v1)
   (not (pred_9 ?v1 ?v2)) (not (pred_5 ))))


(:action op_5
:parameters (?v2 ?v10 ?v13)
:precondition (and (pred_1 ?v2) (pred_8 ?v10) (pred_8 ?v13)
                  (pred_7 ?v2) (pred_4 ?v13) (pred_9 ?v10 ?v2))
:effect (and (pred_4 ?v10) (pred_9 ?v13 ?v2)
        (not (pred_4 ?v13)) (not (pred_9 ?v10 ?v2))))

(:action op_2
:parameters (?v2 ?v1)
:precondition (and (pred_1 ?v2) (pred_8 ?v1) 
                  (pred_7 ?v2) (pred_4 ?v1))
:effect (and (pred_5 ) (pred_9 ?v1 ?v2) (not (pred_4 ?v1)))))


	

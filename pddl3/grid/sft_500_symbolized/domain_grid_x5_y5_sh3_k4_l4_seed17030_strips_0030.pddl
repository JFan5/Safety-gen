(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v8)
             (pred_9 ?v12 ?v1)
             (pred_7 ?v5 ?v1)
             (pred_8 ?v9 ?v5 )
	     (pred_2 ?v5)
             (pred_12 ?v6)
             (pred_6 ?v12)
             (pred_4 ?v1)
             (pred_1 ?v5)
             (pred_5 ?v12)
             (pred_3 ?v5)
             (pred_10 ))



(:action op_2
:parameters (?v2 ?v3 ?v4 ?v13)
:precondition (and (pred_12 ?v2) (pred_12 ?v3) (pred_6 ?v4) (pred_4 ?v13)
          (pred_11 ?v2 ?v3) (pred_9 ?v4 ?v13)
                   (pred_7 ?v3 ?v13) (pred_2 ?v2) 
                   (pred_1 ?v3) (pred_5 ?v4))
:effect (and  (pred_3 ?v3) (not (pred_1 ?v3))))


(:action op_4
:parameters (?v2 ?v11)
:precondition (and (pred_12 ?v2) (pred_12 ?v11)
               (pred_2 ?v2) (pred_11 ?v2 ?v11) (pred_3 ?v11))
:effect (and (pred_2 ?v11) (not (pred_2 ?v2))))

(:action op_5
:parameters (?v2 ?v4)
:precondition (and (pred_12 ?v2) (pred_6 ?v4) 
                  (pred_2 ?v2) (pred_8 ?v4 ?v2) (pred_10 ))
:effect (and (pred_5 ?v4)
   (not (pred_8 ?v4 ?v2)) (not (pred_10 ))))


(:action op_3
:parameters (?v2 ?v10 ?v7)
:precondition (and (pred_12 ?v2) (pred_6 ?v10) (pred_6 ?v7)
                  (pred_2 ?v2) (pred_5 ?v7) (pred_8 ?v10 ?v2))
:effect (and (pred_5 ?v10) (pred_8 ?v7 ?v2)
        (not (pred_5 ?v7)) (not (pred_8 ?v10 ?v2))))

(:action op_1
:parameters (?v2 ?v4)
:precondition (and (pred_12 ?v2) (pred_6 ?v4) 
                  (pred_2 ?v2) (pred_5 ?v4))
:effect (and (pred_10 ) (pred_8 ?v4 ?v2) (not (pred_5 ?v4)))))


	

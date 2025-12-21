(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v10 ?v8)
             (pred_2 ?v9 ?v4)
             (pred_1 ?v10 ?v4)
             (pred_9 ?v6 ?v10 )
	     (pred_5 ?v10)
             (pred_8 ?v13)
             (pred_6 ?v9)
             (pred_7 ?v4)
             (pred_3 ?v10)
             (pred_12 ?v9)
             (pred_11 ?v10)
             (pred_10 ))



(:action op_1
:parameters (?v2 ?v3 ?v11 ?v1)
:precondition (and (pred_8 ?v2) (pred_8 ?v3) (pred_6 ?v11) (pred_7 ?v1)
          (pred_4 ?v2 ?v3) (pred_2 ?v11 ?v1)
                   (pred_1 ?v3 ?v1) (pred_5 ?v2) 
                   (pred_3 ?v3) (pred_12 ?v11))
:effect (and  (pred_11 ?v3) (not (pred_3 ?v3))))


(:action op_4
:parameters (?v2 ?v7)
:precondition (and (pred_8 ?v2) (pred_8 ?v7)
               (pred_5 ?v2) (pred_4 ?v2 ?v7) (pred_11 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v2))))

(:action op_5
:parameters (?v2 ?v11)
:precondition (and (pred_8 ?v2) (pred_6 ?v11) 
                  (pred_5 ?v2) (pred_9 ?v11 ?v2) (pred_10 ))
:effect (and (pred_12 ?v11)
   (not (pred_9 ?v11 ?v2)) (not (pred_10 ))))


(:action op_3
:parameters (?v2 ?v5 ?v12)
:precondition (and (pred_8 ?v2) (pred_6 ?v5) (pred_6 ?v12)
                  (pred_5 ?v2) (pred_12 ?v12) (pred_9 ?v5 ?v2))
:effect (and (pred_12 ?v5) (pred_9 ?v12 ?v2)
        (not (pred_12 ?v12)) (not (pred_9 ?v5 ?v2))))

(:action op_2
:parameters (?v2 ?v11)
:precondition (and (pred_8 ?v2) (pred_6 ?v11) 
                  (pred_5 ?v2) (pred_12 ?v11))
:effect (and (pred_10 ) (pred_9 ?v11 ?v2) (not (pred_12 ?v11)))))


	

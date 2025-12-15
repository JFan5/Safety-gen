(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v12)
             (pred_10 ?v3 ?v13)
             (pred_1 ?v5 ?v13)
             (pred_2 ?v9 ?v5 )
	     (pred_4 ?v5)
             (pred_11 ?v1)
             (pred_7 ?v3)
             (pred_3 ?v13)
             (pred_8 ?v5)
             (pred_12 ?v3)
             (pred_9 ?v5)
             (pred_5 ))



(:action op_4
:parameters (?v2 ?v7 ?v11 ?v4)
:precondition (and (pred_11 ?v2) (pred_11 ?v7) (pred_7 ?v11) (pred_3 ?v4)
          (pred_6 ?v2 ?v7) (pred_10 ?v11 ?v4)
                   (pred_1 ?v7 ?v4) (pred_4 ?v2) 
                   (pred_8 ?v7) (pred_12 ?v11))
:effect (and  (pred_9 ?v7) (not (pred_8 ?v7))))


(:action op_3
:parameters (?v2 ?v10)
:precondition (and (pred_11 ?v2) (pred_11 ?v10)
               (pred_4 ?v2) (pred_6 ?v2 ?v10) (pred_9 ?v10))
:effect (and (pred_4 ?v10) (not (pred_4 ?v2))))

(:action op_1
:parameters (?v2 ?v11)
:precondition (and (pred_11 ?v2) (pred_7 ?v11) 
                  (pred_4 ?v2) (pred_2 ?v11 ?v2) (pred_5 ))
:effect (and (pred_12 ?v11)
   (not (pred_2 ?v11 ?v2)) (not (pred_5 ))))


(:action op_2
:parameters (?v2 ?v6 ?v8)
:precondition (and (pred_11 ?v2) (pred_7 ?v6) (pred_7 ?v8)
                  (pred_4 ?v2) (pred_12 ?v8) (pred_2 ?v6 ?v2))
:effect (and (pred_12 ?v6) (pred_2 ?v8 ?v2)
        (not (pred_12 ?v8)) (not (pred_2 ?v6 ?v2))))

(:action op_5
:parameters (?v2 ?v11)
:precondition (and (pred_11 ?v2) (pred_7 ?v11) 
                  (pred_4 ?v2) (pred_12 ?v11))
:effect (and (pred_5 ) (pred_2 ?v11 ?v2) (not (pred_12 ?v11)))))


	

(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v1 ?v5)
             (pred_1 ?v13 ?v8)
             (pred_11 ?v1 ?v8)
             (pred_5 ?v4 ?v1 )
	     (pred_6 ?v1)
             (pred_9 ?v6)
             (pred_12 ?v13)
             (pred_3 ?v8)
             (pred_7 ?v1)
             (pred_4 ?v13)
             (pred_2 ?v1)
             (pred_10 ))



(:action op_3
:parameters (?v2 ?v7 ?v11 ?v12)
:precondition (and (pred_9 ?v2) (pred_9 ?v7) (pred_12 ?v11) (pred_3 ?v12)
          (pred_8 ?v2 ?v7) (pred_1 ?v11 ?v12)
                   (pred_11 ?v7 ?v12) (pred_6 ?v2) 
                   (pred_7 ?v7) (pred_4 ?v11))
:effect (and  (pred_2 ?v7) (not (pred_7 ?v7))))


(:action op_4
:parameters (?v2 ?v3)
:precondition (and (pred_9 ?v2) (pred_9 ?v3)
               (pred_6 ?v2) (pred_8 ?v2 ?v3) (pred_2 ?v3))
:effect (and (pred_6 ?v3) (not (pred_6 ?v2))))

(:action op_5
:parameters (?v2 ?v11)
:precondition (and (pred_9 ?v2) (pred_12 ?v11) 
                  (pred_6 ?v2) (pred_5 ?v11 ?v2) (pred_10 ))
:effect (and (pred_4 ?v11)
   (not (pred_5 ?v11 ?v2)) (not (pred_10 ))))


(:action op_1
:parameters (?v2 ?v9 ?v10)
:precondition (and (pred_9 ?v2) (pred_12 ?v9) (pred_12 ?v10)
                  (pred_6 ?v2) (pred_4 ?v10) (pred_5 ?v9 ?v2))
:effect (and (pred_4 ?v9) (pred_5 ?v10 ?v2)
        (not (pred_4 ?v10)) (not (pred_5 ?v9 ?v2))))

(:action op_2
:parameters (?v2 ?v11)
:precondition (and (pred_9 ?v2) (pred_12 ?v11) 
                  (pred_6 ?v2) (pred_4 ?v11))
:effect (and (pred_10 ) (pred_5 ?v11 ?v2) (not (pred_4 ?v11)))))


	

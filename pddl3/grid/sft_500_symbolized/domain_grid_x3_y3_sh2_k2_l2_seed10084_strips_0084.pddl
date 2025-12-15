(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v1 ?v10)
             (pred_10 ?v12 ?v3)
             (pred_4 ?v1 ?v3)
             (pred_2 ?v9 ?v1 )
	     (pred_12 ?v1)
             (pred_8 ?v6)
             (pred_1 ?v12)
             (pred_5 ?v3)
             (pred_3 ?v1)
             (pred_6 ?v12)
             (pred_7 ?v1)
             (pred_9 ))



(:action op_1
:parameters (?v2 ?v8 ?v11 ?v13)
:precondition (and (pred_8 ?v2) (pred_8 ?v8) (pred_1 ?v11) (pred_5 ?v13)
          (pred_11 ?v2 ?v8) (pred_10 ?v11 ?v13)
                   (pred_4 ?v8 ?v13) (pred_12 ?v2) 
                   (pred_3 ?v8) (pred_6 ?v11))
:effect (and  (pred_7 ?v8) (not (pred_3 ?v8))))


(:action op_4
:parameters (?v2 ?v7)
:precondition (and (pred_8 ?v2) (pred_8 ?v7)
               (pred_12 ?v2) (pred_11 ?v2 ?v7) (pred_7 ?v7))
:effect (and (pred_12 ?v7) (not (pred_12 ?v2))))

(:action op_3
:parameters (?v2 ?v11)
:precondition (and (pred_8 ?v2) (pred_1 ?v11) 
                  (pred_12 ?v2) (pred_2 ?v11 ?v2) (pred_9 ))
:effect (and (pred_6 ?v11)
   (not (pred_2 ?v11 ?v2)) (not (pred_9 ))))


(:action op_2
:parameters (?v2 ?v5 ?v4)
:precondition (and (pred_8 ?v2) (pred_1 ?v5) (pred_1 ?v4)
                  (pred_12 ?v2) (pred_6 ?v4) (pred_2 ?v5 ?v2))
:effect (and (pred_6 ?v5) (pred_2 ?v4 ?v2)
        (not (pred_6 ?v4)) (not (pred_2 ?v5 ?v2))))

(:action op_5
:parameters (?v2 ?v11)
:precondition (and (pred_8 ?v2) (pred_1 ?v11) 
                  (pred_12 ?v2) (pred_6 ?v11))
:effect (and (pred_9 ) (pred_2 ?v11 ?v2) (not (pred_6 ?v11)))))


	

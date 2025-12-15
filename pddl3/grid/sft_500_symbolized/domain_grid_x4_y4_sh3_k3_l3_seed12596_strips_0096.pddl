(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v4 ?v7)
             (pred_9 ?v6 ?v13)
             (pred_12 ?v4 ?v13)
             (pred_5 ?v9 ?v4 )
	     (pred_6 ?v4)
             (pred_4 ?v11)
             (pred_8 ?v6)
             (pred_11 ?v13)
             (pred_1 ?v4)
             (pred_10 ?v6)
             (pred_7 ?v4)
             (pred_3 ))



(:action op_1
:parameters (?v8 ?v2 ?v3 ?v12)
:precondition (and (pred_4 ?v8) (pred_4 ?v2) (pred_8 ?v3) (pred_11 ?v12)
          (pred_2 ?v8 ?v2) (pred_9 ?v3 ?v12)
                   (pred_12 ?v2 ?v12) (pred_6 ?v8) 
                   (pred_1 ?v2) (pred_10 ?v3))
:effect (and  (pred_7 ?v2) (not (pred_1 ?v2))))


(:action op_2
:parameters (?v8 ?v1)
:precondition (and (pred_4 ?v8) (pred_4 ?v1)
               (pred_6 ?v8) (pred_2 ?v8 ?v1) (pred_7 ?v1))
:effect (and (pred_6 ?v1) (not (pred_6 ?v8))))

(:action op_4
:parameters (?v8 ?v3)
:precondition (and (pred_4 ?v8) (pred_8 ?v3) 
                  (pred_6 ?v8) (pred_5 ?v3 ?v8) (pred_3 ))
:effect (and (pred_10 ?v3)
   (not (pred_5 ?v3 ?v8)) (not (pred_3 ))))


(:action op_5
:parameters (?v8 ?v10 ?v5)
:precondition (and (pred_4 ?v8) (pred_8 ?v10) (pred_8 ?v5)
                  (pred_6 ?v8) (pred_10 ?v5) (pred_5 ?v10 ?v8))
:effect (and (pred_10 ?v10) (pred_5 ?v5 ?v8)
        (not (pred_10 ?v5)) (not (pred_5 ?v10 ?v8))))

(:action op_3
:parameters (?v8 ?v3)
:precondition (and (pred_4 ?v8) (pred_8 ?v3) 
                  (pred_6 ?v8) (pred_10 ?v3))
:effect (and (pred_3 ) (pred_5 ?v3 ?v8) (not (pred_10 ?v3)))))


	

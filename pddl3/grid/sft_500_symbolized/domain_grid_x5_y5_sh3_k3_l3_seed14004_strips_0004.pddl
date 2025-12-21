(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v7 ?v5)
             (pred_1 ?v4 ?v13)
             (pred_10 ?v7 ?v13)
             (pred_11 ?v1 ?v7 )
	     (pred_4 ?v7)
             (pred_5 ?v11)
             (pred_12 ?v4)
             (pred_7 ?v13)
             (pred_2 ?v7)
             (pred_6 ?v4)
             (pred_3 ?v7)
             (pred_9 ))



(:action op_2
:parameters (?v8 ?v2 ?v6 ?v12)
:precondition (and (pred_5 ?v8) (pred_5 ?v2) (pred_12 ?v6) (pred_7 ?v12)
          (pred_8 ?v8 ?v2) (pred_1 ?v6 ?v12)
                   (pred_10 ?v2 ?v12) (pred_4 ?v8) 
                   (pred_2 ?v2) (pred_6 ?v6))
:effect (and  (pred_3 ?v2) (not (pred_2 ?v2))))


(:action op_1
:parameters (?v8 ?v9)
:precondition (and (pred_5 ?v8) (pred_5 ?v9)
               (pred_4 ?v8) (pred_8 ?v8 ?v9) (pred_3 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v8))))

(:action op_5
:parameters (?v8 ?v6)
:precondition (and (pred_5 ?v8) (pred_12 ?v6) 
                  (pred_4 ?v8) (pred_11 ?v6 ?v8) (pred_9 ))
:effect (and (pred_6 ?v6)
   (not (pred_11 ?v6 ?v8)) (not (pred_9 ))))


(:action op_3
:parameters (?v8 ?v10 ?v3)
:precondition (and (pred_5 ?v8) (pred_12 ?v10) (pred_12 ?v3)
                  (pred_4 ?v8) (pred_6 ?v3) (pred_11 ?v10 ?v8))
:effect (and (pred_6 ?v10) (pred_11 ?v3 ?v8)
        (not (pred_6 ?v3)) (not (pred_11 ?v10 ?v8))))

(:action op_4
:parameters (?v8 ?v6)
:precondition (and (pred_5 ?v8) (pred_12 ?v6) 
                  (pred_4 ?v8) (pred_6 ?v6))
:effect (and (pred_9 ) (pred_11 ?v6 ?v8) (not (pred_6 ?v6)))))


	

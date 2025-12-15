(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v2 ?v1)
             (pred_12 ?v13 ?v3)
             (pred_6 ?v2 ?v3)
             (pred_1 ?v5 ?v2 )
	     (pred_10 ?v2)
             (pred_2 ?v7)
             (pred_7 ?v13)
             (pred_4 ?v3)
             (pred_9 ?v2)
             (pred_3 ?v13)
             (pred_5 ?v2)
             (pred_11 ))



(:action op_1
:parameters (?v8 ?v4 ?v9 ?v10)
:precondition (and (pred_2 ?v8) (pred_2 ?v4) (pred_7 ?v9) (pred_4 ?v10)
          (pred_8 ?v8 ?v4) (pred_12 ?v9 ?v10)
                   (pred_6 ?v4 ?v10) (pred_10 ?v8) 
                   (pred_9 ?v4) (pred_3 ?v9))
:effect (and  (pred_5 ?v4) (not (pred_9 ?v4))))


(:action op_4
:parameters (?v8 ?v6)
:precondition (and (pred_2 ?v8) (pred_2 ?v6)
               (pred_10 ?v8) (pred_8 ?v8 ?v6) (pred_5 ?v6))
:effect (and (pred_10 ?v6) (not (pred_10 ?v8))))

(:action op_2
:parameters (?v8 ?v9)
:precondition (and (pred_2 ?v8) (pred_7 ?v9) 
                  (pred_10 ?v8) (pred_1 ?v9 ?v8) (pred_11 ))
:effect (and (pred_3 ?v9)
   (not (pred_1 ?v9 ?v8)) (not (pred_11 ))))


(:action op_5
:parameters (?v8 ?v11 ?v12)
:precondition (and (pred_2 ?v8) (pred_7 ?v11) (pred_7 ?v12)
                  (pred_10 ?v8) (pred_3 ?v12) (pred_1 ?v11 ?v8))
:effect (and (pred_3 ?v11) (pred_1 ?v12 ?v8)
        (not (pred_3 ?v12)) (not (pred_1 ?v11 ?v8))))

(:action op_3
:parameters (?v8 ?v9)
:precondition (and (pred_2 ?v8) (pred_7 ?v9) 
                  (pred_10 ?v8) (pred_3 ?v9))
:effect (and (pred_11 ) (pred_1 ?v9 ?v8) (not (pred_3 ?v9)))))


	

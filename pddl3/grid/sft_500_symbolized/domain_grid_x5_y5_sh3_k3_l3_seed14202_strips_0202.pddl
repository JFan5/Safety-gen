(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v9 ?v6)
             (pred_8 ?v3 ?v1)
             (pred_6 ?v9 ?v1)
             (pred_2 ?v12 ?v9 )
	     (pred_5 ?v9)
             (pred_7 ?v11)
             (pred_11 ?v3)
             (pred_9 ?v1)
             (pred_10 ?v9)
             (pred_1 ?v3)
             (pred_12 ?v9)
             (pred_3 ))



(:action op_2
:parameters (?v8 ?v4 ?v2 ?v7)
:precondition (and (pred_7 ?v8) (pred_7 ?v4) (pred_11 ?v2) (pred_9 ?v7)
          (pred_4 ?v8 ?v4) (pred_8 ?v2 ?v7)
                   (pred_6 ?v4 ?v7) (pred_5 ?v8) 
                   (pred_10 ?v4) (pred_1 ?v2))
:effect (and  (pred_12 ?v4) (not (pred_10 ?v4))))


(:action op_4
:parameters (?v8 ?v13)
:precondition (and (pred_7 ?v8) (pred_7 ?v13)
               (pred_5 ?v8) (pred_4 ?v8 ?v13) (pred_12 ?v13))
:effect (and (pred_5 ?v13) (not (pred_5 ?v8))))

(:action op_3
:parameters (?v8 ?v2)
:precondition (and (pred_7 ?v8) (pred_11 ?v2) 
                  (pred_5 ?v8) (pred_2 ?v2 ?v8) (pred_3 ))
:effect (and (pred_1 ?v2)
   (not (pred_2 ?v2 ?v8)) (not (pred_3 ))))


(:action op_5
:parameters (?v8 ?v5 ?v10)
:precondition (and (pred_7 ?v8) (pred_11 ?v5) (pred_11 ?v10)
                  (pred_5 ?v8) (pred_1 ?v10) (pred_2 ?v5 ?v8))
:effect (and (pred_1 ?v5) (pred_2 ?v10 ?v8)
        (not (pred_1 ?v10)) (not (pred_2 ?v5 ?v8))))

(:action op_1
:parameters (?v8 ?v2)
:precondition (and (pred_7 ?v8) (pred_11 ?v2) 
                  (pred_5 ?v8) (pred_1 ?v2))
:effect (and (pred_3 ) (pred_2 ?v2 ?v8) (not (pred_1 ?v2)))))


	

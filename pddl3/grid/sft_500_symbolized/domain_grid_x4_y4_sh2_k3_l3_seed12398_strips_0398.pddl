(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v13 ?v1)
             (pred_5 ?v2 ?v11)
             (pred_1 ?v13 ?v11)
             (pred_11 ?v9 ?v13 )
	     (pred_7 ?v13)
             (pred_3 ?v12)
             (pred_6 ?v2)
             (pred_12 ?v11)
             (pred_4 ?v13)
             (pred_8 ?v2)
             (pred_2 ?v13)
             (pred_10 ))



(:action op_4
:parameters (?v10 ?v4 ?v8 ?v7)
:precondition (and (pred_3 ?v10) (pred_3 ?v4) (pred_6 ?v8) (pred_12 ?v7)
          (pred_9 ?v10 ?v4) (pred_5 ?v8 ?v7)
                   (pred_1 ?v4 ?v7) (pred_7 ?v10) 
                   (pred_4 ?v4) (pred_8 ?v8))
:effect (and  (pred_2 ?v4) (not (pred_4 ?v4))))


(:action op_2
:parameters (?v10 ?v6)
:precondition (and (pred_3 ?v10) (pred_3 ?v6)
               (pred_7 ?v10) (pred_9 ?v10 ?v6) (pred_2 ?v6))
:effect (and (pred_7 ?v6) (not (pred_7 ?v10))))

(:action op_1
:parameters (?v10 ?v8)
:precondition (and (pred_3 ?v10) (pred_6 ?v8) 
                  (pred_7 ?v10) (pred_11 ?v8 ?v10) (pred_10 ))
:effect (and (pred_8 ?v8)
   (not (pred_11 ?v8 ?v10)) (not (pred_10 ))))


(:action op_3
:parameters (?v10 ?v3 ?v5)
:precondition (and (pred_3 ?v10) (pred_6 ?v3) (pred_6 ?v5)
                  (pred_7 ?v10) (pred_8 ?v5) (pred_11 ?v3 ?v10))
:effect (and (pred_8 ?v3) (pred_11 ?v5 ?v10)
        (not (pred_8 ?v5)) (not (pred_11 ?v3 ?v10))))

(:action op_5
:parameters (?v10 ?v8)
:precondition (and (pred_3 ?v10) (pred_6 ?v8) 
                  (pred_7 ?v10) (pred_8 ?v8))
:effect (and (pred_10 ) (pred_11 ?v8 ?v10) (not (pred_8 ?v8)))))


	

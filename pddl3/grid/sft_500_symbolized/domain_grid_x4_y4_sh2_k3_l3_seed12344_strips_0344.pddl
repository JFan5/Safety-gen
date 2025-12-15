(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v12 ?v7)
             (pred_1 ?v3 ?v2)
             (pred_9 ?v12 ?v2)
             (pred_11 ?v9 ?v12 )
	     (pred_8 ?v12)
             (pred_3 ?v1)
             (pred_4 ?v3)
             (pred_12 ?v2)
             (pred_5 ?v12)
             (pred_7 ?v3)
             (pred_6 ?v12)
             (pred_10 ))



(:action op_1
:parameters (?v8 ?v4 ?v13 ?v11)
:precondition (and (pred_3 ?v8) (pred_3 ?v4) (pred_4 ?v13) (pred_12 ?v11)
          (pred_2 ?v8 ?v4) (pred_1 ?v13 ?v11)
                   (pred_9 ?v4 ?v11) (pred_8 ?v8) 
                   (pred_5 ?v4) (pred_7 ?v13))
:effect (and  (pred_6 ?v4) (not (pred_5 ?v4))))


(:action op_5
:parameters (?v8 ?v5)
:precondition (and (pred_3 ?v8) (pred_3 ?v5)
               (pred_8 ?v8) (pred_2 ?v8 ?v5) (pred_6 ?v5))
:effect (and (pred_8 ?v5) (not (pred_8 ?v8))))

(:action op_3
:parameters (?v8 ?v13)
:precondition (and (pred_3 ?v8) (pred_4 ?v13) 
                  (pred_8 ?v8) (pred_11 ?v13 ?v8) (pred_10 ))
:effect (and (pred_7 ?v13)
   (not (pred_11 ?v13 ?v8)) (not (pred_10 ))))


(:action op_4
:parameters (?v8 ?v10 ?v6)
:precondition (and (pred_3 ?v8) (pred_4 ?v10) (pred_4 ?v6)
                  (pred_8 ?v8) (pred_7 ?v6) (pred_11 ?v10 ?v8))
:effect (and (pred_7 ?v10) (pred_11 ?v6 ?v8)
        (not (pred_7 ?v6)) (not (pred_11 ?v10 ?v8))))

(:action op_2
:parameters (?v8 ?v13)
:precondition (and (pred_3 ?v8) (pred_4 ?v13) 
                  (pred_8 ?v8) (pred_7 ?v13))
:effect (and (pred_10 ) (pred_11 ?v13 ?v8) (not (pred_7 ?v13)))))


	

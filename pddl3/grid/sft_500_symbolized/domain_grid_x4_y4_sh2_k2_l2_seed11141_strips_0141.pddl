(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v5 ?v6)
             (pred_9 ?v7 ?v1)
             (pred_1 ?v5 ?v1)
             (pred_7 ?v9 ?v5 )
	     (pred_3 ?v5)
             (pred_6 ?v11)
             (pred_4 ?v7)
             (pred_10 ?v1)
             (pred_5 ?v5)
             (pred_11 ?v7)
             (pred_8 ?v5)
             (pred_2 ))



(:action op_1
:parameters (?v8 ?v12 ?v10 ?v2)
:precondition (and (pred_6 ?v8) (pred_6 ?v12) (pred_4 ?v10) (pred_10 ?v2)
          (pred_12 ?v8 ?v12) (pred_9 ?v10 ?v2)
                   (pred_1 ?v12 ?v2) (pred_3 ?v8) 
                   (pred_5 ?v12) (pred_11 ?v10))
:effect (and  (pred_8 ?v12) (not (pred_5 ?v12))))


(:action op_5
:parameters (?v8 ?v13)
:precondition (and (pred_6 ?v8) (pred_6 ?v13)
               (pred_3 ?v8) (pred_12 ?v8 ?v13) (pred_8 ?v13))
:effect (and (pred_3 ?v13) (not (pred_3 ?v8))))

(:action op_3
:parameters (?v8 ?v10)
:precondition (and (pred_6 ?v8) (pred_4 ?v10) 
                  (pred_3 ?v8) (pred_7 ?v10 ?v8) (pred_2 ))
:effect (and (pred_11 ?v10)
   (not (pred_7 ?v10 ?v8)) (not (pred_2 ))))


(:action op_4
:parameters (?v8 ?v4 ?v3)
:precondition (and (pred_6 ?v8) (pred_4 ?v4) (pred_4 ?v3)
                  (pred_3 ?v8) (pred_11 ?v3) (pred_7 ?v4 ?v8))
:effect (and (pred_11 ?v4) (pred_7 ?v3 ?v8)
        (not (pred_11 ?v3)) (not (pred_7 ?v4 ?v8))))

(:action op_2
:parameters (?v8 ?v10)
:precondition (and (pred_6 ?v8) (pred_4 ?v10) 
                  (pred_3 ?v8) (pred_11 ?v10))
:effect (and (pred_2 ) (pred_7 ?v10 ?v8) (not (pred_11 ?v10)))))


	

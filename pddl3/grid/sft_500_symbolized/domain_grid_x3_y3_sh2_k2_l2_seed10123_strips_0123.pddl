(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v8 ?v13)
             (pred_12 ?v4 ?v7)
             (pred_9 ?v8 ?v7)
             (pred_2 ?v11 ?v8 )
	     (pred_8 ?v8)
             (pred_1 ?v1)
             (pred_11 ?v4)
             (pred_4 ?v7)
             (pred_3 ?v8)
             (pred_5 ?v4)
             (pred_7 ?v8)
             (pred_10 ))



(:action op_3
:parameters (?v12 ?v2 ?v10 ?v3)
:precondition (and (pred_1 ?v12) (pred_1 ?v2) (pred_11 ?v10) (pred_4 ?v3)
          (pred_6 ?v12 ?v2) (pred_12 ?v10 ?v3)
                   (pred_9 ?v2 ?v3) (pred_8 ?v12) 
                   (pred_3 ?v2) (pred_5 ?v10))
:effect (and  (pred_7 ?v2) (not (pred_3 ?v2))))


(:action op_4
:parameters (?v12 ?v5)
:precondition (and (pred_1 ?v12) (pred_1 ?v5)
               (pred_8 ?v12) (pred_6 ?v12 ?v5) (pred_7 ?v5))
:effect (and (pred_8 ?v5) (not (pred_8 ?v12))))

(:action op_1
:parameters (?v12 ?v10)
:precondition (and (pred_1 ?v12) (pred_11 ?v10) 
                  (pred_8 ?v12) (pred_2 ?v10 ?v12) (pred_10 ))
:effect (and (pred_5 ?v10)
   (not (pred_2 ?v10 ?v12)) (not (pred_10 ))))


(:action op_5
:parameters (?v12 ?v9 ?v6)
:precondition (and (pred_1 ?v12) (pred_11 ?v9) (pred_11 ?v6)
                  (pred_8 ?v12) (pred_5 ?v6) (pred_2 ?v9 ?v12))
:effect (and (pred_5 ?v9) (pred_2 ?v6 ?v12)
        (not (pred_5 ?v6)) (not (pred_2 ?v9 ?v12))))

(:action op_2
:parameters (?v12 ?v10)
:precondition (and (pred_1 ?v12) (pred_11 ?v10) 
                  (pred_8 ?v12) (pred_5 ?v10))
:effect (and (pred_10 ) (pred_2 ?v10 ?v12) (not (pred_5 ?v10)))))


	

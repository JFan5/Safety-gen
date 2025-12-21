(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v8 ?v7)
             (pred_6 ?v11 ?v9)
             (pred_2 ?v8 ?v9)
             (pred_7 ?v1 ?v8 )
	     (pred_8 ?v8)
             (pred_11 ?v13)
             (pred_10 ?v11)
             (pred_12 ?v9)
             (pred_4 ?v8)
             (pred_5 ?v11)
             (pred_1 ?v8)
             (pred_9 ))



(:action op_3
:parameters (?v12 ?v2 ?v6 ?v10)
:precondition (and (pred_11 ?v12) (pred_11 ?v2) (pred_10 ?v6) (pred_12 ?v10)
          (pred_3 ?v12 ?v2) (pred_6 ?v6 ?v10)
                   (pred_2 ?v2 ?v10) (pred_8 ?v12) 
                   (pred_4 ?v2) (pred_5 ?v6))
:effect (and  (pred_1 ?v2) (not (pred_4 ?v2))))


(:action op_2
:parameters (?v12 ?v5)
:precondition (and (pred_11 ?v12) (pred_11 ?v5)
               (pred_8 ?v12) (pred_3 ?v12 ?v5) (pred_1 ?v5))
:effect (and (pred_8 ?v5) (not (pred_8 ?v12))))

(:action op_1
:parameters (?v12 ?v6)
:precondition (and (pred_11 ?v12) (pred_10 ?v6) 
                  (pred_8 ?v12) (pred_7 ?v6 ?v12) (pred_9 ))
:effect (and (pred_5 ?v6)
   (not (pred_7 ?v6 ?v12)) (not (pred_9 ))))


(:action op_5
:parameters (?v12 ?v3 ?v4)
:precondition (and (pred_11 ?v12) (pred_10 ?v3) (pred_10 ?v4)
                  (pred_8 ?v12) (pred_5 ?v4) (pred_7 ?v3 ?v12))
:effect (and (pred_5 ?v3) (pred_7 ?v4 ?v12)
        (not (pred_5 ?v4)) (not (pred_7 ?v3 ?v12))))

(:action op_4
:parameters (?v12 ?v6)
:precondition (and (pred_11 ?v12) (pred_10 ?v6) 
                  (pred_8 ?v12) (pred_5 ?v6))
:effect (and (pred_9 ) (pred_7 ?v6 ?v12) (not (pred_5 ?v6)))))


	

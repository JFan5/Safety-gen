(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v5 ?v6)
             (pred_10 ?v11 ?v4)
             (pred_2 ?v5 ?v4)
             (pred_7 ?v9 ?v5 )
	     (pred_12 ?v5)
             (pred_11 ?v1)
             (pred_1 ?v11)
             (pred_5 ?v4)
             (pred_6 ?v5)
             (pred_4 ?v11)
             (pred_3 ?v5)
             (pred_9 ))



(:action op_5
:parameters (?v12 ?v2 ?v7 ?v13)
:precondition (and (pred_11 ?v12) (pred_11 ?v2) (pred_1 ?v7) (pred_5 ?v13)
          (pred_8 ?v12 ?v2) (pred_10 ?v7 ?v13)
                   (pred_2 ?v2 ?v13) (pred_12 ?v12) 
                   (pred_6 ?v2) (pred_4 ?v7))
:effect (and  (pred_3 ?v2) (not (pred_6 ?v2))))


(:action op_2
:parameters (?v12 ?v3)
:precondition (and (pred_11 ?v12) (pred_11 ?v3)
               (pred_12 ?v12) (pred_8 ?v12 ?v3) (pred_3 ?v3))
:effect (and (pred_12 ?v3) (not (pred_12 ?v12))))

(:action op_1
:parameters (?v12 ?v7)
:precondition (and (pred_11 ?v12) (pred_1 ?v7) 
                  (pred_12 ?v12) (pred_7 ?v7 ?v12) (pred_9 ))
:effect (and (pred_4 ?v7)
   (not (pred_7 ?v7 ?v12)) (not (pred_9 ))))


(:action op_3
:parameters (?v12 ?v10 ?v8)
:precondition (and (pred_11 ?v12) (pred_1 ?v10) (pred_1 ?v8)
                  (pred_12 ?v12) (pred_4 ?v8) (pred_7 ?v10 ?v12))
:effect (and (pred_4 ?v10) (pred_7 ?v8 ?v12)
        (not (pred_4 ?v8)) (not (pred_7 ?v10 ?v12))))

(:action op_4
:parameters (?v12 ?v7)
:precondition (and (pred_11 ?v12) (pred_1 ?v7) 
                  (pred_12 ?v12) (pred_4 ?v7))
:effect (and (pred_9 ) (pred_7 ?v7 ?v12) (not (pred_4 ?v7)))))


	

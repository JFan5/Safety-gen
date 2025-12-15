(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v11 ?v7)
             (pred_3 ?v3 ?v1)
             (pred_2 ?v11 ?v1)
             (pred_1 ?v6 ?v11 )
	     (pred_11 ?v11)
             (pred_7 ?v5)
             (pred_5 ?v3)
             (pred_12 ?v1)
             (pred_4 ?v11)
             (pred_10 ?v3)
             (pred_6 ?v11)
             (pred_8 ))



(:action op_4
:parameters (?v12 ?v4 ?v9 ?v13)
:precondition (and (pred_7 ?v12) (pred_7 ?v4) (pred_5 ?v9) (pred_12 ?v13)
          (pred_9 ?v12 ?v4) (pred_3 ?v9 ?v13)
                   (pred_2 ?v4 ?v13) (pred_11 ?v12) 
                   (pred_4 ?v4) (pred_10 ?v9))
:effect (and  (pred_6 ?v4) (not (pred_4 ?v4))))


(:action op_2
:parameters (?v12 ?v2)
:precondition (and (pred_7 ?v12) (pred_7 ?v2)
               (pred_11 ?v12) (pred_9 ?v12 ?v2) (pred_6 ?v2))
:effect (and (pred_11 ?v2) (not (pred_11 ?v12))))

(:action op_1
:parameters (?v12 ?v9)
:precondition (and (pred_7 ?v12) (pred_5 ?v9) 
                  (pred_11 ?v12) (pred_1 ?v9 ?v12) (pred_8 ))
:effect (and (pred_10 ?v9)
   (not (pred_1 ?v9 ?v12)) (not (pred_8 ))))


(:action op_5
:parameters (?v12 ?v10 ?v8)
:precondition (and (pred_7 ?v12) (pred_5 ?v10) (pred_5 ?v8)
                  (pred_11 ?v12) (pred_10 ?v8) (pred_1 ?v10 ?v12))
:effect (and (pred_10 ?v10) (pred_1 ?v8 ?v12)
        (not (pred_10 ?v8)) (not (pred_1 ?v10 ?v12))))

(:action op_3
:parameters (?v12 ?v9)
:precondition (and (pred_7 ?v12) (pred_5 ?v9) 
                  (pred_11 ?v12) (pred_10 ?v9))
:effect (and (pred_8 ) (pred_1 ?v9 ?v12) (not (pred_10 ?v9)))))


	

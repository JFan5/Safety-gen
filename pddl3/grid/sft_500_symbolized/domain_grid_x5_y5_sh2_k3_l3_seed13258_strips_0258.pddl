(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v1 ?v6)
             (pred_1 ?v5 ?v11)
             (pred_12 ?v1 ?v11)
             (pred_10 ?v8 ?v1 )
	     (pred_8 ?v1)
             (pred_6 ?v7)
             (pred_9 ?v5)
             (pred_4 ?v11)
             (pred_2 ?v1)
             (pred_7 ?v5)
             (pred_5 ?v1)
             (pred_11 ))



(:action op_4
:parameters (?v12 ?v2 ?v10 ?v4)
:precondition (and (pred_6 ?v12) (pred_6 ?v2) (pred_9 ?v10) (pred_4 ?v4)
          (pred_3 ?v12 ?v2) (pred_1 ?v10 ?v4)
                   (pred_12 ?v2 ?v4) (pred_8 ?v12) 
                   (pred_2 ?v2) (pred_7 ?v10))
:effect (and  (pred_5 ?v2) (not (pred_2 ?v2))))


(:action op_1
:parameters (?v12 ?v3)
:precondition (and (pred_6 ?v12) (pred_6 ?v3)
               (pred_8 ?v12) (pred_3 ?v12 ?v3) (pred_5 ?v3))
:effect (and (pred_8 ?v3) (not (pred_8 ?v12))))

(:action op_2
:parameters (?v12 ?v10)
:precondition (and (pred_6 ?v12) (pred_9 ?v10) 
                  (pred_8 ?v12) (pred_10 ?v10 ?v12) (pred_11 ))
:effect (and (pred_7 ?v10)
   (not (pred_10 ?v10 ?v12)) (not (pred_11 ))))


(:action op_5
:parameters (?v12 ?v13 ?v9)
:precondition (and (pred_6 ?v12) (pred_9 ?v13) (pred_9 ?v9)
                  (pred_8 ?v12) (pred_7 ?v9) (pred_10 ?v13 ?v12))
:effect (and (pred_7 ?v13) (pred_10 ?v9 ?v12)
        (not (pred_7 ?v9)) (not (pred_10 ?v13 ?v12))))

(:action op_3
:parameters (?v12 ?v10)
:precondition (and (pred_6 ?v12) (pred_9 ?v10) 
                  (pred_8 ?v12) (pred_7 ?v10))
:effect (and (pred_11 ) (pred_10 ?v10 ?v12) (not (pred_7 ?v10)))))


	

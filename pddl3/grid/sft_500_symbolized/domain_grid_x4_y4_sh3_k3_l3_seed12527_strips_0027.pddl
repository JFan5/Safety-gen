(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v13 ?v6)
             (pred_9 ?v8 ?v5)
             (pred_1 ?v13 ?v5)
             (pred_6 ?v3 ?v13 )
	     (pred_7 ?v13)
             (pred_12 ?v11)
             (pred_11 ?v8)
             (pred_10 ?v5)
             (pred_2 ?v13)
             (pred_4 ?v8)
             (pred_5 ?v13)
             (pred_8 ))



(:action op_5
:parameters (?v12 ?v1 ?v10 ?v4)
:precondition (and (pred_12 ?v12) (pred_12 ?v1) (pred_11 ?v10) (pred_10 ?v4)
          (pred_3 ?v12 ?v1) (pred_9 ?v10 ?v4)
                   (pred_1 ?v1 ?v4) (pred_7 ?v12) 
                   (pred_2 ?v1) (pred_4 ?v10))
:effect (and  (pred_5 ?v1) (not (pred_2 ?v1))))


(:action op_1
:parameters (?v12 ?v9)
:precondition (and (pred_12 ?v12) (pred_12 ?v9)
               (pred_7 ?v12) (pred_3 ?v12 ?v9) (pred_5 ?v9))
:effect (and (pred_7 ?v9) (not (pred_7 ?v12))))

(:action op_4
:parameters (?v12 ?v10)
:precondition (and (pred_12 ?v12) (pred_11 ?v10) 
                  (pred_7 ?v12) (pred_6 ?v10 ?v12) (pred_8 ))
:effect (and (pred_4 ?v10)
   (not (pred_6 ?v10 ?v12)) (not (pred_8 ))))


(:action op_2
:parameters (?v12 ?v7 ?v2)
:precondition (and (pred_12 ?v12) (pred_11 ?v7) (pred_11 ?v2)
                  (pred_7 ?v12) (pred_4 ?v2) (pred_6 ?v7 ?v12))
:effect (and (pred_4 ?v7) (pred_6 ?v2 ?v12)
        (not (pred_4 ?v2)) (not (pred_6 ?v7 ?v12))))

(:action op_3
:parameters (?v12 ?v10)
:precondition (and (pred_12 ?v12) (pred_11 ?v10) 
                  (pred_7 ?v12) (pred_4 ?v10))
:effect (and (pred_8 ) (pred_6 ?v10 ?v12) (not (pred_4 ?v10)))))


	

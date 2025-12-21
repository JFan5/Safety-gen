(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v7 ?v2)
             (pred_4 ?v9 ?v4)
             (pred_2 ?v7 ?v4)
             (pred_6 ?v13 ?v7 )
	     (pred_10 ?v7)
             (pred_7 ?v11)
             (pred_11 ?v9)
             (pred_5 ?v4)
             (pred_1 ?v7)
             (pred_12 ?v9)
             (pred_9 ?v7)
             (pred_3 ))



(:action op_5
:parameters (?v12 ?v5 ?v10 ?v1)
:precondition (and (pred_7 ?v12) (pred_7 ?v5) (pred_11 ?v10) (pred_5 ?v1)
          (pred_8 ?v12 ?v5) (pred_4 ?v10 ?v1)
                   (pred_2 ?v5 ?v1) (pred_10 ?v12) 
                   (pred_1 ?v5) (pred_12 ?v10))
:effect (and  (pred_9 ?v5) (not (pred_1 ?v5))))


(:action op_3
:parameters (?v12 ?v8)
:precondition (and (pred_7 ?v12) (pred_7 ?v8)
               (pred_10 ?v12) (pred_8 ?v12 ?v8) (pred_9 ?v8))
:effect (and (pred_10 ?v8) (not (pred_10 ?v12))))

(:action op_2
:parameters (?v12 ?v10)
:precondition (and (pred_7 ?v12) (pred_11 ?v10) 
                  (pred_10 ?v12) (pred_6 ?v10 ?v12) (pred_3 ))
:effect (and (pred_12 ?v10)
   (not (pred_6 ?v10 ?v12)) (not (pred_3 ))))


(:action op_4
:parameters (?v12 ?v6 ?v3)
:precondition (and (pred_7 ?v12) (pred_11 ?v6) (pred_11 ?v3)
                  (pred_10 ?v12) (pred_12 ?v3) (pred_6 ?v6 ?v12))
:effect (and (pred_12 ?v6) (pred_6 ?v3 ?v12)
        (not (pred_12 ?v3)) (not (pred_6 ?v6 ?v12))))

(:action op_1
:parameters (?v12 ?v10)
:precondition (and (pred_7 ?v12) (pred_11 ?v10) 
                  (pred_10 ?v12) (pred_12 ?v10))
:effect (and (pred_3 ) (pred_6 ?v10 ?v12) (not (pred_12 ?v10)))))


	

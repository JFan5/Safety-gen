(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v10 ?v11)
             (pred_3 ?v2 ?v3)
             (pred_9 ?v10 ?v3)
             (pred_2 ?v13 ?v10 )
	     (pred_10 ?v10)
             (pred_12 ?v5)
             (pred_7 ?v2)
             (pred_11 ?v3)
             (pred_8 ?v10)
             (pred_6 ?v2)
             (pred_5 ?v10)
             (pred_1 ))



(:action op_5
:parameters (?v12 ?v4 ?v1 ?v7)
:precondition (and (pred_12 ?v12) (pred_12 ?v4) (pred_7 ?v1) (pred_11 ?v7)
          (pred_4 ?v12 ?v4) (pred_3 ?v1 ?v7)
                   (pred_9 ?v4 ?v7) (pred_10 ?v12) 
                   (pred_8 ?v4) (pred_6 ?v1))
:effect (and  (pred_5 ?v4) (not (pred_8 ?v4))))


(:action op_2
:parameters (?v12 ?v9)
:precondition (and (pred_12 ?v12) (pred_12 ?v9)
               (pred_10 ?v12) (pred_4 ?v12 ?v9) (pred_5 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v12))))

(:action op_3
:parameters (?v12 ?v1)
:precondition (and (pred_12 ?v12) (pred_7 ?v1) 
                  (pred_10 ?v12) (pred_2 ?v1 ?v12) (pred_1 ))
:effect (and (pred_6 ?v1)
   (not (pred_2 ?v1 ?v12)) (not (pred_1 ))))


(:action op_4
:parameters (?v12 ?v6 ?v8)
:precondition (and (pred_12 ?v12) (pred_7 ?v6) (pred_7 ?v8)
                  (pred_10 ?v12) (pred_6 ?v8) (pred_2 ?v6 ?v12))
:effect (and (pred_6 ?v6) (pred_2 ?v8 ?v12)
        (not (pred_6 ?v8)) (not (pred_2 ?v6 ?v12))))

(:action op_1
:parameters (?v12 ?v1)
:precondition (and (pred_12 ?v12) (pred_7 ?v1) 
                  (pred_10 ?v12) (pred_6 ?v1))
:effect (and (pred_1 ) (pred_2 ?v1 ?v12) (not (pred_6 ?v1)))))


	

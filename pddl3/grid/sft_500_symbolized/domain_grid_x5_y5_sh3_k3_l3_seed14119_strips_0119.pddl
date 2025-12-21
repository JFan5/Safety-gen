(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v13 ?v2)
             (pred_3 ?v3 ?v1)
             (pred_12 ?v13 ?v1)
             (pred_1 ?v11 ?v13 )
	     (pred_10 ?v13)
             (pred_8 ?v10)
             (pred_2 ?v3)
             (pred_11 ?v1)
             (pred_5 ?v13)
             (pred_9 ?v3)
             (pred_4 ?v13)
             (pred_6 ))



(:action op_4
:parameters (?v12 ?v4 ?v7 ?v5)
:precondition (and (pred_8 ?v12) (pred_8 ?v4) (pred_2 ?v7) (pred_11 ?v5)
          (pred_7 ?v12 ?v4) (pred_3 ?v7 ?v5)
                   (pred_12 ?v4 ?v5) (pred_10 ?v12) 
                   (pred_5 ?v4) (pred_9 ?v7))
:effect (and  (pred_4 ?v4) (not (pred_5 ?v4))))


(:action op_3
:parameters (?v12 ?v9)
:precondition (and (pred_8 ?v12) (pred_8 ?v9)
               (pred_10 ?v12) (pred_7 ?v12 ?v9) (pred_4 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v12))))

(:action op_5
:parameters (?v12 ?v7)
:precondition (and (pred_8 ?v12) (pred_2 ?v7) 
                  (pred_10 ?v12) (pred_1 ?v7 ?v12) (pred_6 ))
:effect (and (pred_9 ?v7)
   (not (pred_1 ?v7 ?v12)) (not (pred_6 ))))


(:action op_1
:parameters (?v12 ?v8 ?v6)
:precondition (and (pred_8 ?v12) (pred_2 ?v8) (pred_2 ?v6)
                  (pred_10 ?v12) (pred_9 ?v6) (pred_1 ?v8 ?v12))
:effect (and (pred_9 ?v8) (pred_1 ?v6 ?v12)
        (not (pred_9 ?v6)) (not (pred_1 ?v8 ?v12))))

(:action op_2
:parameters (?v12 ?v7)
:precondition (and (pred_8 ?v12) (pred_2 ?v7) 
                  (pred_10 ?v12) (pred_9 ?v7))
:effect (and (pred_6 ) (pred_1 ?v7 ?v12) (not (pred_9 ?v7)))))


	

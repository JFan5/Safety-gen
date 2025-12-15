(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v10)
             (pred_3 ?v1 ?v5)
             (pred_12 ?v4 ?v5)
             (pred_5 ?v6 ?v4 )
	     (pred_1 ?v4)
             (pred_2 ?v13)
             (pred_6 ?v1)
             (pred_7 ?v5)
             (pred_4 ?v4)
             (pred_9 ?v1)
             (pred_8 ?v4)
             (pred_11 ))



(:action op_5
:parameters (?v12 ?v2 ?v7 ?v3)
:precondition (and (pred_2 ?v12) (pred_2 ?v2) (pred_6 ?v7) (pred_7 ?v3)
          (pred_10 ?v12 ?v2) (pred_3 ?v7 ?v3)
                   (pred_12 ?v2 ?v3) (pred_1 ?v12) 
                   (pred_4 ?v2) (pred_9 ?v7))
:effect (and  (pred_8 ?v2) (not (pred_4 ?v2))))


(:action op_3
:parameters (?v12 ?v8)
:precondition (and (pred_2 ?v12) (pred_2 ?v8)
               (pred_1 ?v12) (pred_10 ?v12 ?v8) (pred_8 ?v8))
:effect (and (pred_1 ?v8) (not (pred_1 ?v12))))

(:action op_1
:parameters (?v12 ?v7)
:precondition (and (pred_2 ?v12) (pred_6 ?v7) 
                  (pred_1 ?v12) (pred_5 ?v7 ?v12) (pred_11 ))
:effect (and (pred_9 ?v7)
   (not (pred_5 ?v7 ?v12)) (not (pred_11 ))))


(:action op_4
:parameters (?v12 ?v9 ?v11)
:precondition (and (pred_2 ?v12) (pred_6 ?v9) (pred_6 ?v11)
                  (pred_1 ?v12) (pred_9 ?v11) (pred_5 ?v9 ?v12))
:effect (and (pred_9 ?v9) (pred_5 ?v11 ?v12)
        (not (pred_9 ?v11)) (not (pred_5 ?v9 ?v12))))

(:action op_2
:parameters (?v12 ?v7)
:precondition (and (pred_2 ?v12) (pred_6 ?v7) 
                  (pred_1 ?v12) (pred_9 ?v7))
:effect (and (pred_11 ) (pred_5 ?v7 ?v12) (not (pred_9 ?v7)))))


	

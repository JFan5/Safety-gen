(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v13 ?v3)
             (pred_7 ?v1 ?v12)
             (pred_6 ?v13 ?v12)
             (pred_2 ?v10 ?v13 )
	     (pred_1 ?v13)
             (pred_10 ?v6)
             (pred_5 ?v1)
             (pred_9 ?v12)
             (pred_11 ?v13)
             (pred_12 ?v1)
             (pred_3 ?v13)
             (pred_4 ))



(:action op_5
:parameters (?v5 ?v8 ?v9 ?v11)
:precondition (and (pred_10 ?v5) (pred_10 ?v8) (pred_5 ?v9) (pred_9 ?v11)
          (pred_8 ?v5 ?v8) (pred_7 ?v9 ?v11)
                   (pred_6 ?v8 ?v11) (pred_1 ?v5) 
                   (pred_11 ?v8) (pred_12 ?v9))
:effect (and  (pred_3 ?v8) (not (pred_11 ?v8))))


(:action op_1
:parameters (?v5 ?v2)
:precondition (and (pred_10 ?v5) (pred_10 ?v2)
               (pred_1 ?v5) (pred_8 ?v5 ?v2) (pred_3 ?v2))
:effect (and (pred_1 ?v2) (not (pred_1 ?v5))))

(:action op_4
:parameters (?v5 ?v9)
:precondition (and (pred_10 ?v5) (pred_5 ?v9) 
                  (pred_1 ?v5) (pred_2 ?v9 ?v5) (pred_4 ))
:effect (and (pred_12 ?v9)
   (not (pred_2 ?v9 ?v5)) (not (pred_4 ))))


(:action op_3
:parameters (?v5 ?v4 ?v7)
:precondition (and (pred_10 ?v5) (pred_5 ?v4) (pred_5 ?v7)
                  (pred_1 ?v5) (pred_12 ?v7) (pred_2 ?v4 ?v5))
:effect (and (pred_12 ?v4) (pred_2 ?v7 ?v5)
        (not (pred_12 ?v7)) (not (pred_2 ?v4 ?v5))))

(:action op_2
:parameters (?v5 ?v9)
:precondition (and (pred_10 ?v5) (pred_5 ?v9) 
                  (pred_1 ?v5) (pred_12 ?v9))
:effect (and (pred_4 ) (pred_2 ?v9 ?v5) (not (pred_12 ?v9)))))


	

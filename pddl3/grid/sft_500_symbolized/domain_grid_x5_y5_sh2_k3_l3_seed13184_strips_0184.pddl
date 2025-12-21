(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v9 ?v11)
             (pred_10 ?v6 ?v13)
             (pred_7 ?v9 ?v13)
             (pred_3 ?v10 ?v9 )
	     (pred_8 ?v9)
             (pred_5 ?v3)
             (pred_11 ?v6)
             (pred_4 ?v13)
             (pred_2 ?v9)
             (pred_12 ?v6)
             (pred_6 ?v9)
             (pred_1 ))



(:action op_1
:parameters (?v5 ?v8 ?v7 ?v1)
:precondition (and (pred_5 ?v5) (pred_5 ?v8) (pred_11 ?v7) (pred_4 ?v1)
          (pred_9 ?v5 ?v8) (pred_10 ?v7 ?v1)
                   (pred_7 ?v8 ?v1) (pred_8 ?v5) 
                   (pred_2 ?v8) (pred_12 ?v7))
:effect (and  (pred_6 ?v8) (not (pred_2 ?v8))))


(:action op_5
:parameters (?v5 ?v2)
:precondition (and (pred_5 ?v5) (pred_5 ?v2)
               (pred_8 ?v5) (pred_9 ?v5 ?v2) (pred_6 ?v2))
:effect (and (pred_8 ?v2) (not (pred_8 ?v5))))

(:action op_4
:parameters (?v5 ?v7)
:precondition (and (pred_5 ?v5) (pred_11 ?v7) 
                  (pred_8 ?v5) (pred_3 ?v7 ?v5) (pred_1 ))
:effect (and (pred_12 ?v7)
   (not (pred_3 ?v7 ?v5)) (not (pred_1 ))))


(:action op_2
:parameters (?v5 ?v12 ?v4)
:precondition (and (pred_5 ?v5) (pred_11 ?v12) (pred_11 ?v4)
                  (pred_8 ?v5) (pred_12 ?v4) (pred_3 ?v12 ?v5))
:effect (and (pred_12 ?v12) (pred_3 ?v4 ?v5)
        (not (pred_12 ?v4)) (not (pred_3 ?v12 ?v5))))

(:action op_3
:parameters (?v5 ?v7)
:precondition (and (pred_5 ?v5) (pred_11 ?v7) 
                  (pred_8 ?v5) (pred_12 ?v7))
:effect (and (pred_1 ) (pred_3 ?v7 ?v5) (not (pred_12 ?v7)))))


	

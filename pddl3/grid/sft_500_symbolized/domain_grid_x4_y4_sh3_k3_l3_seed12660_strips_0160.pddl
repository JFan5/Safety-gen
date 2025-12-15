(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v4 ?v2)
             (pred_7 ?v9 ?v1)
             (pred_1 ?v4 ?v1)
             (pred_9 ?v11 ?v4 )
	     (pred_3 ?v4)
             (pred_5 ?v6)
             (pred_10 ?v9)
             (pred_6 ?v1)
             (pred_8 ?v4)
             (pred_2 ?v9)
             (pred_4 ?v4)
             (pred_11 ))



(:action op_2
:parameters (?v8 ?v7 ?v5 ?v13)
:precondition (and (pred_5 ?v8) (pred_5 ?v7) (pred_10 ?v5) (pred_6 ?v13)
          (pred_12 ?v8 ?v7) (pred_7 ?v5 ?v13)
                   (pred_1 ?v7 ?v13) (pred_3 ?v8) 
                   (pred_8 ?v7) (pred_2 ?v5))
:effect (and  (pred_4 ?v7) (not (pred_8 ?v7))))


(:action op_3
:parameters (?v8 ?v3)
:precondition (and (pred_5 ?v8) (pred_5 ?v3)
               (pred_3 ?v8) (pred_12 ?v8 ?v3) (pred_4 ?v3))
:effect (and (pred_3 ?v3) (not (pred_3 ?v8))))

(:action op_4
:parameters (?v8 ?v5)
:precondition (and (pred_5 ?v8) (pred_10 ?v5) 
                  (pred_3 ?v8) (pred_9 ?v5 ?v8) (pred_11 ))
:effect (and (pred_2 ?v5)
   (not (pred_9 ?v5 ?v8)) (not (pred_11 ))))


(:action op_1
:parameters (?v8 ?v10 ?v12)
:precondition (and (pred_5 ?v8) (pred_10 ?v10) (pred_10 ?v12)
                  (pred_3 ?v8) (pred_2 ?v12) (pred_9 ?v10 ?v8))
:effect (and (pred_2 ?v10) (pred_9 ?v12 ?v8)
        (not (pred_2 ?v12)) (not (pred_9 ?v10 ?v8))))

(:action op_5
:parameters (?v8 ?v5)
:precondition (and (pred_5 ?v8) (pred_10 ?v5) 
                  (pred_3 ?v8) (pred_2 ?v5))
:effect (and (pred_11 ) (pred_9 ?v5 ?v8) (not (pred_2 ?v5)))))


	

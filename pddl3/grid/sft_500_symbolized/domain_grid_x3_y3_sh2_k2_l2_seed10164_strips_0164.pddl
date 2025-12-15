(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v10 ?v2)
             (pred_10 ?v6 ?v13)
             (pred_1 ?v10 ?v13)
             (pred_6 ?v11 ?v10 )
	     (pred_9 ?v10)
             (pred_3 ?v9)
             (pred_4 ?v6)
             (pred_7 ?v13)
             (pred_11 ?v10)
             (pred_5 ?v6)
             (pred_2 ?v10)
             (pred_12 ))



(:action op_5
:parameters (?v8 ?v7 ?v12 ?v1)
:precondition (and (pred_3 ?v8) (pred_3 ?v7) (pred_4 ?v12) (pred_7 ?v1)
          (pred_8 ?v8 ?v7) (pred_10 ?v12 ?v1)
                   (pred_1 ?v7 ?v1) (pred_9 ?v8) 
                   (pred_11 ?v7) (pred_5 ?v12))
:effect (and  (pred_2 ?v7) (not (pred_11 ?v7))))


(:action op_1
:parameters (?v8 ?v5)
:precondition (and (pred_3 ?v8) (pred_3 ?v5)
               (pred_9 ?v8) (pred_8 ?v8 ?v5) (pred_2 ?v5))
:effect (and (pred_9 ?v5) (not (pred_9 ?v8))))

(:action op_2
:parameters (?v8 ?v12)
:precondition (and (pred_3 ?v8) (pred_4 ?v12) 
                  (pred_9 ?v8) (pred_6 ?v12 ?v8) (pred_12 ))
:effect (and (pred_5 ?v12)
   (not (pred_6 ?v12 ?v8)) (not (pred_12 ))))


(:action op_4
:parameters (?v8 ?v4 ?v3)
:precondition (and (pred_3 ?v8) (pred_4 ?v4) (pred_4 ?v3)
                  (pred_9 ?v8) (pred_5 ?v3) (pred_6 ?v4 ?v8))
:effect (and (pred_5 ?v4) (pred_6 ?v3 ?v8)
        (not (pred_5 ?v3)) (not (pred_6 ?v4 ?v8))))

(:action op_3
:parameters (?v8 ?v12)
:precondition (and (pred_3 ?v8) (pred_4 ?v12) 
                  (pred_9 ?v8) (pred_5 ?v12))
:effect (and (pred_12 ) (pred_6 ?v12 ?v8) (not (pred_5 ?v12)))))


	

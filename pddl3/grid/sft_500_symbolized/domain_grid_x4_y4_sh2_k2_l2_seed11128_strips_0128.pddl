(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v11 ?v1)
             (pred_1 ?v4 ?v6)
             (pred_11 ?v11 ?v6)
             (pred_6 ?v2 ?v11 )
	     (pred_2 ?v11)
             (pred_12 ?v9)
             (pred_5 ?v4)
             (pred_4 ?v6)
             (pred_9 ?v11)
             (pred_7 ?v4)
             (pred_3 ?v11)
             (pred_8 ))



(:action op_3
:parameters (?v8 ?v5 ?v10 ?v3)
:precondition (and (pred_12 ?v8) (pred_12 ?v5) (pred_5 ?v10) (pred_4 ?v3)
          (pred_10 ?v8 ?v5) (pred_1 ?v10 ?v3)
                   (pred_11 ?v5 ?v3) (pred_2 ?v8) 
                   (pred_9 ?v5) (pred_7 ?v10))
:effect (and  (pred_3 ?v5) (not (pred_9 ?v5))))


(:action op_5
:parameters (?v8 ?v13)
:precondition (and (pred_12 ?v8) (pred_12 ?v13)
               (pred_2 ?v8) (pred_10 ?v8 ?v13) (pred_3 ?v13))
:effect (and (pred_2 ?v13) (not (pred_2 ?v8))))

(:action op_4
:parameters (?v8 ?v10)
:precondition (and (pred_12 ?v8) (pred_5 ?v10) 
                  (pred_2 ?v8) (pred_6 ?v10 ?v8) (pred_8 ))
:effect (and (pred_7 ?v10)
   (not (pred_6 ?v10 ?v8)) (not (pred_8 ))))


(:action op_1
:parameters (?v8 ?v7 ?v12)
:precondition (and (pred_12 ?v8) (pred_5 ?v7) (pred_5 ?v12)
                  (pred_2 ?v8) (pred_7 ?v12) (pred_6 ?v7 ?v8))
:effect (and (pred_7 ?v7) (pred_6 ?v12 ?v8)
        (not (pred_7 ?v12)) (not (pred_6 ?v7 ?v8))))

(:action op_2
:parameters (?v8 ?v10)
:precondition (and (pred_12 ?v8) (pred_5 ?v10) 
                  (pred_2 ?v8) (pred_7 ?v10))
:effect (and (pred_8 ) (pred_6 ?v10 ?v8) (not (pred_7 ?v10)))))


	

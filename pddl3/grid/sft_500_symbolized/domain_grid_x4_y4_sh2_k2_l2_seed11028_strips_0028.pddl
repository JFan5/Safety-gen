(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v13 ?v11)
             (pred_9 ?v9 ?v1)
             (pred_6 ?v13 ?v1)
             (pred_1 ?v7 ?v13 )
	     (pred_8 ?v13)
             (pred_4 ?v4)
             (pred_10 ?v9)
             (pred_7 ?v1)
             (pred_3 ?v13)
             (pred_11 ?v9)
             (pred_2 ?v13)
             (pred_5 ))



(:action op_4
:parameters (?v8 ?v5 ?v10 ?v2)
:precondition (and (pred_4 ?v8) (pred_4 ?v5) (pred_10 ?v10) (pred_7 ?v2)
          (pred_12 ?v8 ?v5) (pred_9 ?v10 ?v2)
                   (pred_6 ?v5 ?v2) (pred_8 ?v8) 
                   (pred_3 ?v5) (pred_11 ?v10))
:effect (and  (pred_2 ?v5) (not (pred_3 ?v5))))


(:action op_1
:parameters (?v8 ?v12)
:precondition (and (pred_4 ?v8) (pred_4 ?v12)
               (pred_8 ?v8) (pred_12 ?v8 ?v12) (pred_2 ?v12))
:effect (and (pred_8 ?v12) (not (pred_8 ?v8))))

(:action op_3
:parameters (?v8 ?v10)
:precondition (and (pred_4 ?v8) (pred_10 ?v10) 
                  (pred_8 ?v8) (pred_1 ?v10 ?v8) (pred_5 ))
:effect (and (pred_11 ?v10)
   (not (pred_1 ?v10 ?v8)) (not (pred_5 ))))


(:action op_2
:parameters (?v8 ?v3 ?v6)
:precondition (and (pred_4 ?v8) (pred_10 ?v3) (pred_10 ?v6)
                  (pred_8 ?v8) (pred_11 ?v6) (pred_1 ?v3 ?v8))
:effect (and (pred_11 ?v3) (pred_1 ?v6 ?v8)
        (not (pred_11 ?v6)) (not (pred_1 ?v3 ?v8))))

(:action op_5
:parameters (?v8 ?v10)
:precondition (and (pred_4 ?v8) (pred_10 ?v10) 
                  (pred_8 ?v8) (pred_11 ?v10))
:effect (and (pred_5 ) (pred_1 ?v10 ?v8) (not (pred_11 ?v10)))))


	

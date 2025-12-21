(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v3 ?v2)
             (pred_3 ?v6 ?v10)
             (pred_6 ?v3 ?v10)
             (pred_11 ?v11 ?v3 )
	     (pred_8 ?v3)
             (pred_12 ?v4)
             (pred_10 ?v6)
             (pred_7 ?v10)
             (pred_4 ?v3)
             (pred_1 ?v6)
             (pred_9 ?v3)
             (pred_2 ))



(:action op_5
:parameters (?v8 ?v13 ?v5 ?v1)
:precondition (and (pred_12 ?v8) (pred_12 ?v13) (pred_10 ?v5) (pred_7 ?v1)
          (pred_5 ?v8 ?v13) (pred_3 ?v5 ?v1)
                   (pred_6 ?v13 ?v1) (pred_8 ?v8) 
                   (pred_4 ?v13) (pred_1 ?v5))
:effect (and  (pred_9 ?v13) (not (pred_4 ?v13))))


(:action op_1
:parameters (?v8 ?v12)
:precondition (and (pred_12 ?v8) (pred_12 ?v12)
               (pred_8 ?v8) (pred_5 ?v8 ?v12) (pred_9 ?v12))
:effect (and (pred_8 ?v12) (not (pred_8 ?v8))))

(:action op_4
:parameters (?v8 ?v5)
:precondition (and (pred_12 ?v8) (pred_10 ?v5) 
                  (pred_8 ?v8) (pred_11 ?v5 ?v8) (pred_2 ))
:effect (and (pred_1 ?v5)
   (not (pred_11 ?v5 ?v8)) (not (pred_2 ))))


(:action op_3
:parameters (?v8 ?v7 ?v9)
:precondition (and (pred_12 ?v8) (pred_10 ?v7) (pred_10 ?v9)
                  (pred_8 ?v8) (pred_1 ?v9) (pred_11 ?v7 ?v8))
:effect (and (pred_1 ?v7) (pred_11 ?v9 ?v8)
        (not (pred_1 ?v9)) (not (pred_11 ?v7 ?v8))))

(:action op_2
:parameters (?v8 ?v5)
:precondition (and (pred_12 ?v8) (pred_10 ?v5) 
                  (pred_8 ?v8) (pred_1 ?v5))
:effect (and (pred_2 ) (pred_11 ?v5 ?v8) (not (pred_1 ?v5)))))


	

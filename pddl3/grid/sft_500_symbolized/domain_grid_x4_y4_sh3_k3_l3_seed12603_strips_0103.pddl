(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v11 ?v9)
             (pred_5 ?v5 ?v6)
             (pred_11 ?v11 ?v6)
             (pred_3 ?v13 ?v11 )
	     (pred_6 ?v11)
             (pred_8 ?v2)
             (pred_2 ?v5)
             (pred_1 ?v6)
             (pred_7 ?v11)
             (pred_10 ?v5)
             (pred_4 ?v11)
             (pred_9 ))



(:action op_5
:parameters (?v8 ?v4 ?v12 ?v10)
:precondition (and (pred_8 ?v8) (pred_8 ?v4) (pred_2 ?v12) (pred_1 ?v10)
          (pred_12 ?v8 ?v4) (pred_5 ?v12 ?v10)
                   (pred_11 ?v4 ?v10) (pred_6 ?v8) 
                   (pred_7 ?v4) (pred_10 ?v12))
:effect (and  (pred_4 ?v4) (not (pred_7 ?v4))))


(:action op_3
:parameters (?v8 ?v7)
:precondition (and (pred_8 ?v8) (pred_8 ?v7)
               (pred_6 ?v8) (pred_12 ?v8 ?v7) (pred_4 ?v7))
:effect (and (pred_6 ?v7) (not (pred_6 ?v8))))

(:action op_4
:parameters (?v8 ?v12)
:precondition (and (pred_8 ?v8) (pred_2 ?v12) 
                  (pred_6 ?v8) (pred_3 ?v12 ?v8) (pred_9 ))
:effect (and (pred_10 ?v12)
   (not (pred_3 ?v12 ?v8)) (not (pred_9 ))))


(:action op_1
:parameters (?v8 ?v3 ?v1)
:precondition (and (pred_8 ?v8) (pred_2 ?v3) (pred_2 ?v1)
                  (pred_6 ?v8) (pred_10 ?v1) (pred_3 ?v3 ?v8))
:effect (and (pred_10 ?v3) (pred_3 ?v1 ?v8)
        (not (pred_10 ?v1)) (not (pred_3 ?v3 ?v8))))

(:action op_2
:parameters (?v8 ?v12)
:precondition (and (pred_8 ?v8) (pred_2 ?v12) 
                  (pred_6 ?v8) (pred_10 ?v12))
:effect (and (pred_9 ) (pred_3 ?v12 ?v8) (not (pred_10 ?v12)))))


	

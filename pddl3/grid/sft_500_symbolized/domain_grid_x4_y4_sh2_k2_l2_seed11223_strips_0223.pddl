(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v1 ?v2)
             (pred_11 ?v13 ?v10)
             (pred_5 ?v1 ?v10)
             (pred_2 ?v5 ?v1 )
	     (pred_8 ?v1)
             (pred_3 ?v11)
             (pred_10 ?v13)
             (pred_1 ?v10)
             (pred_4 ?v1)
             (pred_9 ?v13)
             (pred_6 ?v1)
             (pred_12 ))



(:action op_5
:parameters (?v8 ?v3 ?v9 ?v7)
:precondition (and (pred_3 ?v8) (pred_3 ?v3) (pred_10 ?v9) (pred_1 ?v7)
          (pred_7 ?v8 ?v3) (pred_11 ?v9 ?v7)
                   (pred_5 ?v3 ?v7) (pred_8 ?v8) 
                   (pred_4 ?v3) (pred_9 ?v9))
:effect (and  (pred_6 ?v3) (not (pred_4 ?v3))))


(:action op_4
:parameters (?v8 ?v12)
:precondition (and (pred_3 ?v8) (pred_3 ?v12)
               (pred_8 ?v8) (pred_7 ?v8 ?v12) (pred_6 ?v12))
:effect (and (pred_8 ?v12) (not (pred_8 ?v8))))

(:action op_1
:parameters (?v8 ?v9)
:precondition (and (pred_3 ?v8) (pred_10 ?v9) 
                  (pred_8 ?v8) (pred_2 ?v9 ?v8) (pred_12 ))
:effect (and (pred_9 ?v9)
   (not (pred_2 ?v9 ?v8)) (not (pred_12 ))))


(:action op_2
:parameters (?v8 ?v4 ?v6)
:precondition (and (pred_3 ?v8) (pred_10 ?v4) (pred_10 ?v6)
                  (pred_8 ?v8) (pred_9 ?v6) (pred_2 ?v4 ?v8))
:effect (and (pred_9 ?v4) (pred_2 ?v6 ?v8)
        (not (pred_9 ?v6)) (not (pred_2 ?v4 ?v8))))

(:action op_3
:parameters (?v8 ?v9)
:precondition (and (pred_3 ?v8) (pred_10 ?v9) 
                  (pred_8 ?v8) (pred_9 ?v9))
:effect (and (pred_12 ) (pred_2 ?v9 ?v8) (not (pred_9 ?v9)))))


	

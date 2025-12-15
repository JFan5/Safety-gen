(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v10 ?v11)
             (pred_10 ?v13 ?v6)
             (pred_7 ?v10 ?v6)
             (pred_5 ?v4 ?v10 )
	     (pred_4 ?v10)
             (pred_9 ?v12)
             (pred_6 ?v13)
             (pred_11 ?v6)
             (pred_3 ?v10)
             (pred_2 ?v13)
             (pred_12 ?v10)
             (pred_1 ))



(:action op_2
:parameters (?v3 ?v9 ?v8 ?v5)
:precondition (and (pred_9 ?v3) (pred_9 ?v9) (pred_6 ?v8) (pred_11 ?v5)
          (pred_8 ?v3 ?v9) (pred_10 ?v8 ?v5)
                   (pred_7 ?v9 ?v5) (pred_4 ?v3) 
                   (pred_3 ?v9) (pred_2 ?v8))
:effect (and  (pred_12 ?v9) (not (pred_3 ?v9))))


(:action op_4
:parameters (?v3 ?v1)
:precondition (and (pred_9 ?v3) (pred_9 ?v1)
               (pred_4 ?v3) (pred_8 ?v3 ?v1) (pred_12 ?v1))
:effect (and (pred_4 ?v1) (not (pred_4 ?v3))))

(:action op_5
:parameters (?v3 ?v8)
:precondition (and (pred_9 ?v3) (pred_6 ?v8) 
                  (pred_4 ?v3) (pred_5 ?v8 ?v3) (pred_1 ))
:effect (and (pred_2 ?v8)
   (not (pred_5 ?v8 ?v3)) (not (pred_1 ))))


(:action op_1
:parameters (?v3 ?v2 ?v7)
:precondition (and (pred_9 ?v3) (pred_6 ?v2) (pred_6 ?v7)
                  (pred_4 ?v3) (pred_2 ?v7) (pred_5 ?v2 ?v3))
:effect (and (pred_2 ?v2) (pred_5 ?v7 ?v3)
        (not (pred_2 ?v7)) (not (pred_5 ?v2 ?v3))))

(:action op_3
:parameters (?v3 ?v8)
:precondition (and (pred_9 ?v3) (pred_6 ?v8) 
                  (pred_4 ?v3) (pred_2 ?v8))
:effect (and (pred_1 ) (pred_5 ?v8 ?v3) (not (pred_2 ?v8)))))


	

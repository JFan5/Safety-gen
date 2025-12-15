(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v8 ?v2)
             (pred_3 ?v4 ?v5)
             (pred_4 ?v8 ?v5)
             (pred_1 ?v1 ?v8 )
	     (pred_7 ?v8)
             (pred_9 ?v12)
             (pred_2 ?v4)
             (pred_5 ?v5)
             (pred_12 ?v8)
             (pred_10 ?v4)
             (pred_8 ?v8)
             (pred_6 ))



(:action op_3
:parameters (?v3 ?v9 ?v10 ?v13)
:precondition (and (pred_9 ?v3) (pred_9 ?v9) (pred_2 ?v10) (pred_5 ?v13)
          (pred_11 ?v3 ?v9) (pred_3 ?v10 ?v13)
                   (pred_4 ?v9 ?v13) (pred_7 ?v3) 
                   (pred_12 ?v9) (pred_10 ?v10))
:effect (and  (pred_8 ?v9) (not (pred_12 ?v9))))


(:action op_1
:parameters (?v3 ?v6)
:precondition (and (pred_9 ?v3) (pred_9 ?v6)
               (pred_7 ?v3) (pred_11 ?v3 ?v6) (pred_8 ?v6))
:effect (and (pred_7 ?v6) (not (pred_7 ?v3))))

(:action op_4
:parameters (?v3 ?v10)
:precondition (and (pred_9 ?v3) (pred_2 ?v10) 
                  (pred_7 ?v3) (pred_1 ?v10 ?v3) (pred_6 ))
:effect (and (pred_10 ?v10)
   (not (pred_1 ?v10 ?v3)) (not (pred_6 ))))


(:action op_5
:parameters (?v3 ?v11 ?v7)
:precondition (and (pred_9 ?v3) (pred_2 ?v11) (pred_2 ?v7)
                  (pred_7 ?v3) (pred_10 ?v7) (pred_1 ?v11 ?v3))
:effect (and (pred_10 ?v11) (pred_1 ?v7 ?v3)
        (not (pred_10 ?v7)) (not (pred_1 ?v11 ?v3))))

(:action op_2
:parameters (?v3 ?v10)
:precondition (and (pred_9 ?v3) (pred_2 ?v10) 
                  (pred_7 ?v3) (pred_10 ?v10))
:effect (and (pred_6 ) (pred_1 ?v10 ?v3) (not (pred_10 ?v10)))))


	

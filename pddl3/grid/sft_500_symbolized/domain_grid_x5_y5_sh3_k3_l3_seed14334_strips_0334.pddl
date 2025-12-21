(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v1 ?v3)
             (pred_5 ?v4 ?v2)
             (pred_6 ?v1 ?v2)
             (pred_1 ?v8 ?v1 )
	     (pred_8 ?v1)
             (pred_11 ?v11)
             (pred_12 ?v4)
             (pred_9 ?v2)
             (pred_3 ?v1)
             (pred_10 ?v4)
             (pred_4 ?v1)
             (pred_7 ))



(:action op_2
:parameters (?v5 ?v9 ?v6 ?v13)
:precondition (and (pred_11 ?v5) (pred_11 ?v9) (pred_12 ?v6) (pred_9 ?v13)
          (pred_2 ?v5 ?v9) (pred_5 ?v6 ?v13)
                   (pred_6 ?v9 ?v13) (pred_8 ?v5) 
                   (pred_3 ?v9) (pred_10 ?v6))
:effect (and  (pred_4 ?v9) (not (pred_3 ?v9))))


(:action op_5
:parameters (?v5 ?v12)
:precondition (and (pred_11 ?v5) (pred_11 ?v12)
               (pred_8 ?v5) (pred_2 ?v5 ?v12) (pred_4 ?v12))
:effect (and (pred_8 ?v12) (not (pred_8 ?v5))))

(:action op_3
:parameters (?v5 ?v6)
:precondition (and (pred_11 ?v5) (pred_12 ?v6) 
                  (pred_8 ?v5) (pred_1 ?v6 ?v5) (pred_7 ))
:effect (and (pred_10 ?v6)
   (not (pred_1 ?v6 ?v5)) (not (pred_7 ))))


(:action op_1
:parameters (?v5 ?v10 ?v7)
:precondition (and (pred_11 ?v5) (pred_12 ?v10) (pred_12 ?v7)
                  (pred_8 ?v5) (pred_10 ?v7) (pred_1 ?v10 ?v5))
:effect (and (pred_10 ?v10) (pred_1 ?v7 ?v5)
        (not (pred_10 ?v7)) (not (pred_1 ?v10 ?v5))))

(:action op_4
:parameters (?v5 ?v6)
:precondition (and (pred_11 ?v5) (pred_12 ?v6) 
                  (pred_8 ?v5) (pred_10 ?v6))
:effect (and (pred_7 ) (pred_1 ?v6 ?v5) (not (pred_10 ?v6)))))


	

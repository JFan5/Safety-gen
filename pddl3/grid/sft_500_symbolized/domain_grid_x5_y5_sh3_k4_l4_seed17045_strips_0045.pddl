(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v3 ?v1)
             (pred_8 ?v5 ?v13)
             (pred_7 ?v3 ?v13)
             (pred_10 ?v2 ?v3 )
	     (pred_9 ?v3)
             (pred_5 ?v11)
             (pred_3 ?v5)
             (pred_2 ?v13)
             (pred_12 ?v3)
             (pred_4 ?v5)
             (pred_6 ?v3)
             (pred_11 ))



(:action op_3
:parameters (?v12 ?v9 ?v4 ?v8)
:precondition (and (pred_5 ?v12) (pred_5 ?v9) (pred_3 ?v4) (pred_2 ?v8)
          (pred_1 ?v12 ?v9) (pred_8 ?v4 ?v8)
                   (pred_7 ?v9 ?v8) (pred_9 ?v12) 
                   (pred_12 ?v9) (pred_4 ?v4))
:effect (and  (pred_6 ?v9) (not (pred_12 ?v9))))


(:action op_1
:parameters (?v12 ?v6)
:precondition (and (pred_5 ?v12) (pred_5 ?v6)
               (pred_9 ?v12) (pred_1 ?v12 ?v6) (pred_6 ?v6))
:effect (and (pred_9 ?v6) (not (pred_9 ?v12))))

(:action op_5
:parameters (?v12 ?v4)
:precondition (and (pred_5 ?v12) (pred_3 ?v4) 
                  (pred_9 ?v12) (pred_10 ?v4 ?v12) (pred_11 ))
:effect (and (pred_4 ?v4)
   (not (pred_10 ?v4 ?v12)) (not (pred_11 ))))


(:action op_4
:parameters (?v12 ?v10 ?v7)
:precondition (and (pred_5 ?v12) (pred_3 ?v10) (pred_3 ?v7)
                  (pred_9 ?v12) (pred_4 ?v7) (pred_10 ?v10 ?v12))
:effect (and (pred_4 ?v10) (pred_10 ?v7 ?v12)
        (not (pred_4 ?v7)) (not (pred_10 ?v10 ?v12))))

(:action op_2
:parameters (?v12 ?v4)
:precondition (and (pred_5 ?v12) (pred_3 ?v4) 
                  (pred_9 ?v12) (pred_4 ?v4))
:effect (and (pred_11 ) (pred_10 ?v4 ?v12) (not (pred_4 ?v4)))))


	

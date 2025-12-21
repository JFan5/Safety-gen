(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v10 ?v3)
             (pred_12 ?v2 ?v11)
             (pred_1 ?v10 ?v11)
             (pred_4 ?v5 ?v10 )
	     (pred_9 ?v10)
             (pred_6 ?v7)
             (pred_10 ?v2)
             (pred_8 ?v11)
             (pred_11 ?v10)
             (pred_5 ?v2)
             (pred_3 ?v10)
             (pred_7 ))



(:action op_4
:parameters (?v4 ?v8 ?v6 ?v12)
:precondition (and (pred_6 ?v4) (pred_6 ?v8) (pred_10 ?v6) (pred_8 ?v12)
          (pred_2 ?v4 ?v8) (pred_12 ?v6 ?v12)
                   (pred_1 ?v8 ?v12) (pred_9 ?v4) 
                   (pred_11 ?v8) (pred_5 ?v6))
:effect (and  (pred_3 ?v8) (not (pred_11 ?v8))))


(:action op_3
:parameters (?v4 ?v1)
:precondition (and (pred_6 ?v4) (pred_6 ?v1)
               (pred_9 ?v4) (pred_2 ?v4 ?v1) (pred_3 ?v1))
:effect (and (pred_9 ?v1) (not (pred_9 ?v4))))

(:action op_1
:parameters (?v4 ?v6)
:precondition (and (pred_6 ?v4) (pred_10 ?v6) 
                  (pred_9 ?v4) (pred_4 ?v6 ?v4) (pred_7 ))
:effect (and (pred_5 ?v6)
   (not (pred_4 ?v6 ?v4)) (not (pred_7 ))))


(:action op_5
:parameters (?v4 ?v9 ?v13)
:precondition (and (pred_6 ?v4) (pred_10 ?v9) (pred_10 ?v13)
                  (pred_9 ?v4) (pred_5 ?v13) (pred_4 ?v9 ?v4))
:effect (and (pred_5 ?v9) (pred_4 ?v13 ?v4)
        (not (pred_5 ?v13)) (not (pred_4 ?v9 ?v4))))

(:action op_2
:parameters (?v4 ?v6)
:precondition (and (pred_6 ?v4) (pred_10 ?v6) 
                  (pred_9 ?v4) (pred_5 ?v6))
:effect (and (pred_7 ) (pred_4 ?v6 ?v4) (not (pred_5 ?v6)))))


	

(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v3 ?v10)
             (pred_11 ?v13 ?v4)
             (pred_5 ?v3 ?v4)
             (pred_8 ?v1 ?v3 )
	     (pred_2 ?v3)
             (pred_3 ?v7)
             (pred_4 ?v13)
             (pred_1 ?v4)
             (pred_12 ?v3)
             (pred_7 ?v13)
             (pred_10 ?v3)
             (pred_6 ))



(:action op_1
:parameters (?v5 ?v9 ?v2 ?v12)
:precondition (and (pred_3 ?v5) (pred_3 ?v9) (pred_4 ?v2) (pred_1 ?v12)
          (pred_9 ?v5 ?v9) (pred_11 ?v2 ?v12)
                   (pred_5 ?v9 ?v12) (pred_2 ?v5) 
                   (pred_12 ?v9) (pred_7 ?v2))
:effect (and  (pred_10 ?v9) (not (pred_12 ?v9))))


(:action op_3
:parameters (?v5 ?v11)
:precondition (and (pred_3 ?v5) (pred_3 ?v11)
               (pred_2 ?v5) (pred_9 ?v5 ?v11) (pred_10 ?v11))
:effect (and (pred_2 ?v11) (not (pred_2 ?v5))))

(:action op_5
:parameters (?v5 ?v2)
:precondition (and (pred_3 ?v5) (pred_4 ?v2) 
                  (pred_2 ?v5) (pred_8 ?v2 ?v5) (pred_6 ))
:effect (and (pred_7 ?v2)
   (not (pred_8 ?v2 ?v5)) (not (pred_6 ))))


(:action op_2
:parameters (?v5 ?v8 ?v6)
:precondition (and (pred_3 ?v5) (pred_4 ?v8) (pred_4 ?v6)
                  (pred_2 ?v5) (pred_7 ?v6) (pred_8 ?v8 ?v5))
:effect (and (pred_7 ?v8) (pred_8 ?v6 ?v5)
        (not (pred_7 ?v6)) (not (pred_8 ?v8 ?v5))))

(:action op_4
:parameters (?v5 ?v2)
:precondition (and (pred_3 ?v5) (pred_4 ?v2) 
                  (pred_2 ?v5) (pred_7 ?v2))
:effect (and (pred_6 ) (pred_8 ?v2 ?v5) (not (pred_7 ?v2)))))


	

(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v4 ?v9)
             (pred_12 ?v7 ?v1)
             (pred_11 ?v4 ?v1)
             (pred_6 ?v11 ?v4 )
	     (pred_8 ?v4)
             (pred_5 ?v12)
             (pred_2 ?v7)
             (pred_9 ?v1)
             (pred_7 ?v4)
             (pred_10 ?v7)
             (pred_1 ?v4)
             (pred_3 ))



(:action op_2
:parameters (?v5 ?v8 ?v2 ?v3)
:precondition (and (pred_5 ?v5) (pred_5 ?v8) (pred_2 ?v2) (pred_9 ?v3)
          (pred_4 ?v5 ?v8) (pred_12 ?v2 ?v3)
                   (pred_11 ?v8 ?v3) (pred_8 ?v5) 
                   (pred_7 ?v8) (pred_10 ?v2))
:effect (and  (pred_1 ?v8) (not (pred_7 ?v8))))


(:action op_4
:parameters (?v5 ?v10)
:precondition (and (pred_5 ?v5) (pred_5 ?v10)
               (pred_8 ?v5) (pred_4 ?v5 ?v10) (pred_1 ?v10))
:effect (and (pred_8 ?v10) (not (pred_8 ?v5))))

(:action op_5
:parameters (?v5 ?v2)
:precondition (and (pred_5 ?v5) (pred_2 ?v2) 
                  (pred_8 ?v5) (pred_6 ?v2 ?v5) (pred_3 ))
:effect (and (pred_10 ?v2)
   (not (pred_6 ?v2 ?v5)) (not (pred_3 ))))


(:action op_3
:parameters (?v5 ?v6 ?v13)
:precondition (and (pred_5 ?v5) (pred_2 ?v6) (pred_2 ?v13)
                  (pred_8 ?v5) (pred_10 ?v13) (pred_6 ?v6 ?v5))
:effect (and (pred_10 ?v6) (pred_6 ?v13 ?v5)
        (not (pred_10 ?v13)) (not (pred_6 ?v6 ?v5))))

(:action op_1
:parameters (?v5 ?v2)
:precondition (and (pred_5 ?v5) (pred_2 ?v2) 
                  (pred_8 ?v5) (pred_10 ?v2))
:effect (and (pred_3 ) (pred_6 ?v2 ?v5) (not (pred_10 ?v2)))))


	

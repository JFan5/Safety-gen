(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v3 ?v8)
             (pred_1 ?v7 ?v12)
             (pred_8 ?v3 ?v12)
             (pred_12 ?v13 ?v3 )
	     (pred_7 ?v3)
             (pred_3 ?v4)
             (pred_6 ?v7)
             (pred_10 ?v12)
             (pred_11 ?v3)
             (pred_9 ?v7)
             (pred_4 ?v3)
             (pred_5 ))



(:action op_4
:parameters (?v2 ?v5 ?v10 ?v11)
:precondition (and (pred_3 ?v2) (pred_3 ?v5) (pred_6 ?v10) (pred_10 ?v11)
          (pred_2 ?v2 ?v5) (pred_1 ?v10 ?v11)
                   (pred_8 ?v5 ?v11) (pred_7 ?v2) 
                   (pred_11 ?v5) (pred_9 ?v10))
:effect (and  (pred_4 ?v5) (not (pred_11 ?v5))))


(:action op_3
:parameters (?v2 ?v9)
:precondition (and (pred_3 ?v2) (pred_3 ?v9)
               (pred_7 ?v2) (pred_2 ?v2 ?v9) (pred_4 ?v9))
:effect (and (pred_7 ?v9) (not (pred_7 ?v2))))

(:action op_5
:parameters (?v2 ?v10)
:precondition (and (pred_3 ?v2) (pred_6 ?v10) 
                  (pred_7 ?v2) (pred_12 ?v10 ?v2) (pred_5 ))
:effect (and (pred_9 ?v10)
   (not (pred_12 ?v10 ?v2)) (not (pred_5 ))))


(:action op_2
:parameters (?v2 ?v1 ?v6)
:precondition (and (pred_3 ?v2) (pred_6 ?v1) (pred_6 ?v6)
                  (pred_7 ?v2) (pred_9 ?v6) (pred_12 ?v1 ?v2))
:effect (and (pred_9 ?v1) (pred_12 ?v6 ?v2)
        (not (pred_9 ?v6)) (not (pred_12 ?v1 ?v2))))

(:action op_1
:parameters (?v2 ?v10)
:precondition (and (pred_3 ?v2) (pred_6 ?v10) 
                  (pred_7 ?v2) (pred_9 ?v10))
:effect (and (pred_5 ) (pred_12 ?v10 ?v2) (not (pred_9 ?v10)))))


	

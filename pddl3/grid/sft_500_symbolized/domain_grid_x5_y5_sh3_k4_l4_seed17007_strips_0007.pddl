(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v9 ?v13)
             (pred_9 ?v8 ?v3)
             (pred_8 ?v9 ?v3)
             (pred_3 ?v12 ?v9 )
	     (pred_5 ?v9)
             (pred_6 ?v7)
             (pred_12 ?v8)
             (pred_2 ?v3)
             (pred_1 ?v9)
             (pred_7 ?v8)
             (pred_10 ?v9)
             (pred_4 ))



(:action op_5
:parameters (?v2 ?v5 ?v1 ?v4)
:precondition (and (pred_6 ?v2) (pred_6 ?v5) (pred_12 ?v1) (pred_2 ?v4)
          (pred_11 ?v2 ?v5) (pred_9 ?v1 ?v4)
                   (pred_8 ?v5 ?v4) (pred_5 ?v2) 
                   (pred_1 ?v5) (pred_7 ?v1))
:effect (and  (pred_10 ?v5) (not (pred_1 ?v5))))


(:action op_3
:parameters (?v2 ?v11)
:precondition (and (pred_6 ?v2) (pred_6 ?v11)
               (pred_5 ?v2) (pred_11 ?v2 ?v11) (pred_10 ?v11))
:effect (and (pred_5 ?v11) (not (pred_5 ?v2))))

(:action op_2
:parameters (?v2 ?v1)
:precondition (and (pred_6 ?v2) (pred_12 ?v1) 
                  (pred_5 ?v2) (pred_3 ?v1 ?v2) (pred_4 ))
:effect (and (pred_7 ?v1)
   (not (pred_3 ?v1 ?v2)) (not (pred_4 ))))


(:action op_4
:parameters (?v2 ?v10 ?v6)
:precondition (and (pred_6 ?v2) (pred_12 ?v10) (pred_12 ?v6)
                  (pred_5 ?v2) (pred_7 ?v6) (pred_3 ?v10 ?v2))
:effect (and (pred_7 ?v10) (pred_3 ?v6 ?v2)
        (not (pred_7 ?v6)) (not (pred_3 ?v10 ?v2))))

(:action op_1
:parameters (?v2 ?v1)
:precondition (and (pred_6 ?v2) (pred_12 ?v1) 
                  (pred_5 ?v2) (pred_7 ?v1))
:effect (and (pred_4 ) (pred_3 ?v1 ?v2) (not (pred_7 ?v1)))))


	

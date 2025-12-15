(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v10 ?v6)
             (pred_2 ?v12 ?v9)
             (pred_9 ?v10 ?v9)
             (pred_3 ?v8 ?v10 )
	     (pred_6 ?v10)
             (pred_7 ?v7)
             (pred_1 ?v12)
             (pred_11 ?v9)
             (pred_10 ?v10)
             (pred_5 ?v12)
             (pred_12 ?v10)
             (pred_4 ))



(:action op_3
:parameters (?v1 ?v5 ?v2 ?v4)
:precondition (and (pred_7 ?v1) (pred_7 ?v5) (pred_1 ?v2) (pred_11 ?v4)
          (pred_8 ?v1 ?v5) (pred_2 ?v2 ?v4)
                   (pred_9 ?v5 ?v4) (pred_6 ?v1) 
                   (pred_10 ?v5) (pred_5 ?v2))
:effect (and  (pred_12 ?v5) (not (pred_10 ?v5))))


(:action op_4
:parameters (?v1 ?v11)
:precondition (and (pred_7 ?v1) (pred_7 ?v11)
               (pred_6 ?v1) (pred_8 ?v1 ?v11) (pred_12 ?v11))
:effect (and (pred_6 ?v11) (not (pred_6 ?v1))))

(:action op_2
:parameters (?v1 ?v2)
:precondition (and (pred_7 ?v1) (pred_1 ?v2) 
                  (pred_6 ?v1) (pred_3 ?v2 ?v1) (pred_4 ))
:effect (and (pred_5 ?v2)
   (not (pred_3 ?v2 ?v1)) (not (pred_4 ))))


(:action op_1
:parameters (?v1 ?v13 ?v3)
:precondition (and (pred_7 ?v1) (pred_1 ?v13) (pred_1 ?v3)
                  (pred_6 ?v1) (pred_5 ?v3) (pred_3 ?v13 ?v1))
:effect (and (pred_5 ?v13) (pred_3 ?v3 ?v1)
        (not (pred_5 ?v3)) (not (pred_3 ?v13 ?v1))))

(:action op_5
:parameters (?v1 ?v2)
:precondition (and (pred_7 ?v1) (pred_1 ?v2) 
                  (pred_6 ?v1) (pred_5 ?v2))
:effect (and (pred_4 ) (pred_3 ?v2 ?v1) (not (pred_5 ?v2)))))


	

(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v9)
             (pred_12 ?v13 ?v6)
             (pred_11 ?v4 ?v6)
             (pred_7 ?v7 ?v4 )
	     (pred_8 ?v4)
             (pred_2 ?v2)
             (pred_5 ?v13)
             (pred_1 ?v6)
             (pred_6 ?v4)
             (pred_3 ?v13)
             (pred_9 ?v4)
             (pred_4 ))



(:action op_5
:parameters (?v1 ?v5 ?v11 ?v12)
:precondition (and (pred_2 ?v1) (pred_2 ?v5) (pred_5 ?v11) (pred_1 ?v12)
          (pred_10 ?v1 ?v5) (pred_12 ?v11 ?v12)
                   (pred_11 ?v5 ?v12) (pred_8 ?v1) 
                   (pred_6 ?v5) (pred_3 ?v11))
:effect (and  (pred_9 ?v5) (not (pred_6 ?v5))))


(:action op_1
:parameters (?v1 ?v10)
:precondition (and (pred_2 ?v1) (pred_2 ?v10)
               (pred_8 ?v1) (pred_10 ?v1 ?v10) (pred_9 ?v10))
:effect (and (pred_8 ?v10) (not (pred_8 ?v1))))

(:action op_3
:parameters (?v1 ?v11)
:precondition (and (pred_2 ?v1) (pred_5 ?v11) 
                  (pred_8 ?v1) (pred_7 ?v11 ?v1) (pred_4 ))
:effect (and (pred_3 ?v11)
   (not (pred_7 ?v11 ?v1)) (not (pred_4 ))))


(:action op_2
:parameters (?v1 ?v8 ?v3)
:precondition (and (pred_2 ?v1) (pred_5 ?v8) (pred_5 ?v3)
                  (pred_8 ?v1) (pred_3 ?v3) (pred_7 ?v8 ?v1))
:effect (and (pred_3 ?v8) (pred_7 ?v3 ?v1)
        (not (pred_3 ?v3)) (not (pred_7 ?v8 ?v1))))

(:action op_4
:parameters (?v1 ?v11)
:precondition (and (pred_2 ?v1) (pred_5 ?v11) 
                  (pred_8 ?v1) (pred_3 ?v11))
:effect (and (pred_4 ) (pred_7 ?v11 ?v1) (not (pred_3 ?v11)))))


	

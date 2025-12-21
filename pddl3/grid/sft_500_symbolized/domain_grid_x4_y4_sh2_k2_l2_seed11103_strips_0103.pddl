(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v13 ?v11)
             (pred_1 ?v5 ?v10)
             (pred_5 ?v13 ?v10)
             (pred_4 ?v4 ?v13 )
	     (pred_11 ?v13)
             (pred_3 ?v7)
             (pred_7 ?v5)
             (pred_2 ?v10)
             (pred_12 ?v13)
             (pred_8 ?v5)
             (pred_10 ?v13)
             (pred_6 ))



(:action op_1
:parameters (?v1 ?v3 ?v9 ?v2)
:precondition (and (pred_3 ?v1) (pred_3 ?v3) (pred_7 ?v9) (pred_2 ?v2)
          (pred_9 ?v1 ?v3) (pred_1 ?v9 ?v2)
                   (pred_5 ?v3 ?v2) (pred_11 ?v1) 
                   (pred_12 ?v3) (pred_8 ?v9))
:effect (and  (pred_10 ?v3) (not (pred_12 ?v3))))


(:action op_2
:parameters (?v1 ?v6)
:precondition (and (pred_3 ?v1) (pred_3 ?v6)
               (pred_11 ?v1) (pred_9 ?v1 ?v6) (pred_10 ?v6))
:effect (and (pred_11 ?v6) (not (pred_11 ?v1))))

(:action op_5
:parameters (?v1 ?v9)
:precondition (and (pred_3 ?v1) (pred_7 ?v9) 
                  (pred_11 ?v1) (pred_4 ?v9 ?v1) (pred_6 ))
:effect (and (pred_8 ?v9)
   (not (pred_4 ?v9 ?v1)) (not (pred_6 ))))


(:action op_4
:parameters (?v1 ?v8 ?v12)
:precondition (and (pred_3 ?v1) (pred_7 ?v8) (pred_7 ?v12)
                  (pred_11 ?v1) (pred_8 ?v12) (pred_4 ?v8 ?v1))
:effect (and (pred_8 ?v8) (pred_4 ?v12 ?v1)
        (not (pred_8 ?v12)) (not (pred_4 ?v8 ?v1))))

(:action op_3
:parameters (?v1 ?v9)
:precondition (and (pred_3 ?v1) (pred_7 ?v9) 
                  (pred_11 ?v1) (pred_8 ?v9))
:effect (and (pred_6 ) (pred_4 ?v9 ?v1) (not (pred_8 ?v9)))))


	

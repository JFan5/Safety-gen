(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v4 ?v8)
             (pred_2 ?v2 ?v7)
             (pred_8 ?v4 ?v7)
             (pred_7 ?v10 ?v4 )
	     (pred_10 ?v4)
             (pred_3 ?v6)
             (pred_12 ?v2)
             (pred_11 ?v7)
             (pred_9 ?v4)
             (pred_4 ?v2)
             (pred_6 ?v4)
             (pred_1 ))



(:action op_4
:parameters (?v12 ?v1 ?v5 ?v9)
:precondition (and (pred_3 ?v12) (pred_3 ?v1) (pred_12 ?v5) (pred_11 ?v9)
          (pred_5 ?v12 ?v1) (pred_2 ?v5 ?v9)
                   (pred_8 ?v1 ?v9) (pred_10 ?v12) 
                   (pred_9 ?v1) (pred_4 ?v5))
:effect (and  (pred_6 ?v1) (not (pred_9 ?v1))))


(:action op_1
:parameters (?v12 ?v11)
:precondition (and (pred_3 ?v12) (pred_3 ?v11)
               (pred_10 ?v12) (pred_5 ?v12 ?v11) (pred_6 ?v11))
:effect (and (pred_10 ?v11) (not (pred_10 ?v12))))

(:action op_5
:parameters (?v12 ?v5)
:precondition (and (pred_3 ?v12) (pred_12 ?v5) 
                  (pred_10 ?v12) (pred_7 ?v5 ?v12) (pred_1 ))
:effect (and (pred_4 ?v5)
   (not (pred_7 ?v5 ?v12)) (not (pred_1 ))))


(:action op_3
:parameters (?v12 ?v13 ?v3)
:precondition (and (pred_3 ?v12) (pred_12 ?v13) (pred_12 ?v3)
                  (pred_10 ?v12) (pred_4 ?v3) (pred_7 ?v13 ?v12))
:effect (and (pred_4 ?v13) (pred_7 ?v3 ?v12)
        (not (pred_4 ?v3)) (not (pred_7 ?v13 ?v12))))

(:action op_2
:parameters (?v12 ?v5)
:precondition (and (pred_3 ?v12) (pred_12 ?v5) 
                  (pred_10 ?v12) (pred_4 ?v5))
:effect (and (pred_1 ) (pred_7 ?v5 ?v12) (not (pred_4 ?v5)))))


	

(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v10 ?v8)
             (pred_7 ?v9 ?v7)
             (pred_12 ?v10 ?v7)
             (pred_11 ?v13 ?v10 )
	     (pred_3 ?v10)
             (pred_8 ?v6)
             (pred_6 ?v9)
             (pred_2 ?v7)
             (pred_4 ?v10)
             (pred_1 ?v9)
             (pred_10 ?v10)
             (pred_9 ))



(:action op_3
:parameters (?v3 ?v1 ?v5 ?v4)
:precondition (and (pred_8 ?v3) (pred_8 ?v1) (pred_6 ?v5) (pred_2 ?v4)
          (pred_5 ?v3 ?v1) (pred_7 ?v5 ?v4)
                   (pred_12 ?v1 ?v4) (pred_3 ?v3) 
                   (pred_4 ?v1) (pred_1 ?v5))
:effect (and  (pred_10 ?v1) (not (pred_4 ?v1))))


(:action op_1
:parameters (?v3 ?v12)
:precondition (and (pred_8 ?v3) (pred_8 ?v12)
               (pred_3 ?v3) (pred_5 ?v3 ?v12) (pred_10 ?v12))
:effect (and (pred_3 ?v12) (not (pred_3 ?v3))))

(:action op_4
:parameters (?v3 ?v5)
:precondition (and (pred_8 ?v3) (pred_6 ?v5) 
                  (pred_3 ?v3) (pred_11 ?v5 ?v3) (pred_9 ))
:effect (and (pred_1 ?v5)
   (not (pred_11 ?v5 ?v3)) (not (pred_9 ))))


(:action op_2
:parameters (?v3 ?v2 ?v11)
:precondition (and (pred_8 ?v3) (pred_6 ?v2) (pred_6 ?v11)
                  (pred_3 ?v3) (pred_1 ?v11) (pred_11 ?v2 ?v3))
:effect (and (pred_1 ?v2) (pred_11 ?v11 ?v3)
        (not (pred_1 ?v11)) (not (pred_11 ?v2 ?v3))))

(:action op_5
:parameters (?v3 ?v5)
:precondition (and (pred_8 ?v3) (pred_6 ?v5) 
                  (pred_3 ?v3) (pred_1 ?v5))
:effect (and (pred_9 ) (pred_11 ?v5 ?v3) (not (pred_1 ?v5)))))


	

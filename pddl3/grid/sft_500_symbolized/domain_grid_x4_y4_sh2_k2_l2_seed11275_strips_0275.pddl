(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v2 ?v13)
             (pred_4 ?v9 ?v12)
             (pred_5 ?v2 ?v12)
             (pred_11 ?v8 ?v2 )
	     (pred_8 ?v2)
             (pred_1 ?v7)
             (pred_12 ?v9)
             (pred_3 ?v12)
             (pred_2 ?v2)
             (pred_10 ?v9)
             (pred_6 ?v2)
             (pred_7 ))



(:action op_5
:parameters (?v3 ?v1 ?v5 ?v4)
:precondition (and (pred_1 ?v3) (pred_1 ?v1) (pred_12 ?v5) (pred_3 ?v4)
          (pred_9 ?v3 ?v1) (pred_4 ?v5 ?v4)
                   (pred_5 ?v1 ?v4) (pred_8 ?v3) 
                   (pred_2 ?v1) (pred_10 ?v5))
:effect (and  (pred_6 ?v1) (not (pred_2 ?v1))))


(:action op_2
:parameters (?v3 ?v11)
:precondition (and (pred_1 ?v3) (pred_1 ?v11)
               (pred_8 ?v3) (pred_9 ?v3 ?v11) (pred_6 ?v11))
:effect (and (pred_8 ?v11) (not (pred_8 ?v3))))

(:action op_1
:parameters (?v3 ?v5)
:precondition (and (pred_1 ?v3) (pred_12 ?v5) 
                  (pred_8 ?v3) (pred_11 ?v5 ?v3) (pred_7 ))
:effect (and (pred_10 ?v5)
   (not (pred_11 ?v5 ?v3)) (not (pred_7 ))))


(:action op_4
:parameters (?v3 ?v10 ?v6)
:precondition (and (pred_1 ?v3) (pred_12 ?v10) (pred_12 ?v6)
                  (pred_8 ?v3) (pred_10 ?v6) (pred_11 ?v10 ?v3))
:effect (and (pred_10 ?v10) (pred_11 ?v6 ?v3)
        (not (pred_10 ?v6)) (not (pred_11 ?v10 ?v3))))

(:action op_3
:parameters (?v3 ?v5)
:precondition (and (pred_1 ?v3) (pred_12 ?v5) 
                  (pred_8 ?v3) (pred_10 ?v5))
:effect (and (pred_7 ) (pred_11 ?v5 ?v3) (not (pred_10 ?v5)))))


	

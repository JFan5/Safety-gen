(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v10 ?v2)
             (pred_8 ?v7 ?v6)
             (pred_6 ?v10 ?v6)
             (pred_2 ?v8 ?v10 )
	     (pred_12 ?v10)
             (pred_3 ?v9)
             (pred_7 ?v7)
             (pred_11 ?v6)
             (pred_9 ?v10)
             (pred_4 ?v7)
             (pred_10 ?v10)
             (pred_5 ))



(:action op_4
:parameters (?v1 ?v3 ?v11 ?v4)
:precondition (and (pred_3 ?v1) (pred_3 ?v3) (pred_7 ?v11) (pred_11 ?v4)
          (pred_1 ?v1 ?v3) (pred_8 ?v11 ?v4)
                   (pred_6 ?v3 ?v4) (pred_12 ?v1) 
                   (pred_9 ?v3) (pred_4 ?v11))
:effect (and  (pred_10 ?v3) (not (pred_9 ?v3))))


(:action op_2
:parameters (?v1 ?v13)
:precondition (and (pred_3 ?v1) (pred_3 ?v13)
               (pred_12 ?v1) (pred_1 ?v1 ?v13) (pred_10 ?v13))
:effect (and (pred_12 ?v13) (not (pred_12 ?v1))))

(:action op_1
:parameters (?v1 ?v11)
:precondition (and (pred_3 ?v1) (pred_7 ?v11) 
                  (pred_12 ?v1) (pred_2 ?v11 ?v1) (pred_5 ))
:effect (and (pred_4 ?v11)
   (not (pred_2 ?v11 ?v1)) (not (pred_5 ))))


(:action op_3
:parameters (?v1 ?v5 ?v12)
:precondition (and (pred_3 ?v1) (pred_7 ?v5) (pred_7 ?v12)
                  (pred_12 ?v1) (pred_4 ?v12) (pred_2 ?v5 ?v1))
:effect (and (pred_4 ?v5) (pred_2 ?v12 ?v1)
        (not (pred_4 ?v12)) (not (pred_2 ?v5 ?v1))))

(:action op_5
:parameters (?v1 ?v11)
:precondition (and (pred_3 ?v1) (pred_7 ?v11) 
                  (pred_12 ?v1) (pred_4 ?v11))
:effect (and (pred_5 ) (pred_2 ?v11 ?v1) (not (pred_4 ?v11)))))


	

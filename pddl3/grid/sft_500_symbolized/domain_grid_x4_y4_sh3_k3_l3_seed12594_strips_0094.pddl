(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v12 ?v7)
             (pred_11 ?v8 ?v9)
             (pred_9 ?v12 ?v9)
             (pred_12 ?v10 ?v12 )
	     (pred_10 ?v12)
             (pred_7 ?v6)
             (pred_2 ?v8)
             (pred_1 ?v9)
             (pred_6 ?v12)
             (pred_4 ?v8)
             (pred_5 ?v12)
             (pred_3 ))



(:action op_1
:parameters (?v1 ?v3 ?v4 ?v2)
:precondition (and (pred_7 ?v1) (pred_7 ?v3) (pred_2 ?v4) (pred_1 ?v2)
          (pred_8 ?v1 ?v3) (pred_11 ?v4 ?v2)
                   (pred_9 ?v3 ?v2) (pred_10 ?v1) 
                   (pred_6 ?v3) (pred_4 ?v4))
:effect (and  (pred_5 ?v3) (not (pred_6 ?v3))))


(:action op_4
:parameters (?v1 ?v13)
:precondition (and (pred_7 ?v1) (pred_7 ?v13)
               (pred_10 ?v1) (pred_8 ?v1 ?v13) (pred_5 ?v13))
:effect (and (pred_10 ?v13) (not (pred_10 ?v1))))

(:action op_5
:parameters (?v1 ?v4)
:precondition (and (pred_7 ?v1) (pred_2 ?v4) 
                  (pred_10 ?v1) (pred_12 ?v4 ?v1) (pred_3 ))
:effect (and (pred_4 ?v4)
   (not (pred_12 ?v4 ?v1)) (not (pred_3 ))))


(:action op_3
:parameters (?v1 ?v11 ?v5)
:precondition (and (pred_7 ?v1) (pred_2 ?v11) (pred_2 ?v5)
                  (pred_10 ?v1) (pred_4 ?v5) (pred_12 ?v11 ?v1))
:effect (and (pred_4 ?v11) (pred_12 ?v5 ?v1)
        (not (pred_4 ?v5)) (not (pred_12 ?v11 ?v1))))

(:action op_2
:parameters (?v1 ?v4)
:precondition (and (pred_7 ?v1) (pred_2 ?v4) 
                  (pred_10 ?v1) (pred_4 ?v4))
:effect (and (pred_3 ) (pred_12 ?v4 ?v1) (not (pred_4 ?v4)))))


	

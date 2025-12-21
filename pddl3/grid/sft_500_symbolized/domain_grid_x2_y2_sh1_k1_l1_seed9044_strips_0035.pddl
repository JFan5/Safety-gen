(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v12 ?v10)
             (pred_7 ?v7 ?v2)
             (pred_6 ?v12 ?v2)
             (pred_4 ?v6 ?v12 )
	     (pred_1 ?v12)
             (pred_10 ?v8)
             (pred_9 ?v7)
             (pred_8 ?v2)
             (pred_11 ?v12)
             (pred_12 ?v7)
             (pred_5 ?v12)
             (pred_3 ))



(:action op_5
:parameters (?v11 ?v4 ?v5 ?v3)
:precondition (and (pred_10 ?v11) (pred_10 ?v4) (pred_9 ?v5) (pred_8 ?v3)
          (pred_2 ?v11 ?v4) (pred_7 ?v5 ?v3)
                   (pred_6 ?v4 ?v3) (pred_1 ?v11) 
                   (pred_11 ?v4) (pred_12 ?v5))
:effect (and  (pred_5 ?v4) (not (pred_11 ?v4))))


(:action op_4
:parameters (?v11 ?v13)
:precondition (and (pred_10 ?v11) (pred_10 ?v13)
               (pred_1 ?v11) (pred_2 ?v11 ?v13) (pred_5 ?v13))
:effect (and (pred_1 ?v13) (not (pred_1 ?v11))))

(:action op_3
:parameters (?v11 ?v5)
:precondition (and (pred_10 ?v11) (pred_9 ?v5) 
                  (pred_1 ?v11) (pred_4 ?v5 ?v11) (pred_3 ))
:effect (and (pred_12 ?v5)
   (not (pred_4 ?v5 ?v11)) (not (pred_3 ))))


(:action op_2
:parameters (?v11 ?v9 ?v1)
:precondition (and (pred_10 ?v11) (pred_9 ?v9) (pred_9 ?v1)
                  (pred_1 ?v11) (pred_12 ?v1) (pred_4 ?v9 ?v11))
:effect (and (pred_12 ?v9) (pred_4 ?v1 ?v11)
        (not (pred_12 ?v1)) (not (pred_4 ?v9 ?v11))))

(:action op_1
:parameters (?v11 ?v5)
:precondition (and (pred_10 ?v11) (pred_9 ?v5) 
                  (pred_1 ?v11) (pred_12 ?v5))
:effect (and (pred_3 ) (pred_4 ?v5 ?v11) (not (pred_12 ?v5)))))


	

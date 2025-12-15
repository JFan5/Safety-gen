(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v5 ?v10)
             (pred_9 ?v7 ?v13)
             (pred_6 ?v5 ?v13)
             (pred_1 ?v6 ?v5 )
	     (pred_3 ?v5)
             (pred_12 ?v3)
             (pred_11 ?v7)
             (pred_4 ?v13)
             (pred_5 ?v5)
             (pred_7 ?v7)
             (pred_8 ?v5)
             (pred_2 ))



(:action op_1
:parameters (?v11 ?v4 ?v12 ?v1)
:precondition (and (pred_12 ?v11) (pred_12 ?v4) (pred_11 ?v12) (pred_4 ?v1)
          (pred_10 ?v11 ?v4) (pred_9 ?v12 ?v1)
                   (pred_6 ?v4 ?v1) (pred_3 ?v11) 
                   (pred_5 ?v4) (pred_7 ?v12))
:effect (and  (pred_8 ?v4) (not (pred_5 ?v4))))


(:action op_5
:parameters (?v11 ?v8)
:precondition (and (pred_12 ?v11) (pred_12 ?v8)
               (pred_3 ?v11) (pred_10 ?v11 ?v8) (pred_8 ?v8))
:effect (and (pred_3 ?v8) (not (pred_3 ?v11))))

(:action op_3
:parameters (?v11 ?v12)
:precondition (and (pred_12 ?v11) (pred_11 ?v12) 
                  (pred_3 ?v11) (pred_1 ?v12 ?v11) (pred_2 ))
:effect (and (pred_7 ?v12)
   (not (pred_1 ?v12 ?v11)) (not (pred_2 ))))


(:action op_4
:parameters (?v11 ?v9 ?v2)
:precondition (and (pred_12 ?v11) (pred_11 ?v9) (pred_11 ?v2)
                  (pred_3 ?v11) (pred_7 ?v2) (pred_1 ?v9 ?v11))
:effect (and (pred_7 ?v9) (pred_1 ?v2 ?v11)
        (not (pred_7 ?v2)) (not (pred_1 ?v9 ?v11))))

(:action op_2
:parameters (?v11 ?v12)
:precondition (and (pred_12 ?v11) (pred_11 ?v12) 
                  (pred_3 ?v11) (pred_7 ?v12))
:effect (and (pred_2 ) (pred_1 ?v12 ?v11) (not (pred_7 ?v12)))))


	

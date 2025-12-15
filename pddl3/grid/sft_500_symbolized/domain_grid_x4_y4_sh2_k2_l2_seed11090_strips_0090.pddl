(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v6 ?v7)
             (pred_9 ?v12 ?v5)
             (pred_6 ?v6 ?v5)
             (pred_7 ?v10 ?v6 )
	     (pred_4 ?v6)
             (pred_11 ?v9)
             (pred_10 ?v12)
             (pred_3 ?v5)
             (pred_5 ?v6)
             (pred_1 ?v12)
             (pred_8 ?v6)
             (pred_12 ))



(:action op_3
:parameters (?v4 ?v8 ?v13 ?v3)
:precondition (and (pred_11 ?v4) (pred_11 ?v8) (pred_10 ?v13) (pred_3 ?v3)
          (pred_2 ?v4 ?v8) (pred_9 ?v13 ?v3)
                   (pred_6 ?v8 ?v3) (pred_4 ?v4) 
                   (pred_5 ?v8) (pred_1 ?v13))
:effect (and  (pred_8 ?v8) (not (pred_5 ?v8))))


(:action op_2
:parameters (?v4 ?v11)
:precondition (and (pred_11 ?v4) (pred_11 ?v11)
               (pred_4 ?v4) (pred_2 ?v4 ?v11) (pred_8 ?v11))
:effect (and (pred_4 ?v11) (not (pred_4 ?v4))))

(:action op_1
:parameters (?v4 ?v13)
:precondition (and (pred_11 ?v4) (pred_10 ?v13) 
                  (pred_4 ?v4) (pred_7 ?v13 ?v4) (pred_12 ))
:effect (and (pred_1 ?v13)
   (not (pred_7 ?v13 ?v4)) (not (pred_12 ))))


(:action op_4
:parameters (?v4 ?v2 ?v1)
:precondition (and (pred_11 ?v4) (pred_10 ?v2) (pred_10 ?v1)
                  (pred_4 ?v4) (pred_1 ?v1) (pred_7 ?v2 ?v4))
:effect (and (pred_1 ?v2) (pred_7 ?v1 ?v4)
        (not (pred_1 ?v1)) (not (pred_7 ?v2 ?v4))))

(:action op_5
:parameters (?v4 ?v13)
:precondition (and (pred_11 ?v4) (pred_10 ?v13) 
                  (pred_4 ?v4) (pred_1 ?v13))
:effect (and (pred_12 ) (pred_7 ?v13 ?v4) (not (pred_1 ?v13)))))


	

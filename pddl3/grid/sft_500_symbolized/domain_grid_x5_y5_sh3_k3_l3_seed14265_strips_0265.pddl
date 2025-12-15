(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v10 ?v6)
             (pred_9 ?v7 ?v13)
             (pred_2 ?v10 ?v13)
             (pred_1 ?v5 ?v10 )
	     (pred_6 ?v10)
             (pred_12 ?v4)
             (pred_11 ?v7)
             (pred_3 ?v13)
             (pred_7 ?v10)
             (pred_5 ?v7)
             (pred_4 ?v10)
             (pred_8 ))



(:action op_2
:parameters (?v11 ?v2 ?v1 ?v9)
:precondition (and (pred_12 ?v11) (pred_12 ?v2) (pred_11 ?v1) (pred_3 ?v9)
          (pred_10 ?v11 ?v2) (pred_9 ?v1 ?v9)
                   (pred_2 ?v2 ?v9) (pred_6 ?v11) 
                   (pred_7 ?v2) (pred_5 ?v1))
:effect (and  (pred_4 ?v2) (not (pred_7 ?v2))))


(:action op_3
:parameters (?v11 ?v8)
:precondition (and (pred_12 ?v11) (pred_12 ?v8)
               (pred_6 ?v11) (pred_10 ?v11 ?v8) (pred_4 ?v8))
:effect (and (pred_6 ?v8) (not (pred_6 ?v11))))

(:action op_4
:parameters (?v11 ?v1)
:precondition (and (pred_12 ?v11) (pred_11 ?v1) 
                  (pred_6 ?v11) (pred_1 ?v1 ?v11) (pred_8 ))
:effect (and (pred_5 ?v1)
   (not (pred_1 ?v1 ?v11)) (not (pred_8 ))))


(:action op_5
:parameters (?v11 ?v3 ?v12)
:precondition (and (pred_12 ?v11) (pred_11 ?v3) (pred_11 ?v12)
                  (pred_6 ?v11) (pred_5 ?v12) (pred_1 ?v3 ?v11))
:effect (and (pred_5 ?v3) (pred_1 ?v12 ?v11)
        (not (pred_5 ?v12)) (not (pred_1 ?v3 ?v11))))

(:action op_1
:parameters (?v11 ?v1)
:precondition (and (pred_12 ?v11) (pred_11 ?v1) 
                  (pred_6 ?v11) (pred_5 ?v1))
:effect (and (pred_8 ) (pred_1 ?v1 ?v11) (not (pred_5 ?v1)))))


	

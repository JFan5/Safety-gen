(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v8 ?v6)
             (pred_11 ?v5 ?v10)
             (pred_5 ?v8 ?v10)
             (pred_12 ?v7 ?v8 )
	     (pred_10 ?v8)
             (pred_1 ?v1)
             (pred_6 ?v5)
             (pred_2 ?v10)
             (pred_8 ?v8)
             (pred_4 ?v5)
             (pred_3 ?v8)
             (pred_9 ))



(:action op_1
:parameters (?v11 ?v2 ?v3 ?v9)
:precondition (and (pred_1 ?v11) (pred_1 ?v2) (pred_6 ?v3) (pred_2 ?v9)
          (pred_7 ?v11 ?v2) (pred_11 ?v3 ?v9)
                   (pred_5 ?v2 ?v9) (pred_10 ?v11) 
                   (pred_8 ?v2) (pred_4 ?v3))
:effect (and  (pred_3 ?v2) (not (pred_8 ?v2))))


(:action op_3
:parameters (?v11 ?v12)
:precondition (and (pred_1 ?v11) (pred_1 ?v12)
               (pred_10 ?v11) (pred_7 ?v11 ?v12) (pred_3 ?v12))
:effect (and (pred_10 ?v12) (not (pred_10 ?v11))))

(:action op_4
:parameters (?v11 ?v3)
:precondition (and (pred_1 ?v11) (pred_6 ?v3) 
                  (pred_10 ?v11) (pred_12 ?v3 ?v11) (pred_9 ))
:effect (and (pred_4 ?v3)
   (not (pred_12 ?v3 ?v11)) (not (pred_9 ))))


(:action op_2
:parameters (?v11 ?v13 ?v4)
:precondition (and (pred_1 ?v11) (pred_6 ?v13) (pred_6 ?v4)
                  (pred_10 ?v11) (pred_4 ?v4) (pred_12 ?v13 ?v11))
:effect (and (pred_4 ?v13) (pred_12 ?v4 ?v11)
        (not (pred_4 ?v4)) (not (pred_12 ?v13 ?v11))))

(:action op_5
:parameters (?v11 ?v3)
:precondition (and (pred_1 ?v11) (pred_6 ?v3) 
                  (pred_10 ?v11) (pred_4 ?v3))
:effect (and (pred_9 ) (pred_12 ?v3 ?v11) (not (pred_4 ?v3)))))


	

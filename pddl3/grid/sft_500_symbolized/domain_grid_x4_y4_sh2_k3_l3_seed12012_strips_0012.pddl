(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v8 ?v6)
             (pred_4 ?v4 ?v9)
             (pred_7 ?v8 ?v9)
             (pred_2 ?v3 ?v8 )
	     (pred_10 ?v8)
             (pred_8 ?v10)
             (pred_1 ?v4)
             (pred_3 ?v9)
             (pred_6 ?v8)
             (pred_9 ?v4)
             (pred_11 ?v8)
             (pred_12 ))



(:action op_5
:parameters (?v11 ?v1 ?v5 ?v7)
:precondition (and (pred_8 ?v11) (pred_8 ?v1) (pred_1 ?v5) (pred_3 ?v7)
          (pred_5 ?v11 ?v1) (pred_4 ?v5 ?v7)
                   (pred_7 ?v1 ?v7) (pred_10 ?v11) 
                   (pred_6 ?v1) (pred_9 ?v5))
:effect (and  (pred_11 ?v1) (not (pred_6 ?v1))))


(:action op_2
:parameters (?v11 ?v13)
:precondition (and (pred_8 ?v11) (pred_8 ?v13)
               (pred_10 ?v11) (pred_5 ?v11 ?v13) (pred_11 ?v13))
:effect (and (pred_10 ?v13) (not (pred_10 ?v11))))

(:action op_3
:parameters (?v11 ?v5)
:precondition (and (pred_8 ?v11) (pred_1 ?v5) 
                  (pred_10 ?v11) (pred_2 ?v5 ?v11) (pred_12 ))
:effect (and (pred_9 ?v5)
   (not (pred_2 ?v5 ?v11)) (not (pred_12 ))))


(:action op_4
:parameters (?v11 ?v2 ?v12)
:precondition (and (pred_8 ?v11) (pred_1 ?v2) (pred_1 ?v12)
                  (pred_10 ?v11) (pred_9 ?v12) (pred_2 ?v2 ?v11))
:effect (and (pred_9 ?v2) (pred_2 ?v12 ?v11)
        (not (pred_9 ?v12)) (not (pred_2 ?v2 ?v11))))

(:action op_1
:parameters (?v11 ?v5)
:precondition (and (pred_8 ?v11) (pred_1 ?v5) 
                  (pred_10 ?v11) (pred_9 ?v5))
:effect (and (pred_12 ) (pred_2 ?v5 ?v11) (not (pred_9 ?v5)))))


	

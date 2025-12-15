(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v4 ?v7)
             (pred_11 ?v9 ?v12)
             (pred_4 ?v4 ?v12)
             (pred_7 ?v10 ?v4 )
	     (pred_12 ?v4)
             (pred_2 ?v8)
             (pred_6 ?v9)
             (pred_8 ?v12)
             (pred_3 ?v4)
             (pred_9 ?v9)
             (pred_5 ?v4)
             (pred_10 ))



(:action op_5
:parameters (?v11 ?v1 ?v5 ?v3)
:precondition (and (pred_2 ?v11) (pred_2 ?v1) (pred_6 ?v5) (pred_8 ?v3)
          (pred_1 ?v11 ?v1) (pred_11 ?v5 ?v3)
                   (pred_4 ?v1 ?v3) (pred_12 ?v11) 
                   (pred_3 ?v1) (pred_9 ?v5))
:effect (and  (pred_5 ?v1) (not (pred_3 ?v1))))


(:action op_4
:parameters (?v11 ?v2)
:precondition (and (pred_2 ?v11) (pred_2 ?v2)
               (pred_12 ?v11) (pred_1 ?v11 ?v2) (pred_5 ?v2))
:effect (and (pred_12 ?v2) (not (pred_12 ?v11))))

(:action op_2
:parameters (?v11 ?v5)
:precondition (and (pred_2 ?v11) (pred_6 ?v5) 
                  (pred_12 ?v11) (pred_7 ?v5 ?v11) (pred_10 ))
:effect (and (pred_9 ?v5)
   (not (pred_7 ?v5 ?v11)) (not (pred_10 ))))


(:action op_1
:parameters (?v11 ?v13 ?v6)
:precondition (and (pred_2 ?v11) (pred_6 ?v13) (pred_6 ?v6)
                  (pred_12 ?v11) (pred_9 ?v6) (pred_7 ?v13 ?v11))
:effect (and (pred_9 ?v13) (pred_7 ?v6 ?v11)
        (not (pred_9 ?v6)) (not (pred_7 ?v13 ?v11))))

(:action op_3
:parameters (?v11 ?v5)
:precondition (and (pred_2 ?v11) (pred_6 ?v5) 
                  (pred_12 ?v11) (pred_9 ?v5))
:effect (and (pred_10 ) (pred_7 ?v5 ?v11) (not (pred_9 ?v5)))))


	

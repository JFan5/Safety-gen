(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v7 ?v6)
             (pred_2 ?v9 ?v12)
             (pred_1 ?v7 ?v12)
             (pred_4 ?v10 ?v7 )
	     (pred_11 ?v7)
             (pred_5 ?v8)
             (pred_8 ?v9)
             (pred_7 ?v12)
             (pred_6 ?v7)
             (pred_9 ?v9)
             (pred_10 ?v7)
             (pred_3 ))



(:action op_2
:parameters (?v4 ?v11 ?v1 ?v5)
:precondition (and (pred_5 ?v4) (pred_5 ?v11) (pred_8 ?v1) (pred_7 ?v5)
          (pred_12 ?v4 ?v11) (pred_2 ?v1 ?v5)
                   (pred_1 ?v11 ?v5) (pred_11 ?v4) 
                   (pred_6 ?v11) (pred_9 ?v1))
:effect (and  (pred_10 ?v11) (not (pred_6 ?v11))))


(:action op_4
:parameters (?v4 ?v13)
:precondition (and (pred_5 ?v4) (pred_5 ?v13)
               (pred_11 ?v4) (pred_12 ?v4 ?v13) (pred_10 ?v13))
:effect (and (pred_11 ?v13) (not (pred_11 ?v4))))

(:action op_3
:parameters (?v4 ?v1)
:precondition (and (pred_5 ?v4) (pred_8 ?v1) 
                  (pred_11 ?v4) (pred_4 ?v1 ?v4) (pred_3 ))
:effect (and (pred_9 ?v1)
   (not (pred_4 ?v1 ?v4)) (not (pred_3 ))))


(:action op_1
:parameters (?v4 ?v2 ?v3)
:precondition (and (pred_5 ?v4) (pred_8 ?v2) (pred_8 ?v3)
                  (pred_11 ?v4) (pred_9 ?v3) (pred_4 ?v2 ?v4))
:effect (and (pred_9 ?v2) (pred_4 ?v3 ?v4)
        (not (pred_9 ?v3)) (not (pred_4 ?v2 ?v4))))

(:action op_5
:parameters (?v4 ?v1)
:precondition (and (pred_5 ?v4) (pred_8 ?v1) 
                  (pred_11 ?v4) (pred_9 ?v1))
:effect (and (pred_3 ) (pred_4 ?v1 ?v4) (not (pred_9 ?v1)))))


	

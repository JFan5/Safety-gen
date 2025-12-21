(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v5 ?v7)
             (pred_6 ?v9 ?v13)
             (pred_12 ?v5 ?v13)
             (pred_4 ?v8 ?v5 )
	     (pred_5 ?v5)
             (pred_1 ?v12)
             (pred_9 ?v9)
             (pred_3 ?v13)
             (pred_10 ?v5)
             (pred_8 ?v9)
             (pred_2 ?v5)
             (pred_11 ))



(:action op_1
:parameters (?v4 ?v3 ?v1 ?v6)
:precondition (and (pred_1 ?v4) (pred_1 ?v3) (pred_9 ?v1) (pred_3 ?v6)
          (pred_7 ?v4 ?v3) (pred_6 ?v1 ?v6)
                   (pred_12 ?v3 ?v6) (pred_5 ?v4) 
                   (pred_10 ?v3) (pred_8 ?v1))
:effect (and  (pred_2 ?v3) (not (pred_10 ?v3))))


(:action op_2
:parameters (?v4 ?v10)
:precondition (and (pred_1 ?v4) (pred_1 ?v10)
               (pred_5 ?v4) (pred_7 ?v4 ?v10) (pred_2 ?v10))
:effect (and (pred_5 ?v10) (not (pred_5 ?v4))))

(:action op_4
:parameters (?v4 ?v1)
:precondition (and (pred_1 ?v4) (pred_9 ?v1) 
                  (pred_5 ?v4) (pred_4 ?v1 ?v4) (pred_11 ))
:effect (and (pred_8 ?v1)
   (not (pred_4 ?v1 ?v4)) (not (pred_11 ))))


(:action op_5
:parameters (?v4 ?v11 ?v2)
:precondition (and (pred_1 ?v4) (pred_9 ?v11) (pred_9 ?v2)
                  (pred_5 ?v4) (pred_8 ?v2) (pred_4 ?v11 ?v4))
:effect (and (pred_8 ?v11) (pred_4 ?v2 ?v4)
        (not (pred_8 ?v2)) (not (pred_4 ?v11 ?v4))))

(:action op_3
:parameters (?v4 ?v1)
:precondition (and (pred_1 ?v4) (pred_9 ?v1) 
                  (pred_5 ?v4) (pred_8 ?v1))
:effect (and (pred_11 ) (pred_4 ?v1 ?v4) (not (pred_8 ?v1)))))


	

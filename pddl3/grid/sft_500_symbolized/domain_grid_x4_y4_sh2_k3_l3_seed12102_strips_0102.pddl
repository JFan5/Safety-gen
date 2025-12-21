(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v11 ?v8)
             (pred_12 ?v9 ?v7)
             (pred_6 ?v11 ?v7)
             (pred_5 ?v12 ?v11 )
	     (pred_10 ?v11)
             (pred_8 ?v5)
             (pred_4 ?v9)
             (pred_2 ?v7)
             (pred_7 ?v11)
             (pred_3 ?v9)
             (pred_9 ?v11)
             (pred_1 ))



(:action op_3
:parameters (?v4 ?v2 ?v3 ?v13)
:precondition (and (pred_8 ?v4) (pred_8 ?v2) (pred_4 ?v3) (pred_2 ?v13)
          (pred_11 ?v4 ?v2) (pred_12 ?v3 ?v13)
                   (pred_6 ?v2 ?v13) (pred_10 ?v4) 
                   (pred_7 ?v2) (pred_3 ?v3))
:effect (and  (pred_9 ?v2) (not (pred_7 ?v2))))


(:action op_2
:parameters (?v4 ?v10)
:precondition (and (pred_8 ?v4) (pred_8 ?v10)
               (pred_10 ?v4) (pred_11 ?v4 ?v10) (pred_9 ?v10))
:effect (and (pred_10 ?v10) (not (pred_10 ?v4))))

(:action op_4
:parameters (?v4 ?v3)
:precondition (and (pred_8 ?v4) (pred_4 ?v3) 
                  (pred_10 ?v4) (pred_5 ?v3 ?v4) (pred_1 ))
:effect (and (pred_3 ?v3)
   (not (pred_5 ?v3 ?v4)) (not (pred_1 ))))


(:action op_5
:parameters (?v4 ?v1 ?v6)
:precondition (and (pred_8 ?v4) (pred_4 ?v1) (pred_4 ?v6)
                  (pred_10 ?v4) (pred_3 ?v6) (pred_5 ?v1 ?v4))
:effect (and (pred_3 ?v1) (pred_5 ?v6 ?v4)
        (not (pred_3 ?v6)) (not (pred_5 ?v1 ?v4))))

(:action op_1
:parameters (?v4 ?v3)
:precondition (and (pred_8 ?v4) (pred_4 ?v3) 
                  (pred_10 ?v4) (pred_3 ?v3))
:effect (and (pred_1 ) (pred_5 ?v3 ?v4) (not (pred_3 ?v3)))))


	

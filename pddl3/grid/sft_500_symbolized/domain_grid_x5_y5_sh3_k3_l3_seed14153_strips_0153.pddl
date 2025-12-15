(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v9 ?v2)
             (pred_2 ?v10 ?v8)
             (pred_5 ?v9 ?v8)
             (pred_1 ?v7 ?v9 )
	     (pred_8 ?v9)
             (pred_3 ?v3)
             (pred_10 ?v10)
             (pred_7 ?v8)
             (pred_12 ?v9)
             (pred_4 ?v10)
             (pred_6 ?v9)
             (pred_9 ))



(:action op_3
:parameters (?v4 ?v6 ?v11 ?v13)
:precondition (and (pred_3 ?v4) (pred_3 ?v6) (pred_10 ?v11) (pred_7 ?v13)
          (pred_11 ?v4 ?v6) (pred_2 ?v11 ?v13)
                   (pred_5 ?v6 ?v13) (pred_8 ?v4) 
                   (pred_12 ?v6) (pred_4 ?v11))
:effect (and  (pred_6 ?v6) (not (pred_12 ?v6))))


(:action op_2
:parameters (?v4 ?v1)
:precondition (and (pred_3 ?v4) (pred_3 ?v1)
               (pred_8 ?v4) (pred_11 ?v4 ?v1) (pred_6 ?v1))
:effect (and (pred_8 ?v1) (not (pred_8 ?v4))))

(:action op_4
:parameters (?v4 ?v11)
:precondition (and (pred_3 ?v4) (pred_10 ?v11) 
                  (pred_8 ?v4) (pred_1 ?v11 ?v4) (pred_9 ))
:effect (and (pred_4 ?v11)
   (not (pred_1 ?v11 ?v4)) (not (pred_9 ))))


(:action op_5
:parameters (?v4 ?v5 ?v12)
:precondition (and (pred_3 ?v4) (pred_10 ?v5) (pred_10 ?v12)
                  (pred_8 ?v4) (pred_4 ?v12) (pred_1 ?v5 ?v4))
:effect (and (pred_4 ?v5) (pred_1 ?v12 ?v4)
        (not (pred_4 ?v12)) (not (pred_1 ?v5 ?v4))))

(:action op_1
:parameters (?v4 ?v11)
:precondition (and (pred_3 ?v4) (pred_10 ?v11) 
                  (pred_8 ?v4) (pred_4 ?v11))
:effect (and (pred_9 ) (pred_1 ?v11 ?v4) (not (pred_4 ?v11)))))


	

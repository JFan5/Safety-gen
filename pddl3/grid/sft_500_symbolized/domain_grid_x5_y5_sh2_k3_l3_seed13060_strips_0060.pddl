(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v1 ?v3)
             (pred_7 ?v13 ?v7)
             (pred_3 ?v1 ?v7)
             (pred_11 ?v9 ?v1 )
	     (pred_2 ?v1)
             (pred_1 ?v8)
             (pred_4 ?v13)
             (pred_8 ?v7)
             (pred_5 ?v1)
             (pred_12 ?v13)
             (pred_6 ?v1)
             (pred_9 ))



(:action op_2
:parameters (?v12 ?v6 ?v5 ?v2)
:precondition (and (pred_1 ?v12) (pred_1 ?v6) (pred_4 ?v5) (pred_8 ?v2)
          (pred_10 ?v12 ?v6) (pred_7 ?v5 ?v2)
                   (pred_3 ?v6 ?v2) (pred_2 ?v12) 
                   (pred_5 ?v6) (pred_12 ?v5))
:effect (and  (pred_6 ?v6) (not (pred_5 ?v6))))


(:action op_3
:parameters (?v12 ?v4)
:precondition (and (pred_1 ?v12) (pred_1 ?v4)
               (pred_2 ?v12) (pred_10 ?v12 ?v4) (pred_6 ?v4))
:effect (and (pred_2 ?v4) (not (pred_2 ?v12))))

(:action op_5
:parameters (?v12 ?v5)
:precondition (and (pred_1 ?v12) (pred_4 ?v5) 
                  (pred_2 ?v12) (pred_11 ?v5 ?v12) (pred_9 ))
:effect (and (pred_12 ?v5)
   (not (pred_11 ?v5 ?v12)) (not (pred_9 ))))


(:action op_4
:parameters (?v12 ?v10 ?v11)
:precondition (and (pred_1 ?v12) (pred_4 ?v10) (pred_4 ?v11)
                  (pred_2 ?v12) (pred_12 ?v11) (pred_11 ?v10 ?v12))
:effect (and (pred_12 ?v10) (pred_11 ?v11 ?v12)
        (not (pred_12 ?v11)) (not (pred_11 ?v10 ?v12))))

(:action op_1
:parameters (?v12 ?v5)
:precondition (and (pred_1 ?v12) (pred_4 ?v5) 
                  (pred_2 ?v12) (pred_12 ?v5))
:effect (and (pred_9 ) (pred_11 ?v5 ?v12) (not (pred_12 ?v5)))))


	

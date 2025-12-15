(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v1 ?v8)
             (pred_3 ?v9 ?v11)
             (pred_11 ?v1 ?v11)
             (pred_7 ?v2 ?v1 )
	     (pred_12 ?v1)
             (pred_5 ?v7)
             (pred_8 ?v9)
             (pred_9 ?v11)
             (pred_6 ?v1)
             (pred_10 ?v9)
             (pred_4 ?v1)
             (pred_1 ))



(:action op_4
:parameters (?v12 ?v6 ?v5 ?v13)
:precondition (and (pred_5 ?v12) (pred_5 ?v6) (pred_8 ?v5) (pred_9 ?v13)
          (pred_2 ?v12 ?v6) (pred_3 ?v5 ?v13)
                   (pred_11 ?v6 ?v13) (pred_12 ?v12) 
                   (pred_6 ?v6) (pred_10 ?v5))
:effect (and  (pred_4 ?v6) (not (pred_6 ?v6))))


(:action op_2
:parameters (?v12 ?v10)
:precondition (and (pred_5 ?v12) (pred_5 ?v10)
               (pred_12 ?v12) (pred_2 ?v12 ?v10) (pred_4 ?v10))
:effect (and (pred_12 ?v10) (not (pred_12 ?v12))))

(:action op_5
:parameters (?v12 ?v5)
:precondition (and (pred_5 ?v12) (pred_8 ?v5) 
                  (pred_12 ?v12) (pred_7 ?v5 ?v12) (pred_1 ))
:effect (and (pred_10 ?v5)
   (not (pred_7 ?v5 ?v12)) (not (pred_1 ))))


(:action op_3
:parameters (?v12 ?v4 ?v3)
:precondition (and (pred_5 ?v12) (pred_8 ?v4) (pred_8 ?v3)
                  (pred_12 ?v12) (pred_10 ?v3) (pred_7 ?v4 ?v12))
:effect (and (pred_10 ?v4) (pred_7 ?v3 ?v12)
        (not (pred_10 ?v3)) (not (pred_7 ?v4 ?v12))))

(:action op_1
:parameters (?v12 ?v5)
:precondition (and (pred_5 ?v12) (pred_8 ?v5) 
                  (pred_12 ?v12) (pred_10 ?v5))
:effect (and (pred_1 ) (pred_7 ?v5 ?v12) (not (pred_10 ?v5)))))


	

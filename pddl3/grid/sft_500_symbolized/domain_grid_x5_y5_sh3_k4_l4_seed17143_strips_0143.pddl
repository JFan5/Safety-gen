(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v9 ?v8)
             (pred_12 ?v10 ?v11)
             (pred_1 ?v9 ?v11)
             (pred_6 ?v7 ?v9 )
	     (pred_2 ?v9)
             (pred_10 ?v12)
             (pred_8 ?v10)
             (pred_4 ?v11)
             (pred_3 ?v9)
             (pred_11 ?v10)
             (pred_5 ?v9)
             (pred_7 ))



(:action op_5
:parameters (?v5 ?v6 ?v1 ?v3)
:precondition (and (pred_10 ?v5) (pred_10 ?v6) (pred_8 ?v1) (pred_4 ?v3)
          (pred_9 ?v5 ?v6) (pred_12 ?v1 ?v3)
                   (pred_1 ?v6 ?v3) (pred_2 ?v5) 
                   (pred_3 ?v6) (pred_11 ?v1))
:effect (and  (pred_5 ?v6) (not (pred_3 ?v6))))


(:action op_4
:parameters (?v5 ?v13)
:precondition (and (pred_10 ?v5) (pred_10 ?v13)
               (pred_2 ?v5) (pred_9 ?v5 ?v13) (pred_5 ?v13))
:effect (and (pred_2 ?v13) (not (pred_2 ?v5))))

(:action op_2
:parameters (?v5 ?v1)
:precondition (and (pred_10 ?v5) (pred_8 ?v1) 
                  (pred_2 ?v5) (pred_6 ?v1 ?v5) (pred_7 ))
:effect (and (pred_11 ?v1)
   (not (pred_6 ?v1 ?v5)) (not (pred_7 ))))


(:action op_3
:parameters (?v5 ?v2 ?v4)
:precondition (and (pred_10 ?v5) (pred_8 ?v2) (pred_8 ?v4)
                  (pred_2 ?v5) (pred_11 ?v4) (pred_6 ?v2 ?v5))
:effect (and (pred_11 ?v2) (pred_6 ?v4 ?v5)
        (not (pred_11 ?v4)) (not (pred_6 ?v2 ?v5))))

(:action op_1
:parameters (?v5 ?v1)
:precondition (and (pred_10 ?v5) (pred_8 ?v1) 
                  (pred_2 ?v5) (pred_11 ?v1))
:effect (and (pred_7 ) (pred_6 ?v1 ?v5) (not (pred_11 ?v1)))))


	

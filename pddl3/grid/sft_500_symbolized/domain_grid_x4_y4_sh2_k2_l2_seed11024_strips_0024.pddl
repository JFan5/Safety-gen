(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v7 ?v13)
             (pred_4 ?v11 ?v9)
             (pred_7 ?v7 ?v9)
             (pred_8 ?v8 ?v7 )
	     (pred_6 ?v7)
             (pred_3 ?v3)
             (pred_2 ?v11)
             (pred_5 ?v9)
             (pred_9 ?v7)
             (pred_12 ?v11)
             (pred_10 ?v7)
             (pred_11 ))



(:action op_1
:parameters (?v5 ?v1 ?v6 ?v10)
:precondition (and (pred_3 ?v5) (pred_3 ?v1) (pred_2 ?v6) (pred_5 ?v10)
          (pred_1 ?v5 ?v1) (pred_4 ?v6 ?v10)
                   (pred_7 ?v1 ?v10) (pred_6 ?v5) 
                   (pred_9 ?v1) (pred_12 ?v6))
:effect (and  (pred_10 ?v1) (not (pred_9 ?v1))))


(:action op_3
:parameters (?v5 ?v4)
:precondition (and (pred_3 ?v5) (pred_3 ?v4)
               (pred_6 ?v5) (pred_1 ?v5 ?v4) (pred_10 ?v4))
:effect (and (pred_6 ?v4) (not (pred_6 ?v5))))

(:action op_2
:parameters (?v5 ?v6)
:precondition (and (pred_3 ?v5) (pred_2 ?v6) 
                  (pred_6 ?v5) (pred_8 ?v6 ?v5) (pred_11 ))
:effect (and (pred_12 ?v6)
   (not (pred_8 ?v6 ?v5)) (not (pred_11 ))))


(:action op_4
:parameters (?v5 ?v2 ?v12)
:precondition (and (pred_3 ?v5) (pred_2 ?v2) (pred_2 ?v12)
                  (pred_6 ?v5) (pred_12 ?v12) (pred_8 ?v2 ?v5))
:effect (and (pred_12 ?v2) (pred_8 ?v12 ?v5)
        (not (pred_12 ?v12)) (not (pred_8 ?v2 ?v5))))

(:action op_5
:parameters (?v5 ?v6)
:precondition (and (pred_3 ?v5) (pred_2 ?v6) 
                  (pred_6 ?v5) (pred_12 ?v6))
:effect (and (pred_11 ) (pred_8 ?v6 ?v5) (not (pred_12 ?v6)))))


	

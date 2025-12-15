(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v10 ?v9)
             (pred_4 ?v3 ?v11)
             (pred_6 ?v10 ?v11)
             (pred_10 ?v8 ?v10 )
	     (pred_12 ?v10)
             (pred_2 ?v13)
             (pred_5 ?v3)
             (pred_8 ?v11)
             (pred_9 ?v10)
             (pred_11 ?v3)
             (pred_7 ?v10)
             (pred_3 ))



(:action op_1
:parameters (?v5 ?v7 ?v6 ?v12)
:precondition (and (pred_2 ?v5) (pred_2 ?v7) (pred_5 ?v6) (pred_8 ?v12)
          (pred_1 ?v5 ?v7) (pred_4 ?v6 ?v12)
                   (pred_6 ?v7 ?v12) (pred_12 ?v5) 
                   (pred_9 ?v7) (pred_11 ?v6))
:effect (and  (pred_7 ?v7) (not (pred_9 ?v7))))


(:action op_5
:parameters (?v5 ?v2)
:precondition (and (pred_2 ?v5) (pred_2 ?v2)
               (pred_12 ?v5) (pred_1 ?v5 ?v2) (pred_7 ?v2))
:effect (and (pred_12 ?v2) (not (pred_12 ?v5))))

(:action op_4
:parameters (?v5 ?v6)
:precondition (and (pred_2 ?v5) (pred_5 ?v6) 
                  (pred_12 ?v5) (pred_10 ?v6 ?v5) (pred_3 ))
:effect (and (pred_11 ?v6)
   (not (pred_10 ?v6 ?v5)) (not (pred_3 ))))


(:action op_3
:parameters (?v5 ?v1 ?v4)
:precondition (and (pred_2 ?v5) (pred_5 ?v1) (pred_5 ?v4)
                  (pred_12 ?v5) (pred_11 ?v4) (pred_10 ?v1 ?v5))
:effect (and (pred_11 ?v1) (pred_10 ?v4 ?v5)
        (not (pred_11 ?v4)) (not (pred_10 ?v1 ?v5))))

(:action op_2
:parameters (?v5 ?v6)
:precondition (and (pred_2 ?v5) (pred_5 ?v6) 
                  (pred_12 ?v5) (pred_11 ?v6))
:effect (and (pred_3 ) (pred_10 ?v6 ?v5) (not (pred_11 ?v6)))))


	

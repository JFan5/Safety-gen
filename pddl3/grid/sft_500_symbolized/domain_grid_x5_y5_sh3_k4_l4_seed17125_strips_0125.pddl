(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v11 ?v8)
             (pred_7 ?v9 ?v3)
             (pred_5 ?v11 ?v3)
             (pred_10 ?v13 ?v11 )
	     (pred_6 ?v11)
             (pred_9 ?v10)
             (pred_4 ?v9)
             (pred_1 ?v3)
             (pred_8 ?v11)
             (pred_3 ?v9)
             (pred_11 ?v11)
             (pred_12 ))



(:action op_3
:parameters (?v5 ?v2 ?v6 ?v12)
:precondition (and (pred_9 ?v5) (pred_9 ?v2) (pred_4 ?v6) (pred_1 ?v12)
          (pred_2 ?v5 ?v2) (pred_7 ?v6 ?v12)
                   (pred_5 ?v2 ?v12) (pred_6 ?v5) 
                   (pred_8 ?v2) (pred_3 ?v6))
:effect (and  (pred_11 ?v2) (not (pred_8 ?v2))))


(:action op_1
:parameters (?v5 ?v4)
:precondition (and (pred_9 ?v5) (pred_9 ?v4)
               (pred_6 ?v5) (pred_2 ?v5 ?v4) (pred_11 ?v4))
:effect (and (pred_6 ?v4) (not (pred_6 ?v5))))

(:action op_5
:parameters (?v5 ?v6)
:precondition (and (pred_9 ?v5) (pred_4 ?v6) 
                  (pred_6 ?v5) (pred_10 ?v6 ?v5) (pred_12 ))
:effect (and (pred_3 ?v6)
   (not (pred_10 ?v6 ?v5)) (not (pred_12 ))))


(:action op_4
:parameters (?v5 ?v7 ?v1)
:precondition (and (pred_9 ?v5) (pred_4 ?v7) (pred_4 ?v1)
                  (pred_6 ?v5) (pred_3 ?v1) (pred_10 ?v7 ?v5))
:effect (and (pred_3 ?v7) (pred_10 ?v1 ?v5)
        (not (pred_3 ?v1)) (not (pred_10 ?v7 ?v5))))

(:action op_2
:parameters (?v5 ?v6)
:precondition (and (pred_9 ?v5) (pred_4 ?v6) 
                  (pred_6 ?v5) (pred_3 ?v6))
:effect (and (pred_12 ) (pred_10 ?v6 ?v5) (not (pred_3 ?v6)))))


	

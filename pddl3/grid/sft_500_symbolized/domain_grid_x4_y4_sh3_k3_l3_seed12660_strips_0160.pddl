(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v11 ?v9)
             (pred_11 ?v4 ?v3)
             (pred_5 ?v11 ?v3)
             (pred_2 ?v13 ?v11 )
	     (pred_7 ?v11)
             (pred_10 ?v10)
             (pred_3 ?v4)
             (pred_8 ?v3)
             (pred_4 ?v11)
             (pred_6 ?v4)
             (pred_9 ?v11)
             (pred_1 ))



(:action op_5
:parameters (?v5 ?v1 ?v2 ?v7)
:precondition (and (pred_10 ?v5) (pred_10 ?v1) (pred_3 ?v2) (pred_8 ?v7)
          (pred_12 ?v5 ?v1) (pred_11 ?v2 ?v7)
                   (pred_5 ?v1 ?v7) (pred_7 ?v5) 
                   (pred_4 ?v1) (pred_6 ?v2))
:effect (and  (pred_9 ?v1) (not (pred_4 ?v1))))


(:action op_3
:parameters (?v5 ?v8)
:precondition (and (pred_10 ?v5) (pred_10 ?v8)
               (pred_7 ?v5) (pred_12 ?v5 ?v8) (pred_9 ?v8))
:effect (and (pred_7 ?v8) (not (pred_7 ?v5))))

(:action op_4
:parameters (?v5 ?v2)
:precondition (and (pred_10 ?v5) (pred_3 ?v2) 
                  (pred_7 ?v5) (pred_2 ?v2 ?v5) (pred_1 ))
:effect (and (pred_6 ?v2)
   (not (pred_2 ?v2 ?v5)) (not (pred_1 ))))


(:action op_1
:parameters (?v5 ?v6 ?v12)
:precondition (and (pred_10 ?v5) (pred_3 ?v6) (pred_3 ?v12)
                  (pred_7 ?v5) (pred_6 ?v12) (pred_2 ?v6 ?v5))
:effect (and (pred_6 ?v6) (pred_2 ?v12 ?v5)
        (not (pred_6 ?v12)) (not (pred_2 ?v6 ?v5))))

(:action op_2
:parameters (?v5 ?v2)
:precondition (and (pred_10 ?v5) (pred_3 ?v2) 
                  (pred_7 ?v5) (pred_6 ?v2))
:effect (and (pred_1 ) (pred_2 ?v2 ?v5) (not (pred_6 ?v2)))))


	

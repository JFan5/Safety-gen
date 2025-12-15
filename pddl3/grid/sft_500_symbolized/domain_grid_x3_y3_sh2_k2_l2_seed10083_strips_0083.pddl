(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v4 ?v6)
             (pred_4 ?v8 ?v12)
             (pred_12 ?v4 ?v12)
             (pred_9 ?v13 ?v4 )
	     (pred_2 ?v4)
             (pred_10 ?v3)
             (pred_11 ?v8)
             (pred_1 ?v12)
             (pred_7 ?v4)
             (pred_6 ?v8)
             (pred_5 ?v4)
             (pred_8 ))



(:action op_4
:parameters (?v5 ?v7 ?v2 ?v1)
:precondition (and (pred_10 ?v5) (pred_10 ?v7) (pred_11 ?v2) (pred_1 ?v1)
          (pred_3 ?v5 ?v7) (pred_4 ?v2 ?v1)
                   (pred_12 ?v7 ?v1) (pred_2 ?v5) 
                   (pred_7 ?v7) (pred_6 ?v2))
:effect (and  (pred_5 ?v7) (not (pred_7 ?v7))))


(:action op_2
:parameters (?v5 ?v10)
:precondition (and (pred_10 ?v5) (pred_10 ?v10)
               (pred_2 ?v5) (pred_3 ?v5 ?v10) (pred_5 ?v10))
:effect (and (pred_2 ?v10) (not (pred_2 ?v5))))

(:action op_5
:parameters (?v5 ?v2)
:precondition (and (pred_10 ?v5) (pred_11 ?v2) 
                  (pred_2 ?v5) (pred_9 ?v2 ?v5) (pred_8 ))
:effect (and (pred_6 ?v2)
   (not (pred_9 ?v2 ?v5)) (not (pred_8 ))))


(:action op_3
:parameters (?v5 ?v11 ?v9)
:precondition (and (pred_10 ?v5) (pred_11 ?v11) (pred_11 ?v9)
                  (pred_2 ?v5) (pred_6 ?v9) (pred_9 ?v11 ?v5))
:effect (and (pred_6 ?v11) (pred_9 ?v9 ?v5)
        (not (pred_6 ?v9)) (not (pred_9 ?v11 ?v5))))

(:action op_1
:parameters (?v5 ?v2)
:precondition (and (pred_10 ?v5) (pred_11 ?v2) 
                  (pred_2 ?v5) (pred_6 ?v2))
:effect (and (pred_8 ) (pred_9 ?v2 ?v5) (not (pred_6 ?v2)))))


	

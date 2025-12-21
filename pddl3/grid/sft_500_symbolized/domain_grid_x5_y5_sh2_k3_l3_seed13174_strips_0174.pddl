(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v13 ?v3)
             (pred_1 ?v4 ?v11)
             (pred_10 ?v13 ?v11)
             (pred_8 ?v7 ?v13 )
	     (pred_9 ?v13)
             (pred_6 ?v9)
             (pred_2 ?v4)
             (pred_7 ?v11)
             (pred_3 ?v13)
             (pred_4 ?v4)
             (pred_12 ?v13)
             (pred_5 ))



(:action op_2
:parameters (?v6 ?v1 ?v5 ?v8)
:precondition (and (pred_6 ?v6) (pred_6 ?v1) (pred_2 ?v5) (pred_7 ?v8)
          (pred_11 ?v6 ?v1) (pred_1 ?v5 ?v8)
                   (pred_10 ?v1 ?v8) (pred_9 ?v6) 
                   (pred_3 ?v1) (pred_4 ?v5))
:effect (and  (pred_12 ?v1) (not (pred_3 ?v1))))


(:action op_4
:parameters (?v6 ?v12)
:precondition (and (pred_6 ?v6) (pred_6 ?v12)
               (pred_9 ?v6) (pred_11 ?v6 ?v12) (pred_12 ?v12))
:effect (and (pred_9 ?v12) (not (pred_9 ?v6))))

(:action op_5
:parameters (?v6 ?v5)
:precondition (and (pred_6 ?v6) (pred_2 ?v5) 
                  (pred_9 ?v6) (pred_8 ?v5 ?v6) (pred_5 ))
:effect (and (pred_4 ?v5)
   (not (pred_8 ?v5 ?v6)) (not (pred_5 ))))


(:action op_3
:parameters (?v6 ?v10 ?v2)
:precondition (and (pred_6 ?v6) (pred_2 ?v10) (pred_2 ?v2)
                  (pred_9 ?v6) (pred_4 ?v2) (pred_8 ?v10 ?v6))
:effect (and (pred_4 ?v10) (pred_8 ?v2 ?v6)
        (not (pred_4 ?v2)) (not (pred_8 ?v10 ?v6))))

(:action op_1
:parameters (?v6 ?v5)
:precondition (and (pred_6 ?v6) (pred_2 ?v5) 
                  (pred_9 ?v6) (pred_4 ?v5))
:effect (and (pred_5 ) (pred_8 ?v5 ?v6) (not (pred_4 ?v5)))))


	

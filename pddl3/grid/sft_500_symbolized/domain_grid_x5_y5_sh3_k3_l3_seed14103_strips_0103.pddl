(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v13 ?v5)
             (pred_3 ?v1 ?v8)
             (pred_10 ?v13 ?v8)
             (pred_6 ?v11 ?v13 )
	     (pred_8 ?v13)
             (pred_2 ?v12)
             (pred_9 ?v1)
             (pred_5 ?v8)
             (pred_7 ?v13)
             (pred_11 ?v1)
             (pred_4 ?v13)
             (pred_12 ))



(:action op_3
:parameters (?v6 ?v9 ?v10 ?v4)
:precondition (and (pred_2 ?v6) (pred_2 ?v9) (pred_9 ?v10) (pred_5 ?v4)
          (pred_1 ?v6 ?v9) (pred_3 ?v10 ?v4)
                   (pred_10 ?v9 ?v4) (pred_8 ?v6) 
                   (pred_7 ?v9) (pred_11 ?v10))
:effect (and  (pred_4 ?v9) (not (pred_7 ?v9))))


(:action op_2
:parameters (?v6 ?v2)
:precondition (and (pred_2 ?v6) (pred_2 ?v2)
               (pred_8 ?v6) (pred_1 ?v6 ?v2) (pred_4 ?v2))
:effect (and (pred_8 ?v2) (not (pred_8 ?v6))))

(:action op_5
:parameters (?v6 ?v10)
:precondition (and (pred_2 ?v6) (pred_9 ?v10) 
                  (pred_8 ?v6) (pred_6 ?v10 ?v6) (pred_12 ))
:effect (and (pred_11 ?v10)
   (not (pred_6 ?v10 ?v6)) (not (pred_12 ))))


(:action op_1
:parameters (?v6 ?v7 ?v3)
:precondition (and (pred_2 ?v6) (pred_9 ?v7) (pred_9 ?v3)
                  (pred_8 ?v6) (pred_11 ?v3) (pred_6 ?v7 ?v6))
:effect (and (pred_11 ?v7) (pred_6 ?v3 ?v6)
        (not (pred_11 ?v3)) (not (pred_6 ?v7 ?v6))))

(:action op_4
:parameters (?v6 ?v10)
:precondition (and (pred_2 ?v6) (pred_9 ?v10) 
                  (pred_8 ?v6) (pred_11 ?v10))
:effect (and (pred_12 ) (pred_6 ?v10 ?v6) (not (pred_11 ?v10)))))


	

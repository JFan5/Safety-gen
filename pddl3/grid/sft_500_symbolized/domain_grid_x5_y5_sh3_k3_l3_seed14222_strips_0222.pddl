(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v8 ?v11)
             (pred_5 ?v10 ?v12)
             (pred_3 ?v8 ?v12)
             (pred_9 ?v7 ?v8 )
	     (pred_8 ?v8)
             (pred_6 ?v4)
             (pred_4 ?v10)
             (pred_10 ?v12)
             (pred_11 ?v8)
             (pred_7 ?v10)
             (pred_1 ?v8)
             (pred_2 ))



(:action op_1
:parameters (?v6 ?v9 ?v5 ?v1)
:precondition (and (pred_6 ?v6) (pred_6 ?v9) (pred_4 ?v5) (pred_10 ?v1)
          (pred_12 ?v6 ?v9) (pred_5 ?v5 ?v1)
                   (pred_3 ?v9 ?v1) (pred_8 ?v6) 
                   (pred_11 ?v9) (pred_7 ?v5))
:effect (and  (pred_1 ?v9) (not (pred_11 ?v9))))


(:action op_2
:parameters (?v6 ?v13)
:precondition (and (pred_6 ?v6) (pred_6 ?v13)
               (pred_8 ?v6) (pred_12 ?v6 ?v13) (pred_1 ?v13))
:effect (and (pred_8 ?v13) (not (pred_8 ?v6))))

(:action op_3
:parameters (?v6 ?v5)
:precondition (and (pred_6 ?v6) (pred_4 ?v5) 
                  (pred_8 ?v6) (pred_9 ?v5 ?v6) (pred_2 ))
:effect (and (pred_7 ?v5)
   (not (pred_9 ?v5 ?v6)) (not (pred_2 ))))


(:action op_4
:parameters (?v6 ?v3 ?v2)
:precondition (and (pred_6 ?v6) (pred_4 ?v3) (pred_4 ?v2)
                  (pred_8 ?v6) (pred_7 ?v2) (pred_9 ?v3 ?v6))
:effect (and (pred_7 ?v3) (pred_9 ?v2 ?v6)
        (not (pred_7 ?v2)) (not (pred_9 ?v3 ?v6))))

(:action op_5
:parameters (?v6 ?v5)
:precondition (and (pred_6 ?v6) (pred_4 ?v5) 
                  (pred_8 ?v6) (pred_7 ?v5))
:effect (and (pred_2 ) (pred_9 ?v5 ?v6) (not (pred_7 ?v5)))))


	
